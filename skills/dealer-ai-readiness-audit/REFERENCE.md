# Dealer AI Readiness Audit — Reference Framework

The full 75-point, 17-section diagnostic. This is the authoritative source for the audit content. SKILL.md references this file. Do not paraphrase from memory when running the audit. Read the relevant section here and use the language directly.

Total possible score: 150 points.

---

## How scoring works on every item

**Green (2 points).** True today. Verified. Documented. Someone owns it.

**Yellow (1 point).** Partly true. Working but inconsistent, undocumented, or dependent on a single person who could leave tomorrow.

**Red (0 points).** Not true. Unknown. Or assumed to be true with no proof.

The honest rule, baked into every item: if the dealership cannot produce evidence, score Red. The audit is only useful if it is honest.

---

# Part 1. Foundation

## Section 1. Data foundation (12 pts)

Before AI can help, the store has to know what data it has, where that data lives, and which of it is trustworthy.

**1.1 Inventoried systems.** The store has a written list of every system that holds customer, lead, vehicle, financial, or operational data. DMS, CRM, website platform, inventory feed, chat tool, call tracking, texting platform, F&I menu, service scheduler, payroll, accounting, parts catalog. If a manager cannot name the systems on a notecard, score Red.

**1.2 Data ownership.** Each system has a named human owner inside the dealership. Not the vendor. Not "whoever set it up." A named person who can grant access, kill access, and answer questions about the data inside.

**1.3 Data quality baseline.** Someone has run a duplicate check, a stale-record check, and a missing-field check on the CRM and DMS in the last ninety days. The store knows what percentage of records are usable.

**1.4 Integration map.** The store knows which systems talk to which other systems, in which direction, and whether the integration is API-based, file-based, or manual copy-paste. If two managers give different answers, score Red.

**1.5 DMS data access rights.** The store has reviewed its DMS contract and knows what it costs and how long it takes to give a third-party AI vendor read or write access to its own data. The CDK-Reynolds antitrust litigation made this a public issue. The lesson holds across vendors: know the cost of moving your own data before you need to move it.

**1.6 Customer data segmentation.** The store can identify which records contain financial information protected under the FTC Safeguards Rule and which do not. AI vendors that touch protected data are governed differently from AI vendors that do not.

---

## Section 2. Website technical foundation (14 pts)

If the signal cannot leave the building, nothing else matters.

**2.1 Crawlability and indexability.** Inventory, SRP, VDP, service, finance, and location pages return a 200 status code, are not blocked by robots, and appear in Google Search Console as indexed. If half the VDPs are excluded, score Red.

**2.2 Page speed for humans and machines.** Core Web Vitals pass on mobile for the home page, an SRP, a VDP, and the service page. Slow pages lose customers and get crawled less often.

**2.3 Structured data is correct, complete, and stable.** AutoDealer schema on the home page. Vehicle schema with VIN, price, availability, and mileage on every VDP. LocalBusiness schema with consistent NAP. Service schema on the service page. FAQPage schema where Q&A exists. If schema breaks every inventory feed update, score Red.

**2.4 NAP consistency.** Name, address, and phone are identical on the website, Google Business Profile, OEM locator, Facebook, Apple Maps, and the top ten directories.

**2.5 Differentiation content.** Every primary page explains why this dealership, not just which vehicles are on the lot. The "why us" answer is on the home page, the about page, and the service page.

**2.6 Internal search hygiene.** Internal site search works and does not generate hundreds of crawlable thin pages. Faceted navigation is controlled.

**2.7 Site speed monitoring.** Someone watches Core Web Vitals weekly. Regression triggers an action.

---

## Section 3. AI visibility and answer engine readiness (16 pts)

Customers are asking ChatGPT, Perplexity, Gemini, and Copilot which dealer to buy from. The store that does not appear does not exist for that buyer.

**3.1 Visibility on core queries.** Test ten queries by hand on AI engines. "Best [brand] dealer near [city]." "Where to get a [model] serviced in [zip]." If the dealership is missing or misrepresented, score Red.

**3.2 Brand-name accuracy in AI responses.** Ask AI engines about the store by name. Confirm hours, address, brand portfolio, and key staff are correct.

