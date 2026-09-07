# Changelog

## v0.3.0, 4 September 2026

- The operator account comes with a temporary password the skill generates and prints in one
  login block (page link, login link, email, password), so a student signs in during the class
  and sees the whole loop. Change it after the first login; it never goes into a file, a repo,
  an env file or a screenshot.
- Stage 5, the two emails, through Resend: the lead hears that their enquiry arrived, the
  operator hears that one came in. Sent by a Supabase Edge Function on a database webhook, so
  the API key never reaches the page and a failed email never breaks the form. Resend needs a
  verified domain before it will email a lead, so until then the lead email is marked
  [PENDING] and only the operator email is live. Accepted by the API is not delivered: read
  the Resend log and the real inbox.
- Change requests are now Stage 6.

## v0.2.0, 4 September 2026

Rewritten after a cold review of the skill and a second cold review of the three-skill journey.

- Plugin layout, so one marketplace (`ashishpunj`) installs all three skills on Claude Code.
- Stage 0, the machine before the business: Supabase connection, a hosting path, one plain next
  step per gap. Never a plugin install without a yes.
- Reads `BUSINESS-TRUTH.md` written by `noguess`; never runs the interview twice; uses the same
  six labels when it does run it; writes the file only after the yes.
- The shared truth template: What exists now, Prompting rules learned, required fields
  [PENDING: confirm].
- The static path: Claude Code, Cursor and any agent without Sites complete the loop.
- The operator account through the dashboard as the primary path, with the ID read-back.
- Column-level insert grant, an operator delete policy, the delete SQL in the handoff, a data
  line under the form.
- Private first; the exact words that make the page public.
- Asks before browser tests; unrun checks are not met; the check has Why and Next time.
- Stage 5: change requests and redeploy, the day-two skill.
- Why Supabase and a student-owned login over a host's defaults, stated once.

## v0.1.0, 3 September 2026

First public version.

## Unreleased: Meta Growth continuation

- Route WhatsApp sales and booking extensions through a reusable CRM handoff.
- Preserve Supabase, operator access, one truth file and one Resend confirmation owner.
- Keep the beginner enquiry scope; correct small-change references to Stage 6.
- No runtime helper changes or release of the separate Supabase-first rewrite.
