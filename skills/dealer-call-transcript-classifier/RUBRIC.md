# Dealer Call Transcript Classifier — Examples Rubric

Example transcripts per class with the classification, reasoning, and (where applicable) extracted Sales fields. Use these to anchor judgment on borderline calls.

---

## Sales — examples

### Example S1. Direct buy intent on a specific vehicle

> **Agent:** Example GMC Dealer, this is Lisa.
> **Caller:** Hi, I'm calling about the 2026 Sierra Denali Ultimate you have listed online — the white one with the 6.2.
> **Agent:** Yes, we have that in stock. Are you looking to come see it?
> **Caller:** Yeah, I'd like to come down today if you have someone available. I'm pre-approved through Navy Federal and I just need to drive it to make sure.
> **Agent:** Great. Can I get your name and a good number to reach you?
> **Caller:** Sure, it's Mike Davis, 555-0143.
> **Agent:** Perfect Mike, I'll have someone ready for you at 3 PM.

**Classification:** Sales.
**Reasoning:** Caller has active intent to buy a specific in-stock vehicle, is pre-approved, scheduling a same-day visit.
**Vehicle of interest:** 2026 GMC Sierra Denali Ultimate (white, 6.2L)
**Lead source:** Dealer website (caller saw it "listed online")
**Contact captured:** Yes

### Example S2. Trade evaluation in buy context

> **Caller:** What would my 2018 Tahoe be worth as a trade if I'm looking at a new Yukon Denali?
> **Agent:** It depends on mileage and condition. Could you bring it by?
> **Caller:** I can swing by tomorrow morning. I'm pretty serious about the Yukon — my wife and I have been talking about it for months.

**Classification:** Sales.
**Reasoning:** Trade evaluation is tied to active buy intent for a new Yukon.
**Vehicle of interest:** New GMC Yukon Denali (year unspecified)
**Lead source:** Unknown
**Contact captured:** Unclear (caller did not explicitly give name and phone in the captured portion)

### Example S3. Outbound BDC follow-up that engages

> **Agent:** Hi this is Tom from Example GMC Dealer, following up on your inquiry about the Sierra. Is now a good time?
> **Caller:** Yeah, I was hoping you'd call. I'm still interested but I want to know what kind of financing you can offer.
> **Agent:** Absolutely. What's your timeline looking like?
> **Caller:** I'd like to be in something by the end of the month.

**Classification:** Sales.
**Reasoning:** Outbound BDC call connecting with a prospect who confirms continued buy intent and timeline.
**Vehicle of interest:** GMC Sierra (year and trim unspecified)
**Lead source:** Internet lead (referenced as a prior inquiry)
**Contact captured:** Yes (BDC initiated the call so contact was already on file)

### Example S4. Outbound BDC follow-up that does not engage

> **Agent:** Hi this is Tom from Example GMC Dealer, following up on your inquiry about the Sierra.
> **Caller:** Yeah, I actually bought a truck from another dealer last weekend.

**Classification:** Sales.
**Reasoning:** Outbound call with Sales intent (BDC attempting to sell). Outcome is lost deal but the call's purpose was Sales.
**Vehicle of interest:** GMC Sierra (year and trim unspecified) — note "lost to competitor"
**Lead source:** Internet lead
**Contact captured:** Yes (BDC outbound)

---

## Service — examples

### Example SV1. Standard service appointment

> **Caller:** Hi, I need to schedule an oil change for my 2022 Sierra. It's due.
> **Agent:** Sure, what day works best?
> **Caller:** Saturday morning if you have anything.

**Classification:** Service.
**Reasoning:** Standard maintenance scheduling on existing customer vehicle.

### Example SV2. Recall outreach

> **Agent:** This is Example GMC Dealer service. I'm calling because your 2023 Yukon is part of a recall affecting the airbag control module. Free repair, takes about 90 minutes.
> **Caller:** Oh, okay. When can I bring it in?

**Classification:** Service.
**Reasoning:** Recall coordination call. Existing vehicle, free OEM service.

### Example SV3. Status check on vehicle in service

