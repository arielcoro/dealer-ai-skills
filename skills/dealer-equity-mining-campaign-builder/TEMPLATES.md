# Dealer Equity Mining — Messaging Templates

Messaging templates for SMS, email, and ringless voicemail across the six standard personas. SKILL.md references this file. Use these as starting templates; customize for the dealer's voice, offer, and brand.

Merge tokens used throughout: `{first_name}`, `{current_vehicle}`, `{lease_end_date}`, `{equity_estimate}`, `{recommended_vehicle}`, `{dealership_name}`, `{dealer_city}`, `{sales_manager_name}`, `{offer_amount}`, `{offer_deadline}`, `{calendly_link}`, `{phone_number}`.

For each template: SMS includes character count, email includes subject/preview/body, RVM includes spoken script and target length.

---

## Persona 1. Lease returner

### Touch 1 (Day -60). Email

**Subject:** {first_name}, your {current_vehicle} lease ends {lease_end_date}. Here are your options.

**Preview text:** Three ways to handle your lease end at {dealership_name}.

**Body:**

Hi {first_name},

Your {current_vehicle} lease is coming up on {lease_end_date}. You have three options, and we want to make sure you know what they are so you can decide what works best for you.

**Option 1: Lease another vehicle.** Most customers in your position like the freedom of trading in for a new one. We have current lease deals on the {recommended_vehicle} starting at $X/month with $0 down for qualified buyers.

**Option 2: Buy out your current {current_vehicle}.** Your buyout amount is approximately ${equity_estimate}. If your vehicle has equity above that, you keep it.

**Option 3: Return it and walk away.** No obligation. We handle the paperwork.

Want to talk through the options? Schedule a no-pressure lease review at {calendly_link} or call us at {phone_number}.

Either way, we want to thank you for being a {dealership_name} customer.

[Sales Manager Name]
{dealership_name}

### Touch 2 (Day -45). SMS

**Body (147 chars):**

Hi {first_name}, this is {sales_manager_name} at {dealership_name}. Your {current_vehicle} lease ends in 45 days. Want to come in for a lease review? Reply YES to schedule.

### Touch 3 (Day -30). Email

**Subject:** {first_name}, here's what you could drive home for your current payment.

**Preview text:** Estimated payments on your top three lease options.

**Body:**

Hi {first_name},

You mentioned you wanted to know your options at lease end. Here are three vehicles you could lease for similar or lower than your current payment:

1. **{recommended_vehicle_1}** — Estimated $X/month with $0 down, 36 months
2. **{recommended_vehicle_2}** — Estimated $X/month with $0 down, 36 months
3. **{recommended_vehicle_3}** — Estimated $X/month with $X down, 36 months

These are estimates based on current incentives and your tier-1 credit history. Real numbers require a quick conversation.

Want to come in this weekend? Reply or call {phone_number}.

{sales_manager_name}
{dealership_name}

### Touch 4 (Day -21). Ringless voicemail

**Script (28 seconds when spoken):**

"Hi {first_name}, this is {sales_manager_name} from {dealership_name}. I see your {current_vehicle} lease is ending soon and I wanted to reach out personally. We have a couple new {recommended_vehicle}s on the lot I think you would love, with payments similar to what you have now. Give me a call back at {phone_number} when you have a minute. I want to make sure your transition is easy. Thanks {first_name}."

### Touch 5 (Day -10). SMS

**Body (153 chars):**

{first_name}, your {current_vehicle} lease ends in 10 days. We have the {recommended_vehicle} ready for you. Lease for $X/mo with $0 down. Reply YES to lock it in.

### Touch 6 (Day -3). Email

**Subject:** {first_name}, three days left on your lease. Final reminder.

**Preview text:** Schedule your lease return at {dealership_name}.

**Body:**

Hi {first_name},

Your {current_vehicle} lease ends on {lease_end_date}. To make the return smooth, here's what to bring:

- All sets of keys and fobs
- Owner's manual
- Any service records you have

