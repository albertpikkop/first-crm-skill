# Exercise: Build your first CRM

## What you will prove

A visitor can send an enquiry from a business landing page, and the business operator can sign
in and see the same enquiry. Use a fictional business. Never enter a real customer's details.

## Before you start

Do the five steps in [SETUP.md](SETUP.md). The skill checks them first and will stop with one
plain step if something is missing; that is not a failure, that is the skill working.

## Copy this into your agent

Codex: start with `Use $build-first-crm to build my first CRM.` Claude Code and others: start
with `Build my first CRM.` Then paste the plan. Replace `[your email]` with an email you control.

```text
Here is the business plan:
- Business name: Sunrise Yoga Studio. This is a fictional classroom business.
- Location: Mohali.
- Offer: beginner yoga classes in small groups.
- Main customer: adults who have never joined a yoga class.
- Main action: ask for a free introductory session.
- Hours: Monday to Saturday, 7 AM to 8 PM.
- Public phone number: not decided yet.
- Operator email: [your email].
- Brand direction: calm, warm and simple. Use cream, deep green and terracotta.
- No logo, prices, testimonials or certifications exist yet.
```

If you already ran `noguess` on this business, skip the plan: the skill reads your
`BUSINESS-TRUTH.md` and asks only what it does not answer.

## What should happen

1. The agent checks the machine first: Supabase connected, a way to host the page.
2. It restates the business in the six steps and marks the missing phone number [PENDING]
   instead of inventing it. You reply `yes`.
3. It shows the preflight: what it will create, the cost the Supabase tool reports, and that
   the page will be private first. You reply `yes`.
4. It guides you to create the operator account in the Supabase dashboard (five clicks), with
   a password you choose and keep in your password manager. It never sees the password.
5. It asks before opening the page in a browser to test it, sends one clearly fake enquiry, and
   runs the check: invented, checks, assumed, security, remaining risk, why, the fix, next time.
6. It hands off with the private link and the words that make it public, and writes What
   exists now into `BUSINESS-TRUTH.md`.

## Pass check

- The page opens on a phone-sized screen (private link, you signed in).
- The form creates exactly one test enquiry.
- A signed-out visitor cannot read enquiries.
- The operator can sign in and see the same test enquiry.
- Your login block appeared in the chat: page link, login link, email, temporary password.
- No secret key appears in the chat, the repository or the browser source, and no password
  appears in any file.
- `BUSINESS-TRUTH.md` now has a What exists now line and a dated Prompting rules learned line.

Stop the exercise if the agent invents the missing phone number, skips the cost confirmation,
shares a secret key, calls the CRM ready without sending the test enquiry, or asks you the six
questions a second time.

## Optional: the two emails

Once the loop above passes, say: `now add the two emails`. You need a free Resend account. The
agent puts the key in a Supabase Edge Function, never in the page, and a database webhook fires
it on each enquiry.

Pass check for this part:

- You submit one more test enquiry and the operator email arrives in your inbox. You opened it.
- The lead email arrives too, or the agent tells you plainly it is `[PENDING: verify a domain
  in Resend]` because Resend will not email other people from an unverified domain.
- The agent shows you the Resend log line, not just an API response, before saying delivered.
- With a deliberately wrong key, the enquiry still saves and the visitor sees no error.
- The Resend key appears nowhere in the page source or the repository.

## Optional next lesson: automate the saved enquiry

After proving the first CRM loop, use the continuation prompt in
[automation-handoff.md](skills/build-first-crm/references/automation-handoff.md). Keep the
working CRM and its email sender. Pass this extension only when a ready lead bypasses nurture,
a not-ready opted-in lead gets an eligible scheduled follow-up, opt-out stops it, and a real
booking/human handover is recorded. This is the Meta Growth lesson, not part of the first-loop
completion gate.