**3.3 llms.txt published and curated.** An llms.txt file at the root gives AI engines a curated map of the most important content.

**3.4 AI crawlers not accidentally blocked.** Robots.txt does not blanket-block GPTBot, ClaudeBot, PerplexityBot, or Google-Extended unless that block is deliberate and approved.

**3.5 Entity reinforcement across the web.** Google Business Profile, Yelp, BBB, OEM locator, Apple Maps, Bing Places, and major directories carry the same facts the website carries.

**3.6 Review velocity and breadth.** Fresh reviews land on Google, Yelp, DealerRater, and Cars.com on a regular cadence, not in suspicious bursts.

**3.7 Third-party citations.** The dealer principal, the rooftop, or the store is mentioned on at least one high-authority third-party source: local newspaper, OEM press release, industry trade publication, chamber of commerce.

**3.8 Conversational content on key pages.** Buying-help and service-help pages answer real customer questions in plain language. AI engines extract sentences; pure marketing copy gives them nothing to extract.

---

## Section 4. Security, privacy, and compliance (20 pts)

AI without governance is a lawsuit waiting for a trigger.

**4.1 Written information security program.** A current, written information security program under the FTC Safeguards Rule. Reviewed in the last twelve months. Signed by the qualified individual.

**4.2 Multi-factor authentication everywhere.** MFA is enforced on every system that touches customer information, including DMS, CRM, email, and AI tools that handle customer data.

**4.3 Vendor risk reviews.** Every AI vendor has documented review of data accessed, storage location, subprocessors, and handling on cancellation.

**4.4 Penetration testing and vulnerability scanning.** Annual third-party pen test for stores with more than 5,000 consumer records. Vulnerability scanning at least every six months. Findings remediated, not filed.

**4.5 Breach notification readiness.** Written playbook for FTC breach notification within thirty days of discovering unauthorized acquisition of unencrypted information affecting five hundred or more consumers.

**4.6 OFAC sanctions screening and retention.** Every deal runs OFAC screening. Records retained for ten years per the 2025 update to the 21st Century Peace through Strength Act.

**4.7 State AI law exposure mapped.** Exposure to Colorado AI Act and equivalent laws is mapped for both in-state and out-of-state customers. The Colorado AI Act (SB 26-189) takes effect January 1, 2027 and covers automated decision-making influencing financial or lending decisions.

**4.8 Adverse action and human-review playbook.** Where AI influences a financial decision, the store can produce a notice to the consumer, an explanation of the AI's role, and a process for meaningful human review on request.

**4.9 Customer-facing AI disclosure.** When a customer is talking to an AI agent, they know it. Disclosure is in the script, chat header, or SMS opt-in.

**4.10 Free-tool data leakage policy.** Employees know not to paste customer information, deal sheets, or proprietary pricing into free public AI tools. A sanctioned tool exists for the work they would otherwise do in ChatGPT.

---

# Part 2. Operational readiness

## Section 5. BDC and customer contact center (16 pts)

The highest-leverage AI deployment in most stores, because it touches volume the human team is already missing.

**5.1 Missed-call baseline measured.** The store knows how many calls it misses per week, broken out by in-hours versus after-hours. Most stores miss three hundred to five hundred calls a week and do not know it.

**5.2 First-response time baseline measured.** Average response time on inbound web leads, chat leads, and SMS leads, by hour of day and day of week. "Fast" is Red.

**5.3 Appointment set rate baseline measured.** Set rate is measured by source for inbound calls and inbound web leads. A typical human BDC sets thirty to forty percent of qualified inbound calls.

**5.4 Hand-off rules written.** Written rules for when AI hands the call to a human and when a deal must touch a manager.

**5.5 Voicemail and after-hours coverage.** Every after-hours inbound call gets either an AI conversation or, at minimum, a tracked voicemail that triggers a callback.

**5.6 Call tracking and conversation intelligence.** Every inbound and outbound call is recorded, tracked, and tagged. CallRail or equivalent is properly configured. Calls flow back into the CRM with correct attribution.

**5.7 Outbound calling discipline.** Outbound calls are made on a defined cadence. The team knows the difference between "I called once" and "I made five attempts across three channels."

