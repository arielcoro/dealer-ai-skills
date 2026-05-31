# Dealer Email Flows — Complete Flow Library

The 17 dealer-specific email flows with copy templates. SKILL.md and REFERENCE.md reference this file. Each flow includes trigger, audience, cadence, channels, copy, and personalization tokens.

Merge tokens used throughout: `{first_name}`, `{vehicle_year}`, `{vehicle_make}`, `{vehicle_model}`, `{salesperson_name}`, `{service_advisor_name}`, `{dealership_name}`, `{phone_number}`, `{service_phone}`, `{calendly_link}`, `{review_link}`, `{lease_end_date}`, `{equity_estimate}`, `{recommended_vehicle}`.

---

## Flow 1: Service reminder

**Audience:** Service customers active. Triggered by mileage-based interval or calendar interval (whichever comes first).

**Trigger:** Mileage signal from DMS data crosses next-service threshold OR calendar interval (typically 5 months) since last service.

**Cadence:** 3 touches over 21 days.

**Channels:** Email primary; SMS supplemental day 14 if no engagement on email.

### Touch 1 (Day 0). Email

**Subject A:** {first_name}, your {vehicle_make} is due for service

**Subject B:** Time for your {vehicle_make}'s scheduled service

**Preview:** {service_advisor_name} has slots open this week.

**Body:**

Hi {first_name},

Your {vehicle_year} {vehicle_make} is due for its scheduled service. We typically recommend [service type] every [interval].

{service_advisor_name} has slots open:

- [Date 1]
- [Date 2]
- [Date 3]

Schedule online: {calendly_link}
Or call {service_phone}

We can also accommodate after-hours drop-off if your schedule is tight.

{service_advisor_name}
{dealership_name}

### Touch 2 (Day 7). Email

**Subject:** {first_name}, friendly reminder on your {vehicle_make} service

**Body:** Briefer reminder. Same CTA. Includes a sentence on why this service matters (warranty, longevity, performance).

### Touch 3 (Day 14). SMS

**Body (149 chars):**

{first_name}, your {vehicle_make} is overdue for service. {service_advisor_name} has slots this week. Reply YES or call {service_phone}.

**Suppression rules:** Customers in active win-back; customers with declined-work flag on the same recommendation (use declined recovery flow instead); customers who unsubscribed from service emails.

**Success metric:** Service appointment scheduled within 21 days of first touch.

---

## Flow 2: Declined recovery

**Audience:** Customers who had work declined at service visit.

**Trigger:** Declined-work line item logged in RO.

**Cadence:** 4 touches at 30, 60, 90, 120 days post-decline.

**Channels:** Email + SMS supplemental.

### Touch 1 (Day 30). Email

**Subject:** {first_name}, about that {declined_item}

**Body:**

Hi {first_name},

When you came in on [date], we recommended [declined_item] for your {vehicle_make}, and you decided to hold off. Totally understand — timing matters.

Quick check-in: did your situation change? If you'd like to schedule the work now, here's what it looks like:

- Service: [declined_item]
- Estimated time: [hours]
- Estimated cost: ${cost} (or your specific quote)
- Why it matters: [one sentence on consequence of delay]

Schedule online: {calendly_link} or call {service_phone}.

{service_advisor_name}

### Touch 2 (Day 60). Email

Slightly more urgent. References that the recommendation has been outstanding for 60 days.

### Touch 3 (Day 90). SMS

**Body (153 chars):**

{first_name}, your {vehicle_make} still needs [declined_item]. Time matters with this one. Schedule: {calendly_link} or call {service_phone}.

### Touch 4 (Day 120). Email

Final attempt. Includes a discount or incentive if dealer policy allows.

**Suppression rules:** Customer scheduled the declined work (resolved); customer disengaged completely.

**Success metric:** Declined work scheduled within 120 days.

---

## Flow 3: Lapsed-service revival

**Audience:** Lapsed service customers (no visit in 12+ months).

**Trigger:** Calendar interval since last service crosses 12 months.

**Cadence:** 3 touches over 60 days.

**Channels:** Email primary; SMS optional only with explicit opt-in.

### Touch 1 (Month 12). Email

**Subject:** {first_name}, we miss seeing your {vehicle_make}

**Body:**

Hi {first_name},

It's been a year since we saw your {vehicle_year} {vehicle_make}. Hope it's still treating you well.