If you have not picked your next vehicle yet, we have {recommended_vehicle} available now starting at $X/month.

Schedule your appointment: {calendly_link}
Or call: {phone_number}

We appreciate your business.

{sales_manager_name}

---

## Persona 2. Equity-positive trade-up

### Touch 1 (Day 0). Email

**Subject:** {first_name}, your {current_vehicle} has equity. Here's what that means.

**Preview text:** You may be able to upgrade without increasing your payment.

**Body:**

Hi {first_name},

Quick note. Your {current_vehicle} has approximately ${equity_estimate} in equity right now (the value above what you still owe).

Most owners do not realize this means they can often trade up to a newer vehicle without increasing their monthly payment. Sometimes the new payment is lower because of current OEM incentives.

We are showing your {current_vehicle} as a candidate for trade evaluation. Want me to pull the actual numbers for you?

It is a 10-minute conversation with no pressure. Schedule here: {calendly_link} or text/call {phone_number}.

{sales_manager_name}
{dealership_name}

### Touch 2 (Day 5). SMS

**Body (139 chars):**

Hi {first_name}, your {current_vehicle} has ~${equity_estimate} in equity. Want to see what you could trade for at the same payment? Reply YES.

### Touch 3 (Day 12). Email

**Subject:** {first_name}, here is the trade math.

**Preview text:** Real payment estimates on three vehicles for your equity.

**Body:**

Hi {first_name},

You asked about your trade options. Here are three real scenarios based on your {current_vehicle}'s estimated equity:

**Option A: {recommended_vehicle_1}**
Estimated payment: $X/month for 60 months
Down payment: Your trade equity covers it

**Option B: {recommended_vehicle_2}**
Estimated payment: $X/month for 72 months
Down payment: Your trade equity covers it plus cash back

**Option C: Stay in your {current_vehicle}, refinance**
Estimated payment: $X/month
Cash back: $X based on equity

These are starting points. Real numbers require pulling your credit and walking the lot together.

Schedule: {calendly_link}

{sales_manager_name}

### Touch 4 (Day 19). Ringless voicemail

**Script (25 seconds):**

"Hi {first_name}, this is {sales_manager_name} from {dealership_name}. I have been looking at your {current_vehicle} and the trade math is actually pretty interesting. You have equity, current incentives are strong, and I think we could put you in something newer without changing your monthly. Give me a call back at {phone_number} when you have 10 minutes. No pressure, just want to show you the numbers."

### Touch 5 (Day 28). SMS

**Body (158 chars):**

{first_name}, the OEM trade bonus on your {current_vehicle} ends {offer_deadline}. We can pull the numbers in 10 minutes. Reply YES to come by this weekend.

---

## Persona 3. Service-to-sales (S2S)

### Touch 1 (Within 24 hours of service visit). SMS (if opt-in) or Email

**SMS (151 chars):**

Hi {first_name}, thanks for the service visit today. Quick note: your {current_vehicle} has trade equity. Want to see what you could upgrade to? Reply YES.

**Email alternate subject:** {first_name}, thanks for the visit. One thing we noticed.

**Email body:**

Hi {first_name},

Thanks for bringing your {current_vehicle} in today. The service team confirmed everything looks good.

Quick side note: while we had it in for service, we ran the numbers. Your {current_vehicle} has about ${equity_estimate} in equity right now, and current OEM incentives mean you could likely upgrade to a {recommended_vehicle} at a similar monthly payment.

Want to take a quick look? Schedule a 15-minute visit: {calendly_link} or call {phone_number}.

{sales_manager_name}
{dealership_name}

### Touch 2 (Day 7). SMS

**Body (157 chars):**

{first_name}, we have a 2026 {recommended_vehicle} on the lot with $5,000 in incentives this month. Your {current_vehicle} equity covers your down. Reply YES.

### Touch 3 (Day 14). Email

**Subject:** {first_name}, the math on a 2026 {recommended_vehicle}

**Preview text:** Trade equity + OEM incentives = upgrade at similar payment