**5.8 SMS compliance.** Explicit opt-in for every number, current carrier registration, and audit-ready logs.

---

## Section 6. Variable operations: sales and F&I (18 pts)

Variable ops is where AI can lift gross. It is also where AI can incinerate a deal if governance is weak.

**6.1 Lead routing is deterministic.** The store knows which leads go to which salesperson, in which order, with which fallback. Routing is in the CRM, not in a spreadsheet on someone's desktop.

**6.2 Quote and price discipline.** Salespeople and any AI agent quoting price follow the same pricing rules. Single source of truth for price, payment, and incentives.

**6.3 Trade evaluation workflow.** Trade appraisals follow a documented workflow with photos, condition notes, and ACV ranges. AI pre-appraisals are clearly framed as estimates.

**6.4 Deal jacket discipline.** Deal jacket is digital, structured, and gated. OFAC, red flags, stip collection, and licensee verification are required fields.

**6.5 F&I menu consistency.** Every customer is presented the menu the same way. Documentation exists.

**6.6 Adverse action notices.** Produced automatically, on time, with correct reasons. AI involvement reflected in the audit trail.

**6.7 Stipulation collection automation.** Stips are collected through a digital workflow with automated reminders. Kick rate is measured. Industry average sits around fifteen percent.

**6.8 Equity mining active and current.** Defined cadence, fresh DMS and credit-bureau data, multi-channel outreach. SMS + email + voicemail outperforms email alone roughly two to one on contact-to-trade rate.

**6.9 Sales-to-service handoff.** New sold customers are introduced to service through a defined workflow, with a first-service appointment scheduled before they leave the lot.

---

## Section 7. Fixed operations: service and parts (18 pts)

Service and parts contribute roughly half of total dealer gross profit. AI here pays for itself faster than almost any other deployment, but only if the workflow is clean.

**7.1 Appointment booking is digital, accurate, and consistent.** Customer can book online, by phone, by text, and in person. Every channel returns the same available slots.

**7.2 Loaner and shuttle logistics integrated.** Booking workflow knows loaner availability and shuttle needs at the time of booking.

**7.3 Multi-point inspection completion is measured.** Many stores baseline around sixty-five to seventy-two percent MPI completion. Photo-required MPI workflow can lift completion to the mid-nineties within sixty days.

**7.4 Declined service captured in writing.** Declined work is logged in the RO, by line item, with dollar value and reason.

**7.5 Declined service recovery sequences running.** Automated 30, 60, 90, and 120 day follow-ups. Industry data suggests properly run sequences recover north of twenty percent of declined revenue.

**7.6 Recall and service campaign outreach automated.** OEM recall data flows into automated SMS and email with clear booking links.

**7.7 Status updates to the customer.** Customers receive proactive status updates by text while the vehicle is in the shop.

**7.8 Service-to-sales conversion workflow.** Equity-positive service customers are flagged for a structured S2S conversation with consent.

**7.9 Parts inventory accuracy.** Parts on-hand counts in the DMS match physical reality.

---

## Section 8. Marketing and demand generation (14 pts)

Marketing AI is where most dealers buy first and govern last. The inverse of what should happen.

**8.1 Conversion tracking is correct end-to-end.** Google Ads, Meta, and other channels report conversions that reconcile with the CRM and DMS within tolerance. Enhanced conversions configured. Offline conversion import live where supported.

**8.2 Call tracking fully wired.** Every paid channel feeds a unique tracking number. Calls flow back into CRM with source attribution. Call outcomes flow back to ad platforms.

**8.3 Audience strategy lives off owned data.** Audiences built and refreshed from DMS and CRM for retargeting, suppression, and lookalike modeling.

**8.4 Creative production has guardrails.** Generative creative follows brand standards, OEM compliance rules, and human review before publish. Policy on AI-generated vehicle imagery exists.

**8.5 Email and SMS lists are clean.** Bounce rates, opt-out rates, and complaint rates are inside healthy ranges. Suppression lists honored.

**8.6 Landing pages match ad promises.** Every paid campaign points to a landing page that delivers what the ad promised.

