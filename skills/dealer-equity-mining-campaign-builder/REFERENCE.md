# Dealer Equity Mining Campaign Builder — Reference Framework

The campaign architecture, persona library, cadence rules, and KPIs. SKILL.md references this file. Read it before designing any campaign.

---

## What equity mining is

Equity mining is the systematic identification and outreach to current customers (and recent prospects) who are in a position to:

- Trade their current vehicle for a new or newer one,
- Lease a new vehicle as their current lease ends,
- Upgrade to a higher trim or different body style,
- Take advantage of an OEM program (loyalty bonus, conquest cash) before it expires,
- Move from service-only customer to sales customer (service-to-sales).

Done well, equity mining produces some of the highest-margin sales a dealer can make because:

- The customer is already in the database (no acquisition cost).
- The relationship reduces objection friction.
- The conversion path is shorter than cold lead acquisition.
- OEM programs often subsidize the offer (loyalty bonuses, conquest cash, etc.).

The 3-channel pattern (SMS + email + ringless voicemail) outperforms email-only by roughly 2x on contact-to-trade rate per industry data. The 3-channel cadence is the default unless the dealer is missing one of the channels.

---

## The 3-channel cadence architecture

Every campaign uses three channels arranged in a sequenced cadence. The exact cadence varies by persona, but the structural pattern is consistent.

### Channel roles

**Email** is the soft open. It carries detail, images, links, and longer-form context. Highest reach, lowest engagement. Use for the initial offer announcement and the deeper-context follow-ups.

**SMS** is the direct invite. Short, conversational, time-sensitive. Highest engagement, lowest tolerance for misuse. Use for direct calls-to-action (book the appointment, reply with a yes/no, claim the offer before a deadline).

**Ringless voicemail** is the personal voice touch. Sounds like the dealer reached out personally. Reserved for high-value segments or critical-window moments. Use sparingly (once every 14 days max per recipient).

### Standard cadence shape

For most personas, a 30-day campaign window with 5 to 7 touches across the three channels works:

```
Day 0:  Email      — Soft open, announce offer
Day 3:  SMS        — Direct invite to engaged opens/clicks
Day 7:  Email      — Persona-specific value reinforcement
Day 12: RVM        — Personal voice reminder (segment of strongest equity only)
Day 17: SMS        — Time-sensitive close ("offer ends in 10 days")
Day 24: Email      — Last-call detail email with FAQ
Day 30: SMS        — Final call (only if no engagement yet and opt-in is current)
```

Adjust touch count up or down per persona. Lease returners (60-90 day windows) get fewer, more spread-out touches. Service-to-sales (immediate window) gets faster, denser touches.

### Gating logic

Every touch is gated on three conditions:

1. **Opt-in status.** SMS requires explicit SMS opt-in. RVM requires RVM-compliant prior business relationship or opt-in per state law. Email requires email subscription (CAN-SPAM).
2. **Frequency cap.** No more than 2 SMS per week, 3 emails per week, 1 RVM per 14 days per recipient.
3. **Suppression.** Recently unsubscribed, recently purchased, declared do-not-contact, active service complaint, or OEM-restricted are excluded.

See COMPLIANCE.md for the full gating rules.

---

## The persona library

Six standard archetypes. Match the user's described persona to one of these whenever possible. If the persona is genuinely custom, treat it as such and document the rationale.

### Persona 1. Lease returner (60-90 day window)

**Trigger.** Customer's current lease ends in 60 to 90 days.

**Why this persona converts.** Lease end creates a forced decision point. Most lease returners take their next vehicle from the same dealer if engaged early. Most defection happens because the dealer waited too long.

**Cadence.** 60-day window, 6 touches.
- Day -60: Email (announce options: buy out, lease another, walk away)
- Day -45: SMS (direct invite to come in for a "lease review")
- Day -30: Email (personalized payment estimates on next-vehicle options)
- Day -21: RVM (personal voice, dealer principal or GM if possible)
- Day -10: SMS (urgency: "lease ends in 10 days")
- Day -3: Email (final reminder + appointment scheduler link)

**Primary metric.** Lease-end retention rate (percent of returners who lease or buy from the same dealer).

### Persona 2. Equity-positive trade-up (36 to 60 months in)

