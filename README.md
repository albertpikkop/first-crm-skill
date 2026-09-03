# Build My First CRM

A Codex skill for non-technical students who want to turn a business plan into their first
working customer-enquiry system. It needs Codex's Sites skills and the Supabase connector. In
Claude Code or Cursor the Supabase half works as written and the site is built as a plain static
page on a host you already have; the skill says so before it starts.

```text
Landing page -> enquiry form -> Supabase -> operator login -> enquiry list
```

The skill uses Sites for the landing page and operator dashboard, and Supabase for enquiry storage
and email-password login. It checks what is connected, confirms Supabase cost, and asks before
plugin installation, account changes, project creation or public deployment.

## Install

```bash
npx skills add albertpikkop/first-crm-skill -g
```

Remove `-g` if you want the skill only inside the current project.

## Use

```text
Use $build-first-crm to build my first CRM from this business plan: [paste or attach the plan].
```

## The method underneath

The skill starts with the gap analysis from the TCE + NHA method
([albertpikkop/tce-skill](https://github.com/albertpikkop/tce-skill)): it says back what it
understood, separates facts from assumptions, marks every guess, asks three easy questions and waits
for your yes before creating anything. Install `tce` first and the two skills share one loop:

```bash
npx skills add albertpikkop/tce-skill
```

The same `npx skills add` commands work for Claude Code, Codex and Cursor.

## Beginner exercise

Follow [EXERCISE.md](EXERCISE.md) with a fictional business and fake enquiry data.

Each student must use their own Supabase project. Do not put different students' customer data in
one shared classroom database.

Installing this skill does not authorize it to create a paid project, connect an account, publish a
site or make another external change. It asks at each consequential step.

## Licence

MIT. See [LICENSE](LICENSE).
