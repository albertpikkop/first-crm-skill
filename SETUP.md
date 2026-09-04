# Setup for this skill

Everything for all three skills, per machine, is in the shared
[SETUP.md in noguess](https://github.com/albertpikkop/noguess-prompt-skill/blob/main/SETUP.md). This skill
needs, from that list:

1. Node.js (for the install commands).
2. A Supabase account of your own at supabase.com. One project per student.
3. Supabase connected to your agent: on Codex, the Supabase plugin, signed in; on Claude Code,
   the Supabase MCP connection (current command on supabase.com/docs/guides/getting-started/mcp).
4. A place for the page: on Codex, the Sites plugin enabled; anywhere else, a free static host
   you already have (Cloudflare Pages, Netlify, GitHub Pages, Vercel) or the skill asks before
   creating one.
5. An email you control for the operator login, and a password manager.

The skill checks all of this before it asks about your business, and stops with one plain next
step if something is missing.