**Body:**

Hi {first_name},

You mentioned you might want to see the math on upgrading. Here it is:

**Your {current_vehicle}**
Estimated trade value: $X
Remaining loan: $X
Equity: ~${equity_estimate}

**2026 {recommended_vehicle}**
Sale price: $X
OEM incentive: -$X
Your trade equity as down payment: -${equity_estimate}
Financed amount: $X
Estimated payment: $X/month (60 months at 6.9% APR for tier-1 credit)

Your current payment on the {current_vehicle}: $X/month

So you could be in a 2026 {recommended_vehicle} for a similar monthly payment.

Want to drive one this weekend? Schedule: {calendly_link}

{sales_manager_name}

### Touch 4 (Day 21). Ringless voicemail

**Script (28 seconds):**

"Hi {first_name}, this is {sales_manager_name} from {dealership_name}. Hope your {current_vehicle} has been running smoothly since the service visit. I wanted to follow up on the trade math we ran. The numbers actually work out pretty well. Give me a call back at {phone_number} when you have a few minutes. I would love to show you the 2026 {recommended_vehicle} on the lot. Thanks {first_name}."

---

## Persona 4. OEM program eligible

### Touch 1. Email

**Subject:** {first_name}, you qualify for the {program_name} this month.

**Preview text:** ${offer_amount} on a new {recommended_vehicle} through {program_deadline}.

**Body:**

Hi {first_name},

Quick note: as a current {dealership_name} customer, you qualify for the {program_name} program through {program_deadline}.

The program adds ${offer_amount} on a new {recommended_vehicle} on top of any incentives you already qualify for. Most customers do not realize they are eligible because the OEM does not market the program directly — we have to surface it.

To claim it, you need to come in before {program_deadline} and we need to verify eligibility (a quick check of your loyalty status takes about two minutes).

Want to schedule a visit? {calendly_link} or call {phone_number}.

{sales_manager_name}
{dealership_name}

### Touch 2. SMS

**Body (159 chars):**

{first_name}, you qualify for the {program_name} — ${offer_amount} on a new {recommended_vehicle} through {program_deadline}. Reply YES to come in this week.

### Touch 3. Email

**Subject:** {first_name}, here are three {recommended_vehicle}s eligible for the {program_name}

**Preview text:** Eligible inventory at {dealership_name} this week.

**Body:**

Hi {first_name},

You asked which vehicles are eligible for the {program_name}. Here are three currently in our inventory:

1. **2026 {recommended_vehicle_1}** — Sale price $X with ${offer_amount} program credit
2. **2026 {recommended_vehicle_2}** — Sale price $X with ${offer_amount} program credit
3. **2026 {recommended_vehicle_3}** — Sale price $X with ${offer_amount} program credit

Schedule a visit before {program_deadline}: {calendly_link}

{sales_manager_name}

### Touch 4. Ringless voicemail

**Script (24 seconds):**

"Hi {first_name}, this is {sales_manager_name} from {dealership_name}. Wanted to make sure you knew about the {program_name} program — ${offer_amount} off a new {recommended_vehicle}, but only through {program_deadline}. Most loyal customers do not even know about it. Give me a call at {phone_number} so I can walk you through it. Thanks {first_name}."

### Touch 5 (Final week). SMS

**Body (155 chars):**

{first_name}, the {program_name} ends in 5 days. ${offer_amount} on a new {recommended_vehicle}. We can save you the time — schedule online: {calendly_link}

---

## Persona 5. Upside-down upgrader

### Touch 1. Email

**Subject:** {first_name}, even if you owe more than your {current_vehicle} is worth, you may still be able to trade.

**Preview text:** Here is how negative equity trades actually work.

**Body:**

Hi {first_name},

Quick honest email.

Many people think they cannot trade because they owe more on their {current_vehicle} than it is worth. That is sometimes true. But not always.

When OEM incentives on a new vehicle are strong (like right now), the incentive can offset some or all of the negative equity. Combined with the right loan structure, you might be able to move into something newer without a big out-of-pocket cost.