> **Caller:** I dropped off my Buick Encore yesterday morning. Is it ready yet?
> **Agent:** Let me check. Yes, it just finished, the advisor will call you in about an hour.

**Classification:** Service.
**Reasoning:** Status check on vehicle currently in the shop.

### Example SV4. Service caller with brief S2S pivot (still Service)

> **Caller:** I need to schedule my 30,000 mile service on my Sierra.
> **Agent:** Sure, what day works?
> **Caller:** Thursday if possible. Oh, and just curious — what's the lease deal on the new Yukon look like right now?
> **Agent:** I can have a sales rep follow up with you on that. For service, Thursday 9 AM work?
> **Caller:** Yeah, that works.

**Classification:** Service. `[S2S OPPORTUNITY]`
**Reasoning:** Primary intent was service scheduling. Brief pivot to a Yukon question was informational, not a buy/lease commitment. S2S flag added for sales team follow-up.

---

## Parts — examples

### Example P1. Parts inquiry and order

> **Caller:** Do you have a passenger-side mirror for a 2020 GMC Sierra 1500?
> **Agent:** Let me check. We can order it. It would be here Tuesday. Want me to put it on order?
> **Caller:** Yeah, go ahead. Can I pick it up?
> **Agent:** Sure, I'll have it ready Tuesday afternoon.

**Classification:** Parts.
**Reasoning:** Standalone parts inquiry and order. No service appointment, no buy/lease intent.

### Example P2. Part pricing question

> **Caller:** How much is an OEM key fob for a 2021 Buick Enclave?
> **Agent:** Let me look. It's $385 plus programming.

**Classification:** Parts.
**Reasoning:** Parts pricing inquiry only.

---

## Finance — examples

### Example F1. Payoff inquiry

> **Caller:** Hi, I'm calling about my lease. I want to know what the payoff is — I'm thinking of buying it out.
> **Agent:** Let me get your information. What's the VIN?

**Classification:** Finance.
**Reasoning:** Payoff inquiry on existing lease. F&I admin.

### Example F2. Lease return logistics

> **Caller:** My lease is up on the 15th. What do I need to bring when I drop it off?
> **Agent:** Bring all sets of keys, both fobs, the owner's manual, and any paperwork you have.

**Classification:** Finance.
**Reasoning:** Lease return logistics. F&I admin. No buy/lease intent for next vehicle expressed.

### Example F3. Lease return with S2S pivot (still Finance unless dominant)

> **Caller:** My lease is up on the 15th. What do I need to bring? And what are my options for what's next?
> **Agent:** For the return, bring all keys and the owner's manual. For your next vehicle, I can put you in touch with our sales team — are you thinking another Encore or something different?
> **Caller:** Honestly I haven't decided. Let me think about it and I'll call back.

**Classification:** Finance. `[S2S OPPORTUNITY]`
**Reasoning:** Primary intent was lease return logistics. S2S pivot was acknowledged but caller did not commit. Flag for sales follow-up but classify as Finance.

### Example F4. GAP claim

> **Caller:** My car was totaled in an accident. I need to file a GAP claim.
> **Agent:** I'm sorry to hear that. Let me transfer you to our F&I manager.

**Classification:** Finance.
**Reasoning:** GAP claim is F&I admin.

---

## Other — examples

### Example O1. Tech support on infotainment

> **Caller:** My MyGMC app won't connect to my truck. Can you help?
> **Agent:** That's actually OnStar support. Let me give you the number.

**Classification:** Other.
**Reasoning:** Tech support issue. OEM responsibility, not dealer sales/service.

### Example O2. Employment inquiry

> **Caller:** Are you guys hiring service advisors?
> **Agent:** Let me transfer you to HR.

**Classification:** Other.

### Example O3. Wrong number

> **Caller:** Is this the body shop on Main Street?
> **Agent:** No, this is Example GMC Dealer. You probably want Mike's Body Shop down the street.
> **Caller:** Oh, sorry.

**Classification:** Other.
**Reasoning:** Wrong-number call.

### Example O4. Hang-up