**Trigger.** Customer purchased a vehicle 36 to 60 months ago, current vehicle has positive equity over remaining loan balance, customer has not engaged with the sales side since purchase.

**Why this persona converts.** Customer's vehicle is paid down to where equity is meaningful. Many do not realize they are in a position to trade up without increasing their monthly payment. The campaign's job is to surface the trade math.

**Cadence.** 30-day window, 5 touches.
- Day 0: Email (offer: "Your 2022 Sierra has equity. Here's what that means.")
- Day 5: SMS (invite to a trade evaluation appointment)
- Day 12: Email (persona-specific: "What you can drive home in for your current payment")
- Day 19: RVM (personal voice, sales manager)
- Day 28: SMS (final touch with current incentive deadline if applicable)

**Primary metric.** Appointments set per 100 contacted. Secondary: trade-in valuations completed.

### Persona 3. Service-to-sales (S2S) candidate

**Trigger.** Customer recently visited the service drive (last 30 days), vehicle is 4+ years old or has high mileage, customer has positive equity.

**Why this persona converts.** Customer is already on premises or recently was. Service advisor has a fresh relationship. Conversion paths are shortest from a current service customer.

**Cadence.** Fast, 21-day window, 4 touches.
- Day 0 (within 24 hours of service visit): Email or SMS depending on opt-in (offer: "While we had your Sierra in, we noticed it has trade equity. Want to see options?")
- Day 7: SMS (specific vehicle suggestion: "We have a 2026 Sierra with $5,000 in incentives this month")
- Day 14: Email (specific value math: payment estimates)
- Day 21: RVM (personal voice, sales manager or service advisor if appropriate)

**Primary metric.** Service customers converted to sales appointments. Secondary: deals closed within 60 days of service visit.

### Persona 4. OEM program eligible

**Trigger.** Customer matches an active OEM program: loyalty bonus, conquest cash, military discount, first responder, recent grad, etc.

**Why this persona converts.** The OEM program creates an artificial deadline and increases the offer strength. Most dealers under-utilize OEM programs because they require segmenting the database.

**Cadence.** Aligned to OEM program window (varies: 30, 60, or 90 days), typically 4 to 6 touches.
- Touch 1: Email (announce the program, eligibility, and amount)
- Touch 2: SMS (direct invite to confirm eligibility and schedule)
- Touch 3: Email (persona-specific reinforcement, e.g., "GMC Loyalty Owner Bonus is $1,500 on a new Sierra")
- Touch 4: RVM (personal voice with program-specific message)
- Touch 5: SMS (deadline urgency in final week of program)
- Touch 6 (optional): Email (final call, FAQ, scheduler link)

**Primary metric.** Conversion of eligible customers to deals within the program window.

### Persona 5. Upside-down upgrader

**Trigger.** Customer is upside-down on their current vehicle (negative equity) but has a payment that has stabilized, credit has improved, or they need a specific upgrade (family vehicle, towing capacity, etc.).

**Why this persona is harder.** Upside-down customers are not traditionally treated as equity mining targets. But many can still trade if the dealer has the right OEM rebate or if the new vehicle's incentive offsets the negative equity. This persona requires a more careful conversation and a more specific offer.

**Cadence.** Slower, 45-day window, 4 touches (more careful).
- Day 0: Email (educational: "Even if you owe more than your vehicle is worth, you may still be able to trade. Here's how.")
- Day 14: SMS (invite to a "no-obligation evaluation")
- Day 28: Email (persona-specific scenarios: "Customers like you have traded for X with Y down")
- Day 42: RVM (personal voice from sales manager, low-pressure tone)

**Primary metric.** Evaluations completed (not just appointments — the math conversation has to happen).

### Persona 6. Dormant customer reactivation

**Trigger.** Customer purchased 5+ years ago, has not been in the service drive in 18+ months, has not engaged with any email or SMS in 12+ months.

**Why this persona is hardest.** Customer is functionally cold. May have moved, sold the vehicle, switched dealers, or simply forgotten the relationship. Conversion rates are low but the cost of reaching this segment is also low (the dealer already has the data).

**Cadence.** 30-day window, 3 touches. Stop sooner if no engagement.
- Day 0: Email (warm reconnect: "We miss seeing you. Here's what's new at [Dealership Name].")
- Day 14: Email (offer-led: current promotion or service-side reason to return)
- Day 28: SMS (final touch, only if opt-in is current and never engaged with the prior emails)