**8.7 Performance reviewed weekly with a written decision rule.** Weekly review with a written rule for when a campaign expands, gets fixed, or gets killed.

---

## Section 9. Inventory and merchandising (12 pts)

The VDP is where the buying decision is made.

**9.1 Acquisition-to-online lag is under twenty-four hours.** From back lot to live online with photos, description, and price is under one business day for front-line vehicles.

**9.2 Photo standards are consistent.** Same photo set per unit: exterior angles, interior, dashboard, odometer, key features, damage where applicable. AI background normalization is acceptable. Faking trim details is not.

**9.3 VDP descriptions are unique and conversational.** Every VDP description reads like a human salesperson explaining the vehicle to a specific buyer. AI drafts; humans edit for accuracy.

**9.4 Pricing strategy is documented and consistent.** Pricing methodology, market positioning, and discount strategy are documented. AI tools follow the methodology.

**9.5 Aging policy is enforced.** Written aging policy, owned by a named person. Units past the threshold trigger a defined action.

**9.6 Trade reconditioning workflow.** Recon has defined time, cost, and approval standards.

---

## Section 10. Accounting and back office (10 pts)

The least glamorous section and the one with the highest ROI per dollar of effort.

**10.1 AP invoice intake is digital.** Invoices arrive at one address, captured with OCR, matched against POs, routed for approval. AI exception handling is in place.

**10.2 Fraud detection on AP.** Duplicate-payment detection, unusual-pattern detection, and vendor-master-change alerts are active.

**10.3 Reconciliations are timely.** Bank, schedule, and balance sheet reconciliations are current at close.

**10.4 Floor plan and OEM rebate tracking automated.** Curtailments and OEM money tracked real-time, not at month-end.

**10.5 Audit trail intact.** Every system change, every approval, every override is logged with user and timestamp.

---

## Section 11. HR, workforce, and culture (10 pts)

AI changes the job. The store has to change the management around it.

**11.1 Job descriptions reflect the AI-augmented reality.** Roles working alongside AI have job descriptions that say so.

**11.2 Compensation plans aligned with AI workflows.** Pay plans do not penalize AI-set appointments or AI-assisted outcomes.

**11.3 Training cadence is real.** Onboarding, role-specific training, refreshers. Not just a vendor demo on launch day.

**11.4 Internal communication is open about AI.** Leadership has explained to the team what AI is doing, what it is not doing, and how it changes the work.

**11.5 Hiring profile updated.** New hires are screened for comfort with AI-assisted workflows.

---

# Part 3. Organizational readiness

## Section 12. Governance and vendor management (14 pts)

Every AI vendor either makes the store safer or more exposed. No neutral option.

**12.1 AI vendor inventory.** Written list with owner, data accessed, cost, and renewal date.

**12.2 Data processing agreements signed.** Current DPAs. Subprocessors disclosed. AI training rights addressed in writing.

**12.3 Permissions follow least-privilege.** Each AI tool has only the access it needs.

**12.4 Cancellation terms are known.** The store knows what happens to its data on cancellation and how long return takes.

**12.5 Reporting and proof of use.** Each AI tool produces independently verifiable evidence of what it did.

**12.6 Brand-voice and compliance review.** Customer-facing AI output is reviewed on a defined cadence.

**12.7 Kill switch.** Documented, tested process to disable any AI tool within one business day.

---

## Section 13. Workflow design and process architecture (12 pts)

AI without a workflow is a toy. AI inside a workflow is an asset.

**13.1 First use case attached to a real operational problem.** Not a novelty demo.

**13.2 Named workflow owner.** A specific human owns the workflow, with title.

**13.3 SOP short enough to train.** Fits on one page. New hire can run it in week one.

**13.4 Human takeover point defined.** Team knows exactly when the human takes over. Customer does not see the seam.

**13.5 Exception path defined.** The exception path is faster than the default. Otherwise the team routes around it.

**13.6 Decision log.** Workflow changes are logged with date, change, owner, and reason.

---

## Section 14. Staff training and change management (10 pts)

The store that trains wins. The store that buys does not.

**14.1 Managers can coach the workflow.** Not just escalate to the vendor.

**14.2 Employees know what AI cannot do.** Limits, not just capabilities.

