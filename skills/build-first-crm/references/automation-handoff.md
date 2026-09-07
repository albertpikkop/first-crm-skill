# From first CRM to sales automation

Use when the student asks for WhatsApp confirmations, human call tasks, qualification,
follow-ups or booking on a CRM this skill built. A WhatsApp link/button alone is a small
page change; it does not require this extension.

Keep the basic enquiry/login/two-email lesson small. For the extended journey, hand ownership
to `meta-growth-system` and its `connect-meta-whatsapp` skill, if available. They own the
seven-stage workflow and Meta/Supabase webhook implementation. Do not stop with “out of scope”
when this continuation is available, repeat the business interview, or rebuild a working CRM.

Read the current BUSINESS-TRUTH.md and inspect the student's actual source. In that same file's
What exists now section, make sure the next skill can find:

- source folder/repository, deployed form and operator routes, and hosting path;
- student-owned Supabase project reference, current tables and operator access model;
- enquiry identity/source and existing form permissions, with unknown consent marked unknown;
- existing Resend function/hook, verification state and receipt locations;
- proof of enquiry saving, login and emails, with unrun checks pending;
- requested extension, owner, remaining choices and already authorized actions.

Keep credentials and customer records out of this handoff. Do not create a second truth file.
Existing enquiry consent is not automatically marketing permission. The Meta skill must add
purpose-specific records and check eligibility before first business-initiated WhatsApp.
The existing email hook must be reused or explicitly migrated; two confirmation senders are
not acceptable. Preserve RLS and data; the next skill adds versioned schema extensions.

Explain the progression once:

`Enquiry -> CRM -> WhatsApp + email + human call task -> qualify -> ready: book / not ready: nurture -> human sales`

The human makes the call. The booking extension must check real slots and send invitations;
it is not another enquiry form. No installed script in this CRM release provides the complete
seven-stage automation. Never invent `crm automation` or booking commands.

If Meta Growth is missing, say which capability is missing and point to the public package:
https://github.com/albertpikkop/meta-growth-system-skill
Check whether that installed version actually includes the student sales-automation guide;
older releases cover connection/tests only. Do not silently install it. Continue inspecting
and preparing the local handoff; installation or equivalent custom implementation follows the
student's choice and existing permissions. Explain one next step, not a list of new accounts.

Student continuation prompt:

> Use meta-growth-system and connect-meta-whatsapp to extend the CRM in this folder. Read
> BUSINESS-TRUTH.md first and reuse its Supabase project, login and Resend hook. Build the
> seven-stage sales flow with an automatic WhatsApp acknowledgement, email, human call task,
> qualification and permissions, a ready-to-book branch, eligible nurture for not-ready leads,
> and human sales handover. Show the Supabase callback setup and prove suppression, booking
> and duplicate handling with test data before live customer activation.