It is a more careful conversation than a normal trade, but it is worth understanding the math.

Want to come in for a no-obligation trade evaluation? We pull the numbers, you decide. {calendly_link} or {phone_number}.

{sales_manager_name}
{dealership_name}

### Touch 2 (Day 14). SMS

**Body (158 chars):**

{first_name}, even with negative equity on your {current_vehicle}, current OEM incentives may make a trade work. 10-min eval, no pressure. Reply YES.

### Touch 3 (Day 28). Email

**Subject:** {first_name}, customers like you have made it work. Here is how.

**Preview text:** Three real scenarios for upside-down trades at {dealership_name}.

**Body:**

Hi {first_name},

You asked how customers in your situation have made trades work. Here are three real scenarios (anonymized) from {dealership_name} customers in the last 90 days:

**Customer A** — {current_vehicle_type}, negative equity of $X. Traded for {recommended_vehicle} using $X in OEM incentive. New payment: similar.

**Customer B** — {current_vehicle_type}, negative equity of $X. Did not trade — refinanced existing loan for lower payment. Better outcome.

**Customer C** — {current_vehicle_type}, negative equity of $X. Waited 6 months, equity neutralized, then traded clean.

Every situation is different. Want to see which scenario fits yours?

Schedule: {calendly_link}

{sales_manager_name}

### Touch 4 (Day 42). Ringless voicemail

**Script (25 seconds):**

"Hi {first_name}, this is {sales_manager_name} from {dealership_name}. I know trading when you owe more than your vehicle is worth feels stuck. I just wanted to let you know we have a few different ways to make it work in your favor. Give me a call back at {phone_number} when you have 10 minutes. We will look at the math together, no pressure. Thanks {first_name}."

---

## Persona 6. Dormant customer reactivation

### Touch 1. Email

**Subject:** {first_name}, we miss seeing you at {dealership_name}.

**Preview text:** A quick reconnect from your friends at {dealership_name}.

**Body:**

Hi {first_name},

It has been a while since we saw you. Just wanted to send a quick reconnect.

A few things that have changed at {dealership_name}:
- We are now serving customers from {expanded_service_area}
- Our service hours expanded to {service_hours}
- The new {recommended_vehicle} is finally here

If you still have your {current_vehicle}, our service team would love to see it for a maintenance check. If you have moved on to something new, we would love to know.

Either way, hope you are well.

{sales_manager_name}
{dealership_name}

### Touch 2 (Day 14). Email

**Subject:** {first_name}, would a $X service credit bring you back?

**Preview text:** A small thank-you for being a {dealership_name} customer.

**Body:**

Hi {first_name},

We want to say thank-you for being a {dealership_name} customer with a $X service credit, good through {offer_deadline}.

Use it for an oil change, a tire rotation, a multi-point inspection, or anything else from our service menu.

Just bring your {current_vehicle} in or schedule online: {calendly_link}.

Hope to see you soon.

{sales_manager_name}

### Touch 3 (Day 28). SMS

**Body (151 chars):**

{first_name}, your $X service credit at {dealership_name} expires {offer_deadline}. Use it on anything from oil change to tires. Reply YES to schedule.

---

## How to customize these templates

These are starting templates. Real campaigns customize:

- **Voice.** Match the dealership's tone (friendly small-town vs. luxury group vs. high-volume metro).
- **Offer.** Replace generic offer language with the dealer's actual current offer.
- **Vehicle recommendations.** Pull from the dealer's in-stock inventory or pre-defined recommendation logic.
- **Sender name.** Use a real sales manager or BDC manager name, not "Sales Team" generic.
- **Phone number.** A real dealer phone number, ideally one that routes to a human on first ring.
- **Bilingual.** If the dealer has a Spanish audience, produce parallel Spanish templates with culturally appropriate phrasing (not literal translation).

When in doubt, simpler and more honest beats clever and copy-heavy. The goal is to get the customer in for a conversation, not to close the deal in the message.
