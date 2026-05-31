# Dealer Equity Mining — Compliance Guardrails

The opt-in, suppression, frequency cap, and TCPA gating rules that apply to every campaign produced by this skill. SKILL.md references this file. Apply every guardrail to every touch in every campaign.

This file is not a legal document. It is the operational implementation of standard guardrails most CRM and outreach platforms support. Final compliance sign-off belongs to the dealer's compliance officer or legal counsel.

---

## The four gates every touch must pass

Every SMS, email, and ringless voicemail touch passes through four gates before it sends. If any gate fails, the touch does not send (and the recipient may stay on the campaign for the next gated touch).

### Gate 1. Opt-in status (per channel)

**SMS.** The recipient has explicit, documented SMS opt-in on file. Opt-in typically comes from:
- A signed credit application or finance form that includes SMS consent.
- A web form submission with a clearly labeled SMS opt-in checkbox.
- A service appointment scheduling form that includes SMS consent.
- A verbal SMS opt-in captured in the BDC and logged in the CRM with timestamp.

SMS opt-in without a documented source is not opt-in. Assume not opted in unless the CRM record confirms it.

**Ringless voicemail.** Depends on state law. Some states treat RVM as a regulated call under TCPA. Default: RVM only fires to recipients with explicit RVM consent OR an established business relationship within the last 18 months (purchase, service visit, signed credit application). Dealer's compliance officer signs off on state-specific application.

**Email.** The recipient has not unsubscribed from email and the email address is current in the CRM. CAN-SPAM applies. Standard.

### Gate 2. Suppression list

The recipient is not on any active suppression list. Standard suppression triggers:

- **Recently purchased** (within last 12 months by default; configurable). Suppresses Sales-facing touches but allows Service touches.
- **Active service complaint or open case.** Suppresses all outreach until case is closed.
- **Declared do-not-contact** for any reason.
- **Hard-bounced email** in the last 90 days. (Email-specific suppression.)
- **Reported SMS as spam** in the last 12 months. (SMS-specific suppression.)
- **Recently unsubscribed** from the channel.
- **OEM-restricted** (e.g., OEM has flagged the customer for a separate program and asked the dealer not to outreach during a defined window).
- **Litigation hold** or attorney-marked.

### Gate 3. Frequency cap

The recipient has not received too many touches from the dealer in the recent window. Defaults:

- **SMS.** No more than 2 SMS per recipient per week, no more than 6 per recipient per month, across all campaigns combined.
- **Email.** No more than 3 emails per recipient per week, no more than 12 per recipient per month, across all campaigns combined.
- **Ringless voicemail.** No more than 1 RVM per recipient per 14 days, no more than 2 per recipient per month, across all campaigns combined.

If a recipient is on multiple campaigns, the cap applies globally, not per campaign.

### Gate 4. Time-of-day restriction

Per TCPA and most state laws, SMS and RVM should not fire outside reasonable hours. Default:
- **SMS and RVM:** 8:00 AM to 8:00 PM local time per recipient.
- **Email:** No legal restriction but practical: send within the recipient's expected business hours (varies by audience).

If the dealer operates across multiple time zones, the recipient's local time governs.

---

## TCPA basics every dealer needs to know

TCPA is the Telephone Consumer Protection Act. It governs SMS, autodialer calls, and (in many cases) ringless voicemail.

**The simple rule.** For automated marketing communication to a mobile phone, you need express written consent. For non-automated calls in the context of an established business relationship, the bar is lower but not zero.

**What counts as express written consent.**
- A signed form (paper or e-sign) that explicitly opts the customer into SMS or call marketing.
- A web form with a clearly worded checkbox (not pre-checked).
- A verbal consent that is recorded and logged.

**What does NOT count.**
- "We have their number from their service appointment, so we can text them." (No.)
- "They gave us their number to call back about a vehicle, so SMS is fine." (No.)
- "They signed a privacy policy that mentions SMS." (No, unless the SMS consent was explicit and unbundled.)