A few things to know:

- Your next scheduled service is recommended around [mileage/date].
- We have new service capabilities since you last visited: [recent additions].
- {service_advisor_name} would love to see you back.

Want to schedule a check-up visit? {calendly_link} or {service_phone}.

If you've moved or your situation has changed, just reply and let us know. We want to keep you in the loop.

{service_advisor_name}
{dealership_name}

### Touch 2 (Month 13). Email

Slightly different angle. Offers a free multi-point inspection as a re-engagement incentive.

### Touch 3 (Month 14). Email

Final attempt. Honest acknowledgment that it's been a while and the dealer cares.

**Suppression rules:** Customer schedules service (resolved); customer responds with "I moved" or similar (move to dormant); customer unsubscribed.

**Success metric:** Service visit scheduled within 60 days of first touch.

---

## Flow 4: Anniversary

**Audience:** All purchased customers.

**Trigger:** Annual anniversary of purchase date.

**Cadence:** 1 touch per year.

**Channels:** Email.

### Touch (Anniversary). Email

**Subject:** {first_name}, can you believe it's been [N] years?

**Body:**

Hi {first_name},

[N] years ago today, you took delivery of your {vehicle_year} {vehicle_make}. We hope it's been good to you.

A few quick things:

- If you've been happy with the vehicle, we'd love a quick review: {review_link}
- Your next service is recommended around [date or mileage]. {service_advisor_name} can help schedule.
- If you ever want to chat about what's next, {salesperson_name} is here.

Thanks for being part of the {dealership_name} family.

{dealer_principal_name}

**Suppression rules:** Customer in active equity mining campaign (likely to upgrade soon).

**Success metric:** Email open + click on next-service or review CTA.

---

## Flow 5: Win-back

**Audience:** Disengaged customers (no purchase, no service, no engagement in 24+ months).

**Trigger:** Disengagement signal in CRM crosses 24 months.

**Cadence:** 2 touches over 30 days. Then dormant if no response.

**Channels:** Email primary.

### Touch 1 (Day 0). Email

**Subject:** {first_name}, we'd love to reconnect

**Body:**

Hi {first_name},

It's been a while since we've heard from you. We wanted to reach out and say hello.

A few things that have changed at {dealership_name} since you last visited:

- [Recent service department update]
- [New dealership facility or technology]
- [Most recent OEM recognition]

If your situation has changed, please let us know. If you've sold the vehicle or moved on, we totally understand — just reply and let us know.

If you'd like to come back, we'd love to see you. Whether it's for service or just to look at the new inventory, {salesperson_name} or {service_advisor_name} are always here.

Hope you're well,

{dealer_principal_name}

### Touch 2 (Day 30). Email

Final attempt. Briefer, with a service credit or specific offer to incentivize re-engagement.

**Suppression rules:** Customer responds (move out of win-back); customer explicitly opts out (suppress permanently); customer has had any positive engagement signal in last 90 days.

**Success metric:** Re-engagement (open, click, visit) within 30 days.

---

## Flow 6: Service appointment confirmation

**Audience:** Customers who have scheduled a service appointment.

**Trigger:** Service appointment scheduled in DMS.

**Cadence:** 3 touches: confirmation, day-before reminder, day-of reminder.

**Channels:** Email + SMS.

### Touch 1 (Immediately on scheduling). Email

**Subject:** Confirmed: {first_name}, your service is on the calendar

**Body:**

Hi {first_name},

Confirming your service appointment:

- **Date:** [Appointment date and time]
- **Vehicle:** {vehicle_year} {vehicle_make} {vehicle_model}
- **Services:** [Services to be performed]
- **Estimated duration:** [Hours]
- **Service advisor:** {service_advisor_name}, {service_phone}
- **Location:** [Service drive entrance address]

Loaner available if confirmed in advance. Reply if you need one.

Need to reschedule? Use {calendly_link} or call {service_phone}.

{service_advisor_name}

### Touch 2 (Day-before, 24 hours before appointment). SMS + email

**SMS body (148 chars):**

Reminder: your {vehicle_make} service at {dealership_name} is tomorrow at [time]. {service_advisor_name} will be expecting you.

### Touch 3 (Day-of, 2 hours before appointment). SMS

**SMS body (151 chars):**

See you soon, {first_name}. Your service at {dealership_name} is in 2 hours. Reply if anything has changed.

