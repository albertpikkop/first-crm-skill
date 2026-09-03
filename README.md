# Build My First CRM

A standalone Codex skill for non-technical students who want to turn a business plan into their
first working customer-enquiry system.

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

## Beginner exercise

Follow [EXERCISE.md](EXERCISE.md) with a fictional business and fake enquiry data.

Each student must use their own Supabase project. Do not put different students' customer data in
one shared classroom database.

Installing this skill does not authorize it to create a paid project, connect an account, publish a
site or make another external change. It asks at each consequential step.

## Licence

MIT. See [LICENSE](LICENSE).