> **Agent:** Example GMC Dealer, this is Lisa.
> [Caller hangs up.]

**Classification:** Other.
**Reasoning:** Hang-up before purpose stated.

### Example O5. General info request, no buy intent

> **Caller:** What are your hours on Saturday?
> **Agent:** We're open 8 to 6 for sales, 8 to 2 for service.
> **Caller:** Okay thanks.

**Classification:** Other.
**Reasoning:** Hours inquiry only. No buy/lease intent, no service need expressed.

### Example O6. Trade evaluation without buy intent

> **Caller:** I just want to know what my 2019 Yukon is worth. Not necessarily trading it in, just curious.
> **Agent:** It depends on condition and mileage. I can have someone look at it if you bring it by.
> **Caller:** Maybe. I'll think about it.

**Classification:** Other.
**Reasoning:** Trade evaluation without expressed buy/lease intent. Caller may be selling privately or refinancing. Does not meet the Sales bar.

### Example O7. Vendor pitch

> **Caller:** Hi, I'm with [advertising vendor] and I'd love to talk to your marketing director about our new dealer program.
> **Agent:** I'll transfer you.

**Classification:** Other.
**Reasoning:** Vendor pitch, not a customer.

---

## Borderline — examples

### Example B1. Truncated transcript

> **Caller:** I was looking at the Sierra on your website — [transcript cuts off]

**Classification:** Sales `[BORDERLINE]`.
**Reasoning:** Caller began expressing interest in a specific vehicle but transcript ended before intent was clear. Likely Sales but flag for human review.

### Example B2. Mid-call intent shift

> **Caller:** Hi, I'm calling about my Sierra — it needs an oil change. Also, I was thinking, maybe it's time to upgrade. What do you have new?
> **Agent:** Let me schedule your oil change first. Thursday work?
> **Caller:** Yeah. And the upgrade thing, let me think about it.
> [Call continues with service scheduling.]

**Classification:** Service `[BORDERLINE — S2S OPPORTUNITY]`.
**Reasoning:** Caller mentioned upgrade interest mid-call but did not commit. Primary intent was service. Could reasonably be flagged as a Sales lead given the upgrade mention. Borderline; flag for sales follow-up and treat as Service for headline count.

### Example B3. Garbled transcript

> **Agent:** Example GMC Dealer.
> **Caller:** Yeah I [inaudible] Sierra [inaudible] price [inaudible]
> **Agent:** I'm sorry, you're breaking up. Can you call back?
> [Call ends.]

**Classification:** Other `[BORDERLINE]`.
**Reasoning:** Transcript quality prevents reliable classification. Likely Sales (caller mentioned Sierra and price) but cannot be confirmed. Flagged for human listen.

---

## Spanish-language example

### Example ES1. Sales call in Spanish

> **Agent:** Example GMC Dealer, habla Lisa.
> **Caller:** Hola, buenos días. Vi en su sitio web una camioneta GMC Sierra Denali nueva. ¿Está todavía disponible?
> **Agent:** Sí, todavía la tenemos. ¿Le gustaría venir a verla?
> **Caller:** Sí, ¿puedo ir hoy en la tarde? Estoy listo para comprar.

**Classification:** Sales (Ventas).
**Reasoning:** Active buy intent on a specific vehicle, scheduling same-day visit.
**Vehículo de interés:** GMC Sierra Denali (año y trim no especificados).
**Origen del lead (Lead source):** Sitio web del concesionario.
**Contacto capturado (Contact captured):** Sin claro (la información de contacto no se confirmó en la porción capturada).

---

## How to use this rubric

When classifying a transcript:

1. Read the transcript end-to-end.
2. Apply the decision flow from REFERENCE.md.
3. If the call resembles one of the examples above, use that as the anchor for the classification.
4. If the call does not cleanly match any example and the rules from REFERENCE.md do not clearly resolve it, flag it borderline.

The point of this rubric is anchoring, not exhaustive coverage. Real dealer calls have endless variations. The principles in REFERENCE.md are the rule; these examples are illustrations.
