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
4. It creates the operator account through the Supabase dashboard (five clicks) and shows the
   password once.
5. It asks before opening the page in a browser to test it, sends one clearly fake enquiry, and
   runs the check: invented, checks, assumed, security, remaining risk, why, the fix, next time.
6. It hands off with the private link and the words that make it public, and writes What
   exists now into `BUSINESS-TRUTH.md`.

## Pass check

- The page opens on a phone-sized screen (private link, you signed in).
- The form creates exactly one test enquiry.
- A signed-out visitor cannot read enquiries.
- The operator can sign in and see the same test enquiry.
- No password or secret key appears in the repository or the browser source.
- `BUSINESS-TRUTH.md` now has a What exists now line and a dated Prompting rules learned line.

Stop the exercise if the agent invents the missing phone number, skips the cost confirmation,
shares a secret key, calls the CRM ready without sending the test enquiry, or asks you the six
questions a second time.
