# Dealer Email Flows — Reference Framework

The flow architecture, the cadence rules, and the program governance. SKILL.md references this file. Read it before designing any email program.

---

## The 17 flows

The library covers every recurring relationship moment for a dealer customer. Organized into four categories.

### Category 1: Retention (5 flows)

The flows that keep an existing customer engaged with the dealership over time.

1. **Service reminder.** Triggered by mileage signal or calendar interval. Recurring throughout ownership.
2. **Declined recovery.** Triggered by declined-work signal from RO. 30/60/90/120 day cadence.
3. **Lapsed-service revival.** Triggered when customer has not visited service in 12+ months.
4. **Anniversary.** Triggered on the annual anniversary of purchase. Recurring.
5. **Win-back.** Triggered when customer has fully disengaged (no purchase, no service, no engagement in 24+ months).

### Category 2: Transactional (4 flows)

The flows that confirm or follow up on specific dealership interactions.

6. **Service appointment confirmation.** Triggered when service appointment is scheduled.
7. **Post-service NPS.** Triggered 24-48 hours after service completion.
8. **Recall outreach.** Triggered by OEM recall data signal.
9. **Quote follow-up.** Triggered when customer received a quote but did not commit.

### Category 3: Lifecycle milestones (4 flows)

The flows tied to specific points in the customer's ownership timeline.

10. **Delivery welcome.** Triggered at delivery; runs in parallel with dealer-new-customer-onboarding for the first 90 days, then transitions to ongoing.
11. **Lease maturity.** Triggered 90 days before lease end. Critical retention moment.
12. **Equity check-in.** Triggered when customer reaches positive equity threshold. Hands off to dealer-equity-mining-campaign-builder.
13. **Birthday.** Triggered on customer's birthday. Annual.

### Category 4: Occasional (4 flows)

The flows that fire periodically based on dealer-level events.

14. **OEM event invite.** Triggered by OEM-driven events (new model launches, factory recalls, OEM-funded promotions).
15. **Holiday.** Major US holidays (Memorial Day, July 4, Labor Day, Thanksgiving, Christmas/New Year). Sometimes regional (Mother's Day, Father's Day).
16. **Referral.** Triggered after positive customer signal (good review, repeat visit). Annual cadence.
17. **Test-drive follow-up.** Triggered when prospect has test-driven but not purchased. 3-touch sequence.

---

## Cadence architecture

Every customer should experience the right density of touches across all flows. Too few and the dealer is forgotten. Too many and the dealer becomes spam.

### Global cadence limits

- **Maximum emails per customer per week:** 3 (across all flows combined)
- **Maximum SMS per customer per week:** 2 (across all flows combined)
- **Maximum total touches per customer per week:** 4 (email + SMS combined)
- **Minimum days between touches of the same type:** 1 (no same-day-multiple-touches in the same channel)

When multiple flows would fire on the same day, sequence priority applies (see below). Lower-priority flows are postponed.

### Priority order when conflicts arise

1. **Recall outreach** (safety; OEM-required)
2. **Service appointment confirmation** (transactional)
3. **Equity mining time-bound campaigns** (handled by dealer-equity-mining-campaign-builder)
4. **Declined recovery** (revenue-critical)
5. **Lease maturity** (retention-critical)
6. **Service reminder** (regular cadence)
7. **Lifecycle milestone flows** (anniversary, birthday)
8. **Occasional flows** (OEM event, holiday, referral)
9. **Lapsed-service revival, win-back** (engagement attempts)

When a conflict occurs, the higher-priority flow sends; the lower-priority is postponed (by 1 to 7 days depending on flow).

### Frequency capping across flows

The CRM should track total send count per customer across all flows. If a customer has received 3 emails this week, no more email flows fire for that customer until the week resets.

The skill produces flow designs that assume the CRM enforces this. If the dealer's CRM does not enforce global capping, the skill flags this as a prerequisite.

---

## Flow design principles

These principles apply to every flow.

### 1. Specificity beats generic

Every flow uses merge tokens for first name, vehicle, salesperson or service advisor, and relevant lifecycle context. Generic "Dear Customer" is forbidden.

### 2. Subject lines are work

Subject lines determine 60%+ of open rate. Every flow gets 2 to 3 subject line variants for A/B testing.

### 3. Conversational tone over marketing tone

The dealer's voice (from dealer-store-positioning) is conversational. Email copy matches. No marketing slogans, no superlatives.

### 4. Short bodies outperform long bodies

Most flows use 50 to 150 word bodies. Service reminders, transactional confirmations, and SMS messages are shorter still.

### 5. Clear CTA per email

One primary action per email. The CTA is named explicitly (not "click here"). Examples: "Schedule your service appointment", "Reply with your trade question", "Call your service advisor".

### 6. Mobile-first

70%+ of dealer email opens happen on mobile. Designs assume mobile reading. No 3-column layouts. No tiny CTAs.

### 7. Plain text fallback

Every HTML email has a plain text version that works alone. Some customers' email clients render plain text by default.

