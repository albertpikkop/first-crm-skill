# The static path: Claude Code, Cursor, or any agent without Sites

Read this when Stage 0 found no Sites plugin. The loop is the same; the page is one static site.

## What you build

- `index.html`: the landing page and the enquiry form, plain HTML and CSS, the Supabase
  browser client loaded from its official CDN, pinned to one version.
- `operator/login.html` and `operator/index.html`: sign-in and the read-only list, using
  the same client. Redirect a signed-out visitor to the login page; RLS remains the real
  boundary.
- A `.env.example` with the two names (project URL, publishable key) and values filled in
  at deploy time by the host's settings, never committed.

## Where it lives

Ask which host the student already has, in this order: Cloudflare Pages, Netlify, GitHub
Pages, Vercel. All have a free tier for a static site. If none, recommend one and ask before
creating anything there. The first deploy is private or unlisted where the host allows it;
public is a separate yes.

## What stays the same

Everything in `supabase-setup.md` (tables, RLS, column-level grants, the operator account),
everything in `crm-contract.md` (fields, states, the consent line, the data line), and the
whole of `verification.md`. Insert without chaining `.select()`. Escape rendered text. Keep
the honeypot and the cooldown. Never put a secret key in the page.