**Suppression rules:** Customer cancels appointment (suppress all future touches for this appointment); appointment is rescheduled (reset).

**Success metric:** Appointment kept (90%+).

---

## Flow 7: Post-service NPS

**Audience:** Customers who completed a service visit.

**Trigger:** Service visit closed in DMS.

**Cadence:** 1 touch at 24-48 hours after service completion.

**Channels:** Email + SMS supplemental.

### Touch (Day 1 post-service). Email

**Subject:** {first_name}, how did we do?

**Body:**

Hi {first_name},

Thanks for bringing your {vehicle_make} in yesterday. We took care of [services performed].

Quick favor: on a scale of 0 to 10, how likely are you to recommend {dealership_name} to a friend or family member?

[0 -- 1 -- 2 -- 3 -- 4 -- 5 -- 6 -- 7 -- 8 -- 9 -- 10]

If 9 or 10, would you mind sharing on Google? {review_link}

If less than 9, would you reply to me directly with what we could have done better? Your feedback helps us improve.

Thanks {first_name},

{service_advisor_name}
Direct: {service_phone}

### Optional SMS supplement

**Body (151 chars):**

{first_name}, quick favor — would you take 30 seconds to share your experience? {review_link}. Thank you. {service_advisor_name}

**Suppression rules:** Customer already submitted recent review; customer flagged with active complaint.

**Success metric:** Survey response (target 30%+); positive review submitted (target 15%+).

---

## Flow 8: Recall outreach

**Audience:** Customers whose vehicles are subject to active OEM recall.

**Trigger:** OEM recall data signal arrives in CRM matching customer vehicle.

**Cadence:** 3 touches over 60 days.

**Channels:** Email + SMS + ringless voicemail (when appropriate).

### Touch 1 (Day 0). Email

**Subject:** {first_name}, important recall on your {vehicle_make}

**Body:**

Hi {first_name},

Your {vehicle_year} {vehicle_make} is part of OEM recall [Recall number / name]. The OEM has identified [brief recall explanation].

Recall service is **free** and takes approximately [duration]. We can typically schedule within [days].

Schedule the recall service:

- Online: {calendly_link}
- Phone: {service_phone}
- {service_advisor_name} is your point of contact

Recall service is important for safety. Please don't delay.

{service_advisor_name}

### Touch 2 (Day 14). SMS

**Body (152 chars):**

{first_name}, your {vehicle_make} has an open recall. Free service, ~[duration]. Schedule: {calendly_link} or call {service_phone}.

### Touch 3 (Day 30). Email + optional voicemail

More urgent. Includes any updated information from the OEM.

**Optional RVM script (25 seconds):**

"Hi {first_name}, this is {service_advisor_name} from {dealership_name}. I want to make sure you know about the recall on your {vehicle_make}. It's a free fix, takes about [duration]. Please call me back at {service_phone}. Safety matters. Thanks {first_name}."

**Suppression rules:** Recall service completed (resolved); customer unable to receive (deceased, traded, etc.).

**Success metric:** Recall service scheduled within 60 days (target 50%+).

---

## Flow 9: Quote follow-up

**Audience:** Prospects who received a quote but did not commit.

**Trigger:** Quote generated in CRM, customer did not move forward within 7 days.

**Cadence:** 3 touches over 21 days.

**Channels:** Email + SMS.

### Touch 1 (Day 7 post-quote). Email

**Subject:** {first_name}, did you have any questions about your {vehicle_model} quote?

**Body:**

Hi {first_name},

Last week we put together a quote for the {vehicle_year} {vehicle_make} {vehicle_model}. Did you have any questions about it?

Sometimes the financing piece needs a closer look. Sometimes there are incentives we didn't cover. Sometimes timing is just off.

Whatever it is, I'd like to help. Here are three quick ways to get there:

1. Reply with your question
2. Call me at {phone_number}
3. Drop by — I'll have the {vehicle_model} ready

{salesperson_name}

### Touch 2 (Day 14). SMS

**Body (147 chars):**

{first_name}, this is {salesperson_name} from {dealership_name}. Did you have questions about the {vehicle_model} quote? Reply or call {phone_number}.

### Touch 3 (Day 21). Email

Final attempt. May include updated incentives if available.

**Suppression rules:** Customer purchased a vehicle (resolved); customer purchased elsewhere; customer opted out.

