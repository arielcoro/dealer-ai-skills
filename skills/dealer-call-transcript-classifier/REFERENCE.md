# Dealer Call Transcript Classifier — Reference Framework

The 5-class taxonomy, decision rules, edge cases, and key-field extraction spec. SKILL.md references this file. Read it before classifying any transcript.

---

## The five classes

### Sales

**Definition (strict):** A call counts as Sales only when the caller is actively trying to BUY or LEASE a vehicle they do not currently own.

**What counts as Sales:**
- Inquiry about specific vehicle availability with active intent to purchase or lease ("Do you have a 2026 Sierra Denali AT4X in stock? I'm ready to come down today.")
- Active price negotiation ("I'm looking at this Yukon online. What's the out-the-door price?")
- Credit application initiation ("Can I apply for financing on a vehicle?")
- Test drive scheduling with intent to buy ("I'd like to come test drive the Tahoe I saw on your site.")
- Trade evaluation requested in the context of buying or leasing ("What's my Tahoe worth as a trade for a new Sierra?")
- Lease negotiation for a new vehicle ("What are your current lease specials on the Buick Enclave?")
- Order placement for a not-in-stock vehicle ("I want to order a Sierra Denali Ultimate. Can you do a factory order?")

**What does NOT count as Sales:**
- Service appointment (Service)
- Recall coordination (Service)
- Warranty question (Service)
- Status check on a vehicle in service (Service)
- Parts inquiry or order (Parts)
- Payoff inquiry on current vehicle (Finance)
- Lease return logistics (Finance, or Service if scheduling drop-off)
- GAP claim, refund, or refinance (Finance)
- Tech support on existing vehicle infotainment, app, key fob (Other)
- Employment inquiry (Other)
- Wrong-number call (Other)
- Hang-up before purpose stated (Other)
- General information request without buy/lease intent (Other) — e.g., "What are your hours?" with no follow-on intent

**Bias toward Not-Sales when ambiguous.** When the call could reasonably be classified two ways, choose the non-Sales class. The integrity of the Sales count is the entire point.

---

### Service

**Definition:** A call about the service, repair, maintenance, recall, warranty, or status of an existing vehicle (whether the caller is a customer or not).

**What counts as Service:**
- Service appointment scheduling ("I need an oil change for my 2022 Sierra.")
- Diagnostic inquiry ("My check engine light is on.")
- Repair status check ("Is my truck ready yet?")
- Loaner or shuttle request as part of service
- Recall scheduling ("I got a recall notice for my Yukon.")
- Warranty question ("Is this still under warranty?")
- Multi-point inspection follow-up
- Service estimate or pre-authorization
- Tire rotation, alignment, brake service, transmission service inquiry
- Body shop or collision repair coordination (if the dealer has a body shop)

**Not Service:**
- F&I admin (Finance) — payoffs, GAP, refunds, lease returns
- Parts orders independent of a service appointment (Parts)
- Sales pivot from a service call where intent shifts decisively (Sales, with caveats — see Edge cases)

---

### Parts

**Definition:** A call about parts inquiry, ordering, availability, or pricing — independent of a service appointment.

**What counts as Parts:**
- "Do you have a tail light for a 2018 Sierra?"
- "Can I order an OEM key fob?"
- "What's the part number for the air filter on a Buick Enclave?"
- "How long until that part comes in?"

**Not Parts:**
- Parts mentioned during a service scheduling call (Service)
- Parts mentioned during a sales call about accessories on a new vehicle (Sales)

---

### Finance

**Definition:** A call about F&I administration on an existing or recently completed transaction, not active buy/lease intent.

**What counts as Finance:**
- Payoff inquiry ("How much do I still owe on this lease?")
- GAP claim ("My car was totaled. I need to file a GAP claim.")
- Refund or rebate question ("When does my Lojack refund process?")
- Refinance inquiry on existing loan
- Lease return logistics ("What do I need to bring when I return my lease?")
- Title and registration questions
- Insurance verification follow-up
- Extended warranty claim
- Down payment refund

