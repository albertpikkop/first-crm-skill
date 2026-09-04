---
name: build-first-crm
description: >-
  Build a non-technical person's first working CRM from BUSINESS-TRUTH.md: one landing
  page, one enquiry form, storage in the student's own Supabase project, one operator
  email-and-password login, one read-only enquiry list. On Codex it uses the Sites and
  Supabase plugins; on Claude Code or any other agent it builds a static page with the
  Supabase browser client on a host the student has. Use when someone says "build me my
  first CRM", "mera pehla CRM banao", "I want an enquiry form for my business", "leads
  page chahiye", or wants to review, verify, change or redeploy a CRM this skill built
  ("add a WhatsApp button to the page you built", "is my CRM right?"). If no truth file
  exists yet, the noguess skill runs its gap analysis first; this skill starts from the
  approved file and never asks the same questions twice. Not for messaging automation,
  billing, analytics, staff roles or an existing complex CRM: say so and stop.
---

# Build My First CRM

## Outcome

Turn an approved `BUSINESS-TRUTH.md` into one small working loop, owned by the student:

```text
Visitor opens the landing page
Visitor sends an enquiry
The student's Supabase project stores it
The operator signs in
The operator sees the same enquiry
```

Speak in plain words. One recommendation at each decision. Technical detail stays behind the
work unless the person must act on it. Answer in the language the person wrote in; the file
headings and [PENDING] stay in English. No em-dashes in text you write.

## Not this skill, and when to stand down

- Messaging automation, billing, analytics, staff roles, customer accounts, a second business
  in the same project, or an existing complex CRM: say in one line that this skill builds
  only the first loop, and stop.
- A small change to a CRM this skill built ("add a WhatsApp button", "change the phone
  number"): go straight to Stage 5. No interview.
- A question ("is my CRM right?", "why can nobody open my page?"): answer it in three lines
  first, using the check in Stage 4, then offer the fix.

Nothing here is permission. Installing this skill does not authorize creating a project,
accepting a cost, connecting an account, publishing a page or installing a plugin. Each of
those gets its own yes.

## Stage 0: the machine, before the business

Check, in this order, and stop at the first gap with one plain next step (the full list is
in `SETUP.md` at the repo root):

1. **A Supabase connection.** On Codex: the Supabase plugin, signed in. On Claude Code: the
   Supabase MCP connection. If missing: "Supabase is not connected yet. Do this: [the one
   step from SETUP.md]. Then say done."
2. **A way to build and host the page.** On Codex with the Sites plugin enabled: the Sites
   path (`references/sites-build.md`). Anywhere else: the static path
   (`references/static-path.md`), one HTML page plus the Supabase browser client on a static
   host the student already has or can create for free. Name which path you are on.
3. **A Supabase account of the student's own.** Never a shared classroom project.

Never install a plugin or run an install command without saying what it is and getting a
yes. If no supported path exists, stop with `[PENDING: connect Supabase]` or
`[PENDING: choose a host]` and the one step that closes it.

## Stage 1: the truth file

If `BUSINESS-TRUTH.md` already exists (the `noguess` skill writes it), or a gap analysis
already ran in this conversation, read it and ask only what it does not answer: at most
three questions, one ask each. Do not run the interview again. A value that is plainly a
placeholder (an example.com address, 9999999999, "not decided", "TBD") counts as
[PENDING], not as an answer; the operator email in particular must be one the student can
open, because the password reset goes there.

If it does not exist, run the same six steps a student learned in `noguess`, with the same
labels, in plain text: 1. What I understood. 2. Facts vs assumptions (every guess labelled
Assumption). 3. Missing or unclear. 4. Your biggest unknown. 5. Three easiest questions to
answer next. 6. One small next move. Read `references/business-intake.md` for what to look
for in a business plan. Ask nothing the owner cannot answer from memory.

Then fill `assets/BUSINESS-TRUTH-TEMPLATE.md`, keep every unknown as [PENDING], show it, and
ask exactly one thing: "Is this right? Reply yes and I build from it." The required visitor
details, the optional ones and the consent sentence are [PENDING: confirm] until the owner
says yes to them; a tuition centre needs the child's class, a consultant wants email. Write
`BUSINESS-TRUTH.md` into the project only after the yes. Do not invent a name, offer, price,
address, phone number, proof, logo, colour, legal claim or testimonial. Never put a key, a
password or a customer's details in the file.

## Stage 2: the preflight

Before any external write, show this and wait for a yes:

```text
Business: [approved name]
Path: [Sites on Codex / static page on <host>]
Will create: [Supabase project or reuse <name>, two tables, one operator account, the page]
Will publish: private first, only you can open it. Say "publish publicly" when customers may.
Cost: [the amount and recurrence the Supabase tool reports, or "no added cost"]
Operator login: [email]; the password is generated and shown once
Still missing: [PENDING items, or none]
```