**Success metric:** Conversation re-engagement or appointment scheduled within 21 days.

---

## Flow 10: Delivery welcome

**Audience:** Customers who just took delivery of a vehicle.

**Trigger:** Delivery completed in DMS.

**Cadence:** 3 touches: day 1, day 7, day 30.

**Channels:** Email.

**Note:** When dealer-new-customer-onboarding is also deployed, this flow's touches are suppressed in favor of the more comprehensive onboarding program. This flow is the email-only baseline that always fires.

### Touch 1 (Day 1). Email

(See dealer-new-customer-onboarding for the canonical version. This is the simplified version used when onboarding is not deployed.)

### Touch 2 (Day 7). Email

Welcome reinforcement, app activation reminder, service intro reminder.

### Touch 3 (Day 30). Email

First service approach reminder. Transitions to the service reminder flow at day 30+ onward.

**Suppression rules:** Customer in active dealer-new-customer-onboarding program.

**Success metric:** Open rate 60%+ across all 3 touches; click on service scheduler CTA.

---

## Flow 11: Lease maturity

**Audience:** Lease customers within 90 days of lease end.

**Trigger:** Lease end date minus 90 days.

**Cadence:** 5 touches over 90 days.

**Channels:** Email + SMS + optional ringless voicemail.

### Touch 1 (Day -90). Email

**Subject:** {first_name}, your lease ends {lease_end_date} — let's talk options

**Body:**

(See dealer-equity-mining-campaign-builder/TEMPLATES.md "Persona 1: Lease returner" for the full template library. This flow uses Touch 1 there as its canonical version.)

### Touches 2-5

Use Persona 1 in TEMPLATES.md.

**Suppression rules:** Customer turned in vehicle and leased new (resolved); customer bought out lease (resolved); customer in active equity mining campaign (handled by campaign builder).

**Success metric:** Lease-end retention rate (target 60%+).

---

## Flow 12: Equity check-in

**Audience:** Customers who have crossed positive-equity threshold.

**Trigger:** DMS + credit data shows positive equity above [threshold].

**Cadence:** 1 touch per year (annual check-in).

**Channels:** Email.

### Touch (Annual). Email

**Subject:** {first_name}, quick note about your {vehicle_make}

**Body:**

(See dealer-equity-mining-campaign-builder/TEMPLATES.md "Persona 2: Equity-positive trade-up" for the full template. This flow uses Touch 1 there as its canonical version.)

**Suppression rules:** Customer in active equity mining campaign (handled by campaign builder); customer recently engaged with sales side (suppress for 90 days).

**Success metric:** Click on trade evaluation or appointment CTA.

---

## Flow 13: Birthday

**Audience:** All customers with birth date on file.

**Trigger:** Customer birthday.

**Cadence:** 1 touch per year.

**Channels:** Email; SMS optional.

### Touch (Birthday). Email

**Subject:** Happy birthday, {first_name}!

**Body:**

Hi {first_name},

Happy birthday from the {dealership_name} family.

Hope your day is everything you want it to be.

If you're due for service, {service_advisor_name} would love to see you back. We'll throw in a complimentary [small gift: car wash, multi-point inspection, etc.] as a birthday gesture.

Best wishes,

{dealership_name} team

**Suppression rules:** Customer in active win-back (different priorities); customer disengaged.

**Success metric:** Engagement (open, reply); customer redeems offer.

---

## Flow 14: OEM event invite

**Audience:** Active customers matching OEM event criteria.

**Trigger:** OEM event communication arrives (model launch, OEM-funded promo, factory event).

**Cadence:** 2 touches per event.

**Channels:** Email primary.

### Touch (Pre-event). Email

**Subject:** {first_name}, [OEM event name] at {dealership_name}

**Body:**

Hi {first_name},

[OEM] is hosting [event name] and we wanted you on the invite list.

What it is: [Event description]
When: [Date and time]
Where: {dealership_name}
What to expect: [What customers experience]

Limited spots. Please RSVP by [date]: [RSVP link or reply].

{dealer_principal_name} will be there. Hope to see you.

{dealership_name}

### Touch (Post-event, attendees only). Email

Thank-you email with photos and recap.

**Suppression rules:** Customer attended (different post-event flow); customer declined explicitly.

**Success metric:** RSVP rate (target 5-10%); actual attendance (target 50%+ of RSVPs).

---

