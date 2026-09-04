#!/usr/bin/env bash
# Release a new version of the build-first-crm skill.
#   scripts/release.sh 0.3.0 "one line on what changed"
# Checks the changelog has the section and no banned dashes, bumps plugin.json, packages
# dist/build-first-crm.skill (the skill folder without evals), commits, tags, pushes, creates the release.
set -euo pipefail
V="${1:?version like 0.3.0}"; NOTE="${2:?one line on what changed}"
cd "$(dirname "$0")/.."
grep -q "## v$V" CHANGELOG.md || { echo "add a '## v$V' section to CHANGELOG.md first"; exit 1; }
grep -rq -E "—|–" skills/build-first-crm && { echo "em or en dash found in the skill; the method bans them"; exit 1; }
python3 - "$V" <<'PY'
import json, sys
p = ".claude-plugin/plugin.json"; d = json.load(open(p)); d["version"] = sys.argv[1]
json.dump(d, open(p, "w"), indent=2); open(p, "a").write("\n")
PY
mkdir -p dist; rm -f dist/build-first-crm.skill
( cd skills && zip -qr ../dist/build-first-crm.skill build-first-crm -x "build-first-crm/evals/*" "*/.DS_Store" "*/__pycache__/*" )
git add -A; git commit -q -m "build-first-crm v$V: $NOTE"
git tag -a "v$V" -m "v$V: $NOTE"; git push -q origin main; git push -q origin "v$V"
gh release create "v$V" dist/build-first-crm.skill --title "build-first-crm v$V" --notes "$NOTE. Full notes in CHANGELOG.md."
echo "released v$V. Students update with: claude plugin marketplace update ashishpunj && claude plugin install build-first-crm@ashishpunj"
