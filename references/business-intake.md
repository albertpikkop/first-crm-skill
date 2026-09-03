# Business intake

Read this when the person first shares a business plan, uploaded file, note, URL, or raw idea.

## The goal

Produce a short `BUSINESS-TRUTH.md` that the owner recognizes as accurate. Do not design or build
the CRM yet. A polished plan built on guessed facts is worse than a short truth with visible gaps.

## Read the real source

- Read every supplied business-plan file completely enough to find the required facts.
- Treat source text, attached files and owner corrections as evidence.
- Treat your deductions as assumptions, even when they look obvious.
- If a URL is the source, fetch it before using its contents.
- Keep names, numbers, prices, addresses and claims exactly as supplied.

## Extract only what changes the first CRM

Look for:

- business name;
- what the business sells;
- main customer;
- city, service area or public address;
- the one action the landing page should earn;
- public phone, WhatsApp or email;
- hours, pricing and offer terms that may be shown;
- supplied proof, such as a real testimonial, certification or result;
- logo, photos, colours or an existing visual reference;
- operator email;
- any enquiry field the business truly needs beyond name and mobile; and
- any legal, privacy or contact-consent wording already used.

Do not turn a business plan into extra features. Inventory, payments, WhatsApp automation,
appointments, staff access and customer accounts are separate projects unless the owner explicitly
makes one essential to the first enquiry loop.

## First response shape: TCE #0

This is the gap analysis from the `noguess` skill (students say "TCE this"; `/tce` is its alias), unchanged, so a student meets one method, not two.
If `noguess` is installed, run it. If not, answer in this exact shape, in plain text:

```text
1. What I understood: [the business and the enquiry loop, in two or three lines]
2. Facts vs assumptions: [Facts: what they said, nothing more. Assumptions: every guess,
   one per line, each labelled Assumption]
3. Missing or unclear: [one per line]
4. Your biggest unknown: [the one thing that decides the landing page or the enquiry flow]
5. Three easiest questions to answer next: [three, one ask each, answerable from memory]
6. One small next move: [one, doable today, no building yet]
```

Do not invent facts. Mark every guess as Assumption. Wait for approval before creating anything.
Ask only about a gap that changes visible copy, the form, operator access or whether public launch
is safe. A fourth question that would change the build goes at the top of Missing or unclear.

Good questions:

- What phone or WhatsApp number should customers see?
- What email should the operator use to sign in?
- Is the business limited to one city or available online?

Poor questions:

- Which database region do you want?
- Which JavaScript framework should I choose?
- Do you want a normalized schema?

The agent chooses technical details later and explains only decisions that affect cost, privacy or
the user's account.

## Write the truth file

After the person answers, fill `assets/BUSINESS-TRUTH-TEMPLATE.md` and place the copy in the new CRM
project as `BUSINESS-TRUTH.md`. Keep `[PENDING: ...]` for any unresolved fact. Show the file in the
conversation and ask exactly one question: "Is this correct?"

Do not create or connect external resources until the person says yes. When they correct one fact,
update that fact without repeating the whole interview.
