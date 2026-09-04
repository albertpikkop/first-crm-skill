# Build My First CRM

A skill for a non-technical person's first working customer-enquiry system, built from their
`BUSINESS-TRUTH.md`:

```text
Landing page -> enquiry form -> the student's own Supabase project -> operator login -> enquiry list
```

It is the second of three skills that share one method and one file. The method is
[noguess](https://github.com/albertpikkop/noguess-prompt-skill) (the TCE + NHA loop: a gap analysis first, a
truth file, one task at a time, a check at the end). The third is
[remotion-ffmpeg-video](https://github.com/albertpikkop/remotion-ffmpeg-video-skill).

On Codex it builds with the Sites and Supabase plugins. On Claude Code, Cursor or any other
agent it builds a static page with the Supabase browser client on a host the student already
has. It asks before every account, cost, install and deploy, publishes privately first, and
never calls the CRM ready without sending one fake enquiry through the real form.

## Before you start

Day-one setup for all three skills, per machine (Node, Supabase account, the plugins or the
MCP connection, Windows paths), is in the shared
[SETUP.md](https://github.com/albertpikkop/noguess-prompt-skill/blob/main/SETUP.md). This repo's own
[SETUP.md](SETUP.md) lists only what this skill needs.

## Install

**Claude Code** (the three skills share one marketplace):

```bash
claude plugin marketplace add albertpikkop/noguess-prompt-skill
```

```bash
claude plugin install build-first-crm@ashishpunj
```

**Any agent, from GitHub:**

```bash
npx skills add albertpikkop/first-crm-skill
```

**Codex, by hand:** copy `skills/build-first-crm` into `~/.codex/skills/` on Mac or
`%USERPROFILE%\.codex\skills\` on Windows. Codex lists it on its next start.

## Use

With a `BUSINESS-TRUTH.md` already written by `noguess`, just say "build my first CRM". Without
one, the skill runs the same six-step gap analysis first and writes the file after you say yes.
Codex users can type `Use $build-first-crm to build my first CRM.`

## Beginner exercise

[EXERCISE.md](EXERCISE.md), with a fictional business and fake enquiry data. Each student uses
their own Supabase project.

## What is in the skill

- `skills/build-first-crm/SKILL.md`: the stages. The machine first, the truth file, the
  preflight, the build, the proof, and change requests (the day-two skill).
- `references/`: business intake, the Supabase setup with row level security and column-level
  grants, the product contract, the Sites path, the static path for other agents, verification.
- `assets/BUSINESS-TRUTH-TEMPLATE.md`: the one file all three skills share.
- `evals/`: the test asks and the checks used to grade it.

## Upgrading (for the maintainer)

Edit under `skills/build-first-crm/`, add a section to `CHANGELOG.md`, bump the version in
`.claude-plugin/plugin.json`, tag, push. Students update with
`claude plugin marketplace update ashishpunj` and reinstall, or `npx skills update`.

## Licence

MIT. See [LICENSE](LICENSE). Method by Ashish Punj; please keep the credit line.