If no engagement after 30 days, move customer to a quarterly dormant list and stop active outreach.

**Primary metric.** Re-engagement (email open, SMS reply, service visit booked).

---

## KPI framework

Every campaign tracks the same metric hierarchy.

### Primary metric

The single most important number per persona. For most personas: **appointments set per 100 customers contacted.**

For S2S: **sales appointments scheduled per 100 service visits in the segment.**
For lease returners: **retention rate (percent of returners who lease or buy from the dealer).**
For dormant reactivation: **re-engagement rate (any positive response in 30 days).**

### Secondary metrics

- Response rate per channel (email open rate, SMS reply rate, RVM callback rate)
- Opt-out rate per channel (target: under 1% per touch)
- Suppression hit rate (how many recipients were excluded by suppression checks — should be 5 to 15% of segment; if higher, the database is dirty)
- Sold rate among appointments (target: 30 to 50% for most personas)
- Sold rate among segment (the funnel-end metric)
- Average gross per converted deal (the financial outcome metric)

### Decision rules

Before launch, write down:
- **Expand:** Above what threshold do we increase budget or expand the segment?
- **Fix:** What threshold triggers a campaign change (creative, offer, cadence)?
- **Kill:** What threshold means stop, the persona is not converting?

A common starting framework:
- Above 5 appointments per 100 contacted → expand.
- 2 to 5 appointments per 100 contacted → fix and re-test.
- Below 2 appointments per 100 contacted → kill and try a different persona or offer.

These are starting points. Real benchmarks vary by dealer, OEM, market, and segment quality.

---

## Cadence rules to never break

A few rules that hold across every persona and every campaign.

**Never send SMS without explicit SMS opt-in on file.** TCPA exposure on this is severe. The dealer's existing platform should track opt-in per channel; the campaign blueprint assumes it is gated correctly.

**Never send more than 2 SMS per recipient per week.** Diminishing returns and rising opt-out rates accelerate past this threshold.

**Never send ringless voicemail without checking state law.** Some states treat RVM as a call subject to TCPA. The campaign blueprint defaults to RVM only for opt-in segments and notes the dealer's compliance officer should validate.

**Never use a personal voice in RVM without genuine personalization.** A generic "this is the dealer" RVM converts worse than the same message sent as SMS. RVM works because it sounds like a personal touch. If the message is not personal, use SMS.

**Never send the same offer copy via three channels in one day.** Stagger touches. Different copy for different channels. Different angles on the same offer.

**Always note when the OEM has a specific program window.** OEM programs (loyalty bonuses, conquest cash, military discounts) have hard deadlines that should structure the campaign window.

---

## Common dealer mistakes the skill should prevent

These show up in nearly every dealer campaign the skill will see. Bake the prevention into the output.

**Single-channel email blasts.** Highest reach, lowest engagement. The skill defaults to 3-channel.

**Generic copy that does not name the customer's current vehicle.** Merge tokens for current vehicle and lease end date should be used. If the dealer's data does not support it, flag it and recommend data hygiene first.

**Offers that exceed reality.** "Up to $10,000 over Black Book" when the actual program is "$3,000 over Black Book on select models" destroys trust on first contact. Match the messaging to the actual offer.

**No suppression of recent buyers.** Recent buyer who is suddenly bombarded with trade offers feels insulted. Suppression list must exclude purchases in the last 12 months (configurable).

**Touches that pile up in 7 days.** Burnout. Spread the touches across the campaign window.

**No frequency cap across campaigns.** A customer in three campaigns simultaneously gets 6 SMS in a week. The dealer's CRM should enforce a global frequency cap; the campaign blueprint assumes it is in place and flags it as a prerequisite.

---

## When to recommend killing or pausing a campaign mid-flight

The skill should help the user know when to pull the plug. Recommend pausing if:

- Opt-out rate exceeds 3% on any single touch.
- Suppression hit rate exceeds 25% (database problem, not campaign problem).
- Response rate on the first two touches is under 0.5%.
- An OEM program changes mid-campaign in a way that breaks the offer.
- Any compliance issue is identified mid-flight (consent record discrepancy, TCPA complaint, etc.).

See TEMPLATES.md for messaging copy per persona and COMPLIANCE.md for the full compliance gating rules.