## Flow 15: Holiday

**Audience:** All active customers.

**Trigger:** Calendar event (major US holidays).

**Cadence:** 1 touch per holiday. Limit: 4-5 holidays per year.

**Channels:** Email.

### Touch (Holiday). Email

**Subject (Memorial Day example):** {first_name}, honoring Memorial Day

**Body:**

Hi {first_name},

Memorial Day. We pause to remember.

The {dealership_name} team thanks the veterans and active service members in our community and beyond.

Our hours this weekend:
- Saturday: [hours]
- Sunday: [hours, if open]
- Monday (Memorial Day): [hours, often closed]

If you're a veteran or active service member, we offer [military discount/program] year-round. Stop by anytime.

Have a meaningful holiday,

{dealership_name}

**Suppression rules:** Customer in active win-back (less relevant); customer explicitly opted out of marketing email.

**Success metric:** Engagement (open, click).

---

## Flow 16: Referral

**Audience:** Customers who have given positive engagement signal (positive review, repeat visit, NPS 9-10).

**Trigger:** Positive signal logged in CRM. 90+ days since last referral ask.

**Cadence:** 1 touch per ask; up to 2 asks per year per customer.

**Channels:** Email.

### Touch. Email

**Subject:** {first_name}, would you introduce us?

**Body:**

Hi {first_name},

Many thanks for the [positive signal: review, repeat visit, kind words]. It means a lot.

Quick ask: do you know anyone shopping for a {brand_portfolio} vehicle right now?

Our best customers come from referrals. If you know someone, we'd love an introduction. Here's our referral program:

- [Referral program details: incentive for the referrer, intro process]

You can also just reply to this email with the person's name. I'll handle the rest.

Thanks for thinking of us,

{salesperson_name}

**Suppression rules:** Customer recently made a referral; customer opted out.

**Success metric:** Referral submitted (target 2-5% of asked customers).

---

## Flow 17: Test-drive follow-up

**Audience:** Prospects who test-drove but did not purchase.

**Trigger:** Test drive logged in CRM, no purchase within 7 days.

**Cadence:** 3 touches over 14 days.

**Channels:** Email + SMS.

### Touch 1 (Day 7 post-test-drive). Email

**Subject:** {first_name}, how was the {vehicle_model}?

**Body:**

Hi {first_name},

Last week you test-drove the {vehicle_year} {vehicle_make} {vehicle_model}. How did it feel?

A few common questions after the test drive:

- Did the cargo space work for what you need?
- How did the [specific feature mentioned during test drive] strike you?
- Did the price + payment math work?

Any of those land? Reply with what's on your mind. Or if you'd like to take it for a longer drive, we can arrange that too.

{salesperson_name}

### Touch 2 (Day 10). SMS

**Body (148 chars):**

{first_name}, this is {salesperson_name}. Did the {vehicle_model} test drive feel right? Reply with what's on your mind, or call {phone_number}.

### Touch 3 (Day 14). Email

Final attempt. Brief, with a closing question.

**Suppression rules:** Customer purchased (resolved); customer purchased a different vehicle from the dealer (resolved); customer purchased elsewhere (move to win-back queue).

**Success metric:** Re-engagement or appointment scheduled within 14 days.

---

## How to customize

Each flow above is a starting template. Customize per:

- **Voice.** Apply the voice from dealer-store-positioning output.
- **Brand portfolio.** Replace model and OEM-specific tokens.
- **Service capacity.** Adjust slot suggestion windows per service capacity.
- **Bilingual.** Produce Spanish versions with cultural localization.
- **Existing CRM constraints.** Some CRMs do not support all merge tokens. Fall back to safer defaults when data is missing.

When in doubt, the rule is: simpler and more honest beats clever and copy-heavy. The customer is busy. Respect their time.

---

## Compliance reminders

Apply all rules from `dealer-equity-mining-campaign-builder/COMPLIANCE.md`:

- Opt-in per channel before any send
- Suppression list applied (unsubscribes, do-not-contact, recent complaints)
- Global frequency caps (3 emails / 2 SMS per customer per week max)
- Time-of-day restrictions for SMS (8 AM to 8 PM local time)
- State-specific TCPA nuances reviewed for multi-state operators
- OEM-required disclosures included where applicable
- Audit log of every send retained per record-keeping requirements

The skill never produces a flow that bypasses these guardrails.