### 8. Personalization that requires data

When merge tokens reference data the dealer might not have (e.g., next-service mileage), the flow falls back to generic versions if data is missing. Never display "Hi {first_name}" if the first name is unknown.

---

## How flows integrate with each other

The 17 flows are not independent. Specific integration patterns:

### Delivery welcome integrates with onboarding

The "delivery welcome" flow in this skill is a single email at day 1, day 7, and day 30. It runs alongside `dealer-new-customer-onboarding` which has the full 15-20 touchpoint program. The two are not duplicative; this skill's delivery welcome is the email-only baseline that always fires, while the onboarding skill is the comprehensive multi-channel program.

When both are deployed, the onboarding skill's email touchpoints take priority and this skill's "delivery welcome" emails are suppressed for the first 90 days.

### Service reminder + service appointment confirmation

When the service reminder fires and the customer schedules an appointment, the reminder cadence pauses for that customer and the service appointment confirmation flow takes over.

### Equity check-in + equity mining campaign builder

The "equity check-in" flow in this skill is a single annual touchpoint surfacing potential trade equity. If the dealer is running a time-bound equity mining campaign via `dealer-equity-mining-campaign-builder`, the equity check-in is suppressed for customers in that campaign.

### Lease maturity + equity mining

90 days before lease end, the lease maturity flow fires. If the dealer runs a lease-returner equity mining campaign, the lease maturity flow may be augmented or replaced by the campaign builder's flow.

### Declined recovery + service reminder

If a customer declined a service recommendation in the last 90 days, the regular service reminder for that recommendation is suppressed; the declined recovery flow handles the follow-up.

### Win-back integrates with everything

A customer in active win-back is in critical state. All other flows except recall outreach and service appointment confirmation are suppressed for that customer until they re-engage.

---

## Audience segmentation rules

Every flow has a defined audience segment. Standard segments:

- **All active customers.** Have purchased OR serviced within last 24 months. Active opt-in.
- **Lease customers active.** Currently in a lease with the dealer.
- **Service customers active.** Have serviced with the dealer in last 12 months.
- **Lapsed service.** No service visit in 12+ months.
- **New customer (0-90 days).** Within the onboarding window.
- **Established customer (91+ days).** Past onboarding window.
- **Equity-positive (eligible for upgrade).** From DMS+credit data signal.
- **Recall-flagged.** Vehicle subject to active OEM recall.
- **Disengaged.** No engagement (open, click, visit) in 18+ months.

Each flow operates on one or more of these segments. Suppression rules excluded customers from inappropriate flows.

---

## Compliance baseline (inherited)

All compliance rules from `dealer-equity-mining-campaign-builder/COMPLIANCE.md` apply identically:

- Email opt-in (CAN-SPAM) for every email recipient
- SMS opt-in (TCPA) for every SMS recipient
- Time-of-day restrictions for SMS (8 AM to 8 PM local time)
- Suppression list per channel (unsubscribes, do-not-contact, recent complaints, OEM-restricted)
- Frequency caps respected globally
- Pre-launch compliance review for any new flow
- Audit log of every send for record-keeping

The skill does not produce flows that bypass these rules. If the user requests a flow that would violate, the skill declines and explains.

---

## Performance benchmarks (industry signals)

These are industry-typical signals. Each dealer's actual performance will vary.

| Flow | Typical open rate | Typical click rate | Typical conversion rate |
| --- | --- | --- | --- |
| Service reminder | 35-45% | 5-10% | 15-25% schedule appointment |
| Declined recovery | 25-35% | 4-8% | 8-15% return for declined work |
| Lapsed-service revival | 15-25% | 2-5% | 3-7% return for service |
| Anniversary | 30-40% | 4-7% | N/A (engagement only) |
| Win-back | 10-18% | 1-3% | 1-4% re-engagement |
| Service appointment confirmation | 50-65% | 15-25% | 90-95% appointment kept |
| Post-service NPS | 25-35% | 8-15% | 35-45% review submitted |
| Recall outreach | 25-35% | 8-15% | 40-55% recall scheduled |
| Quote follow-up | 20-30% | 5-10% | 8-15% reply or visit |
| Delivery welcome | 60-75% | 15-25% | N/A (engagement) |
| Lease maturity | 40-55% | 10-18% | 35-50% retention |
| Equity check-in | 25-35% | 5-10% | 5-10% trade evaluation |
| Birthday | 25-35% | 3-6% | N/A (engagement) |
| OEM event invite | 20-30% | 5-10% | 3-8% attend or inquire |
| Holiday | 18-28% | 3-6% | N/A (engagement) |
| Referral | 25-35% | 4-8% | 2-5% referral made |
| Test-drive follow-up | 30-45% | 8-15% | 10-20% return for purchase |

When a flow significantly underperforms these benchmarks, the cause is typically copy quality, send time, segment hygiene, or send frequency (over-sending).

See FLOWS.md for the complete library with copy templates per flow.