**14.3 Customer-facing talk tracks exist.** Salespeople, advisors, and BDC reps have language for AI hand-offs.

**14.4 Privacy and accuracy expectations taught.** What data the AI sees, what it should never see, how to handle an uncomfortable customer.

**14.5 Refresher cadence on the calendar.** Quarterly minimum.

---

## Section 15. KPI architecture and measurement (10 pts)

Most AI projects fail in the measurement, not the technology.

**15.1 Baseline measured before launch.** Every metric the AI should move has a measured baseline.

**15.2 Three to five KPIs per workflow.** Few and weighty. Not twenty.

**15.3 Weekly review during pilot.** Numbers reviewed weekly, not at the end.

**15.4 Written decision rule.** Success, failure, and trigger thresholds for expand/fix/kill written before launch.

**15.5 Attribution is clean.** The AI's contribution can be isolated from background changes.

---

## Section 16. AI risk management and incident response (12 pts)

The store that has not thought about what could go wrong is the store that finds out in public.

**16.1 Risk register.** Written, prioritized list of top AI risks.

**16.2 Prompt-injection awareness.** The team knows public AI tools can be manipulated by adversarial customers. The Chevrolet of Watsonville $1 Tahoe incident from November 2023 is in the training material.

**16.3 Output review on high-stakes interactions.** Any AI producing a binding-looking statement has a human review before delivery.

**16.4 Customer-facing AI is sandboxed.** Cannot quote final price, finalize a deal, or commit the store legally. Limits enforced at system level.

**16.5 Incident playbook.** Written: who calls the customer, who notifies the GM, who pauses the tool, who documents.

**16.6 Post-incident review.** After any incident, a short review updates the workflow or controls.

---

# Part 4. Strategy

## Section 17. AI roadmap and sequencing (10 pts)

The store with a roadmap moves three times as fast as the store buying tools one at a time.

**17.1 Sequenced roadmap exists.** Written, dated roadmap of the next 3 to 5 AI deployments with owners and expected outcomes.

**17.2 Foundation precedes deployment.** Foundation gaps in Sections 1 through 4 are scheduled before the next deployment, not after.

**17.3 Budget allocated.** AI has a budget line.

**17.4 Executive sponsor named.** Dealer principal or GM owns the AI program. Not the marketing manager.

**17.5 Quarterly review.** Roadmap reviewed and updated quarterly.

---

# Section maximums (for reference)

| Section | Title | Items | Max |
| --- | --- | --- | --- |
| 1 | Data foundation | 6 | 12 |
| 2 | Website technical foundation | 7 | 14 |
| 3 | AI visibility and answer engine readiness | 8 | 16 |
| 4 | Security, privacy, and compliance | 10 | 20 |
| 5 | BDC and customer contact center | 8 | 16 |
| 6 | Variable operations: sales and F&I | 9 | 18 |
| 7 | Fixed operations: service and parts | 9 | 18 |
| 8 | Marketing and demand generation | 7 | 14 |
| 9 | Inventory and merchandising | 6 | 12 |
| 10 | Accounting and back office | 5 | 10 |
| 11 | HR, workforce, and culture | 5 | 10 |
| 12 | Governance and vendor management | 7 | 14 |
| 13 | Workflow design and process architecture | 6 | 12 |
| 14 | Staff training and change management | 5 | 10 |
| 15 | KPI architecture and measurement | 5 | 10 |
| 16 | AI risk management and incident response | 6 | 12 |
| 17 | AI roadmap and sequencing | 5 | 10 |
| **Total** | | **75** | **150** |

---

# Readiness bands

**120 to 150. AI-ready.** Foundation is real, operation is disciplined. Move on offense.

**90 to 119. Pilot-ready.** Pick one workflow with a clear owner and a clean baseline. Run a 60 to 90 day pilot. Pre-write the decision rule.

**60 to 89. Foundation first.** Spend 60 days fixing data, governance, and the website foundation. Then revisit.

**Below 60. Rebuild the base.** Stop buying tools. Triage Sections 1, 2, and 4 first. Re-score in 90 days.

See REMEDIATION.md for the band-specific 30/60/90 day playbooks.