For a new Supabase project this is two exchanges, not one: first list the student's
organisations and ask which (that is the one question of this stage), then fetch that
organisation's current project cost and show the preflight above with the real amount in
the Cost line. The block is never shown with the cost missing. If a suitable project
exists, offer to reuse it.

"Private first" depends on the host. Sites and Cloudflare Pages can keep a page private or
unlisted; GitHub Pages is public from the first deploy. Say which case applies in the Will
publish line, and on a public-only host get the yes for public before deploying at all.

## Stage 3: build

Read `references/supabase-setup.md` before any Supabase write and `references/crm-contract.md`
before the form or the list. Build order:

1. Create or select the approved Supabase project.
2. Create the two tables, row level security and the column-level grants from the reference.
3. Create the operator account. The primary path is the Supabase dashboard: Authentication,
   Users, Add user, email and the generated password, auto-confirm ticked. Then read the
   user's ID back with the SQL in the reference and bind it in `crm_operators`.
4. Take only the project URL and an enabled publishable key into the page.
5. Build the page, the form, the login and the read-only list on the path chosen in Stage 0.
6. Validate locally. Deploy privately. Public is a separate yes.

Three rules that never bend: no secret or service-role key ever reaches the page, the repo,
a log or the chat; RLS is on before any real customer row; nothing on the page that
`BUSINESS-TRUTH.md` does not support.

If a student pastes a secret key into the chat anyway: do not repeat it, do not use it, and
say in one line where to roll it (Supabase, Project Settings, API keys, the service role key,
Regenerate) and why (a pasted key is in a transcript now). Then give the real fix. The
number one cause of "RLS blocks my form" is a read-back chained onto the insert; the page
inserts without asking for the row back.

Why Supabase and a login the student owns, when the host may offer its own storage and sign-in:
the student keeps the data and the account when they change hosts, teachers or agents. That is
the choice, made on purpose; override a host's default knowingly and say so once.

## Stage 4: prove it

Read `references/verification.md`. Do not call anything ready from a build command or an API
receipt. Before opening the page in a browser to test it, ask: "I need to open the page in a
browser to test the form. Ok?" If you have no browser tool, the browser checks become
[PENDING: you to confirm] with the exact steps for the student to do. Any check you could
not run is `not met` or [PENDING], never `met`.

Then the check, in this shape, the same one `noguess` uses:

```text
Invented: [anything on the page or in the data that BUSINESS-TRUTH.md does not support]
Checks: [every check in the reference, one per line: met / not met / [PENDING]]
Assumed without being told: [one per line]
Security: [advisor results, key scan, RLS, grants]
Remaining risk: [especially public-form spam limits]
Why: [one line]
The fix: [only what the check surfaced]
Next time: [the one line for BUSINESS-TRUTH.md under Prompting rules learned]
```

Fix only what it surfaced, rerun the affected check, then hand off with one status: `ready`,
`not ready` or `blocked`. The handoff gives the student the page link with the words "this
link is private, only you can open it; say publish publicly when customers may", the operator
login link and email, the password once with "save this now", where enquiries appear, which
checks passed, the one-line SQL that deletes a customer's row on request, and one honest
sentence that basic form protection is not enough for a paid campaign.

Then update `BUSINESS-TRUTH.md`: under What exists now write the page address, the project
name, the routes, the path chosen (Sites or static, and which host), and where the source
lives (the folder or repo), never a key or an ID that opens anything; under Prompting rules
learned write the Next time line, dated; bump the version. A future session finds the build
from that section alone.

## Stage 5: change requests, the day-two skill

When the student asks to change or extend a CRM this skill built: read What exists now in
`BUSINESS-TRUTH.md` (it says where the source lives; if it does not, ask for the folder or
repo before anything else), name the smallest change, say which file and which line will
change and whether the page will be redeployed, wait for the yes, make only that change,
redeploy on the same path, rerun the journey the change touches (public journey for the page
or form, operator journey for the login or list), and update What exists now. A WhatsApp
button, a new phone number, a new opening line: all Stage 5. A pipeline, automation or
billing: not this skill.

When the request is a symptom, not a change ("the form gives an error"), diagnose first:
name the likely causes in order, most likely first, with the one check that settles each,
then propose the smallest fix and wait for the yes. For one error, a short check is enough:
what was invented or assumed, what is met and not met, the fix, and the Next time line.

If the change needs a fact the truth file marks [PENDING] (a phone number for the button),
ask for that one fact, write it into the file, then make the change. If the request assumes
something the truth file contradicts ("the number on the page" when the file says there is
none), say so in one line and never invent the missing piece.