**Not Finance:**
- Initial credit application as part of a vehicle purchase (Sales)
- Financing question on a vehicle the caller is actively trying to buy (Sales)
- Routine billing or payment questions on an existing loan (this is the lender's job; if the dealer is fielding it, classify as Finance)

---

### Other

**Definition:** Everything that is not Sales, Service, Parts, or Finance.

**What counts as Other:**
- Tech support on infotainment, OnStar, app pairing, key fob (Other — these are OEM customer service issues, not dealer ones)
- Employment inquiry ("Are you hiring?")
- Wrong-number call
- Hang-up before purpose stated
- General information request without buy/lease intent ("What are your hours?")
- Information about an event the dealer is hosting
- Rental coordination (if the dealer manages an Enterprise/Hertz partnership)
- Survey or research call (if the dealer is the called party for someone else's survey)
- Vendor pitch (someone trying to sell the dealer something)
- Personal call to a staff member that does not relate to dealership business
- Refund of a non-vehicle item (e.g., merchandise from the boutique)

**Important:** "Other" is not a default for ambiguous cases. Ambiguous cases get flagged borderline (see below). Other is for calls whose purpose is genuinely outside the four main classes.

---

## Decision flow

When classifying a transcript, run through this flow in order. Pick the first class that matches.

```
1. Did the caller actively express intent to buy or lease a vehicle they do not currently own?
   → If YES, Sales.
   → If NO, continue.

2. Is the call about an existing vehicle's service, repair, recall, warranty, or status?
   → If YES, Service.
   → If NO, continue.

3. Is the call about a parts inquiry, order, or availability — independent of a service appointment?
   → If YES, Parts.
   → If NO, continue.

4. Is the call about F&I admin (payoff, GAP, refund, lease return, refinance) on an existing or completed transaction?
   → If YES, Finance.
   → If NO, continue.

5. Default: Other.
```

If at any step you can answer "yes" but there is meaningful ambiguity (the caller's intent was unclear, the conversation was cut off, the transcript quality is poor), flag the call `[BORDERLINE]` with the class you chose and a one-sentence reason.

---

## Edge cases and how to handle them

### A. Service caller asks about a new vehicle (S2S pivot)

A service appointment call where, mid-call, the caller asks something like "and what's the lease deal on the new Yukon Denali?" The agent gives a brief answer or sets up a separate sales follow-up.

**Classification:** Service (primary intent was service).
**Action:** Add an `[S2S OPPORTUNITY]` flag in the reasoning. Do NOT move the call into Sales unless the pivot becomes the dominant intent of the call (caller schedules a sales appointment, drops the service issue, or shifts the conversation entirely to a buy/lease discussion).

### B. Caller asks "what's my Tahoe worth?" with no follow-on

A trade evaluation question with no expressed buy/lease intent.

**Classification:** Other (information request).
**Why not Sales:** The caller may be selling privately, refinancing, or just curious. Without an active buy/lease intent, this is not a Sales call. Trade evaluation requires the buy/lease context to count.

### C. Caller asks "what's my Tahoe worth as a trade for a new Sierra?"

Trade evaluation in the context of an active buy intent.

**Classification:** Sales.
**Why:** The trade evaluation is part of the buy/lease intent. The vehicle of interest is the new Sierra.

### D. Lease return inquiry

Caller says "I have to return my Buick Encore. What do I need to bring?"

**Classification:** Finance (lease return is F&I admin).
**Action:** If the caller also asks "what are my options for my next vehicle?" or "what's the lease deal on a new Encore?", THEN add an `[S2S OPPORTUNITY]` flag, but the primary classification remains Finance unless the new-vehicle conversation becomes the dominant intent of the call.

### E. Recall outreach

Caller says "I got a recall notice for my Yukon."

**Classification:** Service.
**Why:** Recalls are service work. Even if the dealer initiated the outreach call to the customer.

### F. Hang-up call

Transcript shows the agent answered, the caller hung up before stating a purpose.

**Classification:** Other.
**Action:** Add a note that the call was a hang-up. Borderline flag if intent was beginning to emerge but unclear.

### G. Wrong-number call

Caller asks for a person or business that is not the dealership.

**Classification:** Other.

### H. Vendor pitch

Caller is trying to sell the dealership something (advertising, supplies, services).

**Classification:** Other.

### I. Test drive scheduling

Caller wants to schedule a test drive of a vehicle on the lot.

**Classification:** Sales.
**Why:** A test drive request is active buy/lease consideration. Vehicle of interest is the vehicle being test-driven.

### J. Internet lead follow-up call

Outbound call from BDC following up on a web lead. Caller (the prospect) responds with continued interest.

**Classification:** Sales.
**Action:** Lead source is the original web channel if mentioned.

### K. Internet lead follow-up where prospect has no interest

Outbound call where the prospect says "I already bought a vehicle elsewhere" or "I'm not interested."

**Classification:** Sales.
**Why:** The intent on the call was Sales-related (the dealer was attempting to sell). The outcome was negative, but the classification reflects the call's purpose, not its outcome.

### L. Sales call from someone who already bought elsewhere

Caller says "I bought a Tahoe from another dealer last week. Just wanted to compare prices." No active buy/lease intent for a current purchase.

**Classification:** Other (general information request, no buy intent).
**Why:** The buy/lease has already happened with another dealer. There is no active intent for a new purchase at this dealer.

### M. Caller asks about a vehicle on behalf of a family member

"My dad is looking for a new truck. What do you have?"

**Classification:** Sales.
**Why:** Active buy intent exists, even if the buyer is a relative. Vehicle of interest is the truck described. Contact captured is for the caller, not the family member.

---

## Key-field extraction (Sales-classified calls only)

For each call classified as Sales, extract these three fields. Use the format below.

### Vehicle of interest

- Capture the year, brand, model, and trim if mentioned. Example: "2026 GMC Sierra Denali AT4X".
- If only the brand and model are mentioned without year or trim: "GMC Sierra (year and trim unspecified)".
- If only the brand is mentioned: "GMC (model unspecified)".
- If the caller is shopping broadly without naming a specific vehicle: "unspecified (caller shopping broadly)".
- If the caller mentions multiple vehicles: list the primary one with "and considering [secondary]".

### Lead source

- Capture if the caller mentions where they saw the dealer or how they got the number. Example: "Google search", "Facebook ad", "drove by", "friend referred", "Cars.com listing", "OEM website locator".
- If not mentioned: "unknown".
- Do not infer the source from the agent's question. The caller must state it.

### Contact captured

- Did the agent successfully get the caller's name AND a callback number by the end of the call? (Email alone does not count for this binary; the standard is name + phone.)
- Yes / No / Unclear.
- "Yes" requires both name and phone explicitly captured in the transcript.
- "No" if either is clearly missing.
- "Unclear" if the transcript ends abruptly or the contact exchange is ambiguous.

---

## Reasoning quality bar

Every classification must come with a one-sentence reason. The reason should reference the specific transcript content, not just restate the class definition.

Good reasoning:
> Caller said "I want to come test drive the Sierra Denali I saw online today" with active buy intent. Sales.

Bad reasoning:
> Caller is interested in buying. Sales.

If the reasoning cannot be tied to specific transcript content, the classification is probably wrong or the call is borderline.

---

## Borderline flag — when to use it

Flag a call `[BORDERLINE]` when:

- The transcript is truncated or has speech-to-text artifacts that obscure intent.
- The caller's intent shifts mid-call and the dominant intent is unclear.
- The conversation ends before purpose is fully expressed.
- The classification could reasonably be two different classes and the rules above do not clearly resolve it.

Borderline calls are still given a classification (the most likely one), but they are flagged for human review. Do not let borderline cases inflate the Sales count. The headline number reports definite classifications; borderline cases are reported separately.

See RUBRIC.md for example transcripts per class with full reasoning.