**The penalty.** $500 to $1,500 per unauthorized text or call. A single campaign sent to 200 unconsented numbers can produce a $100,000 to $300,000 liability. TCPA litigation is a real and active risk vector for dealers.

---

## State-specific nuances to flag

Some states layer additional requirements on top of TCPA. The campaign blueprint should flag these for the dealer's compliance officer when applicable.

**California (CCPA, CPRA).** Adds data privacy obligations. CCPA opt-out applies. Some customers may have requested deletion of their data; the dealer's suppression list must respect those requests.

**Florida.** Restrictive caller ID and consent rules (as of recent Florida Telephone Solicitation Act amendments). Verify the dealer's outreach platform handles Florida-specific requirements.

**Washington.** State-specific telemarketing rules apply.

**New York.** Telemarketing registration and consent rules apply.

**Multi-state operators.** If the dealer's customer base spans multiple states, the campaign blueprint defaults to the most restrictive applicable rule.

This is not a comprehensive state list. The campaign blueprint flags state-specific review for any dealer operating outside of single-state.

---

## OEM-required disclosures

Many OEM programs require specific disclosures in the marketing messaging. Common patterns:

**Lease offers.** Must include monthly payment, total down, term, miles per year, and disposition fee. APR if relevant. "Subject to credit approval, see dealer for details" is standard.

**Cash offers.** Must specify the eligible customer (e.g., "current Buick or GMC owner") and the deadline (e.g., "ends March 31, 2026").

**Loyalty programs (GM Loyalty, Ford Bonus, Stellantis loyalty).** Often require eligibility verification language ("must show proof of current ownership of an eligible vehicle").

**Conquest cash.** Often requires the customer's current vehicle to be a non-eligible brand (e.g., GM conquest cash for current Ford or Stellantis owners).

The campaign blueprint flags when the dealer's offer triggers an OEM disclosure requirement and recommends the dealer's marketing or compliance team verify the disclosure language.

---

## Pre-launch checklist

Before any campaign launches, the dealer or agency runs through this checklist:

- [ ] All recipients have opt-in on file for every channel in use
- [ ] Suppression list applied (recent purchases, unsubscribes, do-not-contact, service complaints)
- [ ] Frequency caps configured per channel
- [ ] Time-of-day restrictions configured for SMS and RVM
- [ ] OEM disclosures included where required
- [ ] State-specific requirements verified for all states served
- [ ] Compliance officer sign-off documented
- [ ] CRM-side audit log captures every send for record-keeping (TCPA litigation requires proof of consent and send records for 4 to 6 years)
- [ ] Opt-out mechanism functional and tested on every channel (SMS STOP, email unsubscribe, RVM call-to-opt-out)

---

## Compliance failure modes and what to do

If any of these happens mid-campaign, pause immediately and triage:

- **Single TCPA complaint received.** Pause the campaign. Verify the consent record for the complaining recipient. Document the audit trail. Contact compliance counsel before resuming.
- **Opt-out rate spike (above 2% on a single touch).** Pause. Review the messaging — usually means the offer or the cadence is hitting wrong. Adjust and re-launch with smaller test segment.
- **Hard bounce rate spike on email (above 10%).** Pause email channel. Database hygiene issue. Run a cleanup before resuming.
- **State consent issue identified.** Pause that state's recipients immediately. Verify with compliance officer.
- **OEM disclosure missing.** Pause and add the disclosure before resuming.
- **Frequency cap violation discovered.** Pause global campaigns. Verify the CRM-side cap. Add capping layer if missing.

---

## What this skill enforces by default

When the user describes a campaign and asks the skill to build it, the skill applies all four gates automatically and notes the gate logic in the blueprint output. The skill does not generate a campaign that bypasses opt-in, suppression, frequency, or time-of-day requirements, even if the user asks.

If the user specifies "no opt-in gate" or "ignore suppression," the skill declines and explains why. This is a hard rule.

The skill is a design tool. It produces a campaign the dealer's stack can execute compliantly. The skill does not send. Execution and final compliance are the dealer's responsibility.
