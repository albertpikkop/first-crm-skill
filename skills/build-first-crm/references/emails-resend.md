# The two emails, with Resend

Read this only after the enquiry loop is proven (Stage 4 passed). Email is an addition to a
working CRM, never a reason to delay one. Resend changes; read its current docs on domains and
senders before choosing a `from` address.

## What gets sent

One enquiry, two emails:

1. **To the lead**, straight away: we have your enquiry, here is what happens next. This is a
   reply to the message they just sent, which is what their consent line covers. It is not
   marketing. No offers, no newsletter, no list.
2. **To the operator**: a new enquiry arrived, with the name, the number, the message and a
   link to the dashboard. This is what stops enquiries dying unseen.

## What a student needs first

- A Resend account and an API key (resend.com, free tier).
- **A verified domain in Resend to email the lead.** Resend's own words: you must add and
  verify at least one domain to send emails. Until the student owns and verifies a domain,
  send only the operator email, to the address on the Resend account, and mark the lead email
  `[PENDING: verify a domain in Resend]`. Never tell a student their customers are getting
  emails when only they are.
- The operator email from `BUSINESS-TRUTH.md`.

## Where the key lives

The Resend API key is a secret, exactly like the service-role key. It never touches the page,
the repository, an `.env` in the browser bundle, a screenshot or the chat. It lives in the
Supabase Edge Function's secrets, and the function is the only thing that sends.

The send is server side and asynchronous: the enquiry is already saved before any email is
tried, so an email failure never breaks the form or shows a visitor an error.

## How it fires

Supabase Database Webhook on `INSERT` into `public.enquiries`, calling one Edge Function.

1. Create the function `enquiry-emails` (code below).
2. Set its secrets: `RESEND_API_KEY`, `MAIL_FROM` (for example `Sunrise Yoga <hello@sunriseyoga.in>`,
   a verified domain, or the test sender while the domain is [PENDING]), `OPERATOR_EMAIL`,
   `DASHBOARD_URL`, and `WEBHOOK_SECRET` (a random string you generate).
3. In the Supabase dashboard: Database, Webhooks, Create a new hook, table `enquiries`, event
   `Insert`, type HTTP Request, POST to the function's URL, and add the header
   `x-webhook-secret` with the same random string. That header is what stops anyone else
   calling your function.

```ts
// supabase/functions/enquiry-emails/index.ts
Deno.serve(async (req) => {
  if (req.headers.get("x-webhook-secret") !== Deno.env.get("WEBHOOK_SECRET")) {
    return new Response("forbidden", { status: 401 });
  }

  const { record } = await req.json();
  const key = Deno.env.get("RESEND_API_KEY");
  const from = Deno.env.get("MAIL_FROM");
  const operator = Deno.env.get("OPERATOR_EMAIL");
  const dashboard = Deno.env.get("DASHBOARD_URL");

  const send = (to: string, subject: string, text: string) =>
    fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
      body: JSON.stringify({ from, to, subject, text }),
    }).then(async (r) => ({ to, ok: r.ok, status: r.status, body: await r.text() }));

  const sent = [];

  sent.push(await send(
    operator,
    `New enquiry: ${record.name}`,
    `${record.name} just sent an enquiry.\n\n` +
    `Mobile: ${record.mobile}\n` +
    `Email: ${record.email ?? "not given"}\n` +
    `Message: ${record.message ?? "not given"}\n\n` +
    `Open the dashboard: ${dashboard}`,
  ));

  if (record.email) {
    sent.push(await send(
      record.email,
      `We have your enquiry`,
      `Hello ${record.name},\n\n` +
      `We have your enquiry and someone will reply to you.\n\n` +
      `What you sent us: ${record.message ?? "your contact details"}\n`,
    ));
  }

  const failed = sent.filter((s) => !s.ok);
  return new Response(JSON.stringify({ sent, failed: failed.length }), {
    status: failed.length ? 502 : 200,
    headers: { "Content-Type": "application/json" },
  });
});
```

Keep the words in both emails from `BUSINESS-TRUTH.md`. Do not invent a reply time the business
never promised, an offer, or a person's name. If the business has no stated reply time, say
someone will reply, not when.

## Accepted is not delivered

A 200 from the Resend API means Resend took the message. It does not mean a person received it.
Never report an email as delivered from the API response alone. Check Resend's Logs for the
delivered status, and for the first send, look in the real inbox, spam folder included.

That gap is the whole reason this skill verifies instead of trusting: the same mistake on
WhatsApp cost eleven separate fixes on another product.

## Verify

- Submit one clearly fake test enquiry through the real form, using an address you can open.
- The enquiry row still appears in the dashboard: the loop is unbroken.
- The operator email arrives. Open it and read it, do not trust the API result.
- The lead email arrives, or is honestly marked `[PENDING: verify a domain in Resend]`.
- The Resend Logs show the delivered status for both, not just accepted.
- Break it on purpose once: set a wrong API key, submit an enquiry, confirm the enquiry is
  still saved and the visitor sees no error. Then put the key back.
- Search the deployed page source and the repository for the Resend key: zero matches.

## In the handoff

- Which emails are live, and which are `[PENDING: verify a domain]`.
- Where the key lives (the Edge Function's secrets), and that it is nowhere else.
- Where to read delivery status: the Resend Logs.
- One line: an email that leaves your system is not an email that arrived; check the log when
  a customer says they heard nothing.
