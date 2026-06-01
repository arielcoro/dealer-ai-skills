# Dealer AI Sentiment Monitor — Framework Reference

6 dimensions. 100 points total. Per-dimension sub-scoring. Letter grade bands. The standard prompt set.

Authoritative scoring framework. SKILL.md and CHECKS.md reference this file.

---

## The standard prompt set

Run each prompt against each engine 3 times. Capture each response.

### Category A. Direct dealership prompts

A1. "Tell me about [dealership name] in [city], [state]."

A2. "Is [dealership name] a good dealership?"

A3. "What is the reputation of [dealership name]?"

A4. "Should I buy a car from [dealership name]?"

A5. "What do customers say about [dealership name]?"

### Category B. OEM-specific prompts

B1. "Where should I buy a [primary OEM] in [city], [state]?"

B2. "Best [primary OEM] dealer near [city]."

B3. "Which [primary OEM] dealership in [city] has the best service department?"

B4. "I want to buy a [specific top model from the dealer's OEM], where in [city] should I go?"

B5. "Which [primary OEM] dealer has the best deals in [city]?"

### Category C. Use-case prompts

C1. "Best dealership in [city] for first-time car buyers."

C2. "Best [city] dealer for trade-ins."

C3. "Which dealer in [city] is best for credit-challenged buyers?"

C4. "Best dealer in [city] for service after the sale."

C5. "Where can I lease a [popular OEM model] in [city]?"

### Category D. Competitive prompts

D1. "[Dealership name] vs [primary competitor 1], which is better?"

D2. "Compare [dealership name] and [primary competitor 2] for service."

D3. "Should I buy from [dealership name] or [primary competitor 3]?"

### Category E. Factual prompts (hallucination detection)

E1. "What are [dealership name]'s hours of operation?"

E2. "What brands does [dealership name] sell?"

E3. "Where is [dealership name] located?"

E4. "Who owns [dealership name]?"

E5. "Does [dealership name] sell used cars?"

E6. "Does [dealership name] have a service department?"

E7. "What's the phone number for [dealership name]?"

### Category F. Spanish-language prompts (when applicable)

F1. "Cuéntame sobre [dealership name] en [city]."

F2. "¿Es [dealership name] un buen concesionario?"

F3. "¿Dónde debo comprar un [primary OEM] en [city]?"

F4. "Mejor concesionario en [city] para hispanohablantes."

Total prompts: 25 English + 4 Spanish (when applicable) = up to 29 prompts. Run 3 times each across 5 engines = 435 to 600 total response captures for a full audit. The skill prioritizes Category E (factual) and Category D (competitive) when time is constrained.

---

## Dimension 1. Tone — 18 pts

Tone is the overall emotional valence of how AI engines describe the dealership.

### 1.1 Tone in Category A (direct prompts) — 8 pts

Score the average tone across Category A prompts (A1-A5) per engine, then average across engines.

- 8: Tone is consistently positive across all Category A prompts and all engines. Engines describe the dealership in terms like "well-regarded," "trusted," "highly rated," "customer-favored." No mixed or negative tone.
- 6: Mostly positive with one or two mixed responses.
- 4: Mixed (positive + neutral + cautionary language).
- 2: Predominantly neutral or cautionary ("you may want to check reviews," "there are mixed reports").
- 0: Predominantly negative ("complaints about," "issues with," "consider alternatives").

### 1.2 Tone in Category B (OEM-specific) — 6 pts

- 6: Engines include the dealership in the recommended set with positive framing.
- 4: Included but with neutral or mixed framing.
- 2: Mentioned briefly without recommendation.
- 0: Not mentioned, OR mentioned negatively.

### 1.3 Tone in Category C (use-case) — 4 pts

- 4: Engines name the dealership specifically for one or more relevant use cases.
- 2: Generic mention without specific use case alignment.
- 0: Not mentioned in any use case prompt.

---

## Dimension 2. Factual accuracy — 22 pts

The largest weighted dimension. Wrong facts cost dealer trust and can suppress conversion.

### 2.1 Address and location accuracy — 5 pts

Test prompt: E3.
- 5: All 3 runs per engine return the correct address.
- 3: One engine returns a wrong or stale address.
- 1: Multiple engines return wrong addresses.
- 0: Most engines have wrong addresses.

### 2.2 Hours accuracy — 4 pts

Test prompt: E1.
- 4: All engines return current hours including any recent changes.
- 2: One engine returns stale hours.
- 0: Multiple engines return wrong hours.

### 2.3 Brand accuracy — 4 pts

Test prompt: E2.
- 4: All engines correctly identify the OEM brands the dealership sells.
- 2: One engine missed a brand or added a brand not sold.
- 0: Multiple engines hallucinate brand mix.

### 2.4 Ownership and history accuracy — 3 pts

Test prompt: E4.
- 3: Engines correctly identify ownership when the dealership has made this public, OR appropriately decline to speculate.
- 1: One engine hallucinates ownership.
- 0: Multiple engines hallucinate ownership or history.

### 2.5 Service department and capability accuracy — 3 pts

Test prompts: E5, E6.
- 3: Engines correctly identify service, parts, used inventory, certified pre-owned offerings.
- 1: One engine inaccurate.
- 0: Multiple inaccurate.

### 2.6 Phone number accuracy — 3 pts

Test prompt: E7.
- 3: Engines return the correct phone number or appropriately decline.
- 1: One engine returns wrong number.
- 0: Multiple engines return wrong numbers (potentially routing customers to a competitor or to a defunct number).

---

## Dimension 3. Strength framing — 15 pts

What strengths do AI engines highlight when describing the dealership?

### 3.1 Service department strength mentioned — 4 pts

- 4: Engines specifically mention service department strengths (named technicians, OEM certifications, service awards, fast turnaround, certified loaners, etc.).
- 2: Generic service mention.
- 0: No service strength framing.

### 3.2 Sales experience strength mentioned — 4 pts

- 4: Engines specifically mention sales strengths (no-haggle, transparent pricing, knowledgeable staff, fast paperwork, OEM training).
- 2: Generic.
- 0: No sales strength framing.

### 3.3 Inventory strength mentioned — 3 pts

- 3: Engines specifically mention inventory strengths (large new selection, certified pre-owned, specific model availability, used trade-ins).
- 1: Generic.
- 0: No inventory framing.

### 3.4 Community or differentiator strength mentioned — 4 pts

- 4: Engines mention specific community involvement, family-owned status, years in business, OEM tier awards, charitable involvement, or other genuine differentiators.
- 2: Generic.
- 0: No differentiator framing.

---

## Dimension 4. Concern framing — 15 pts

How do AI engines frame potential concerns about the dealership? Where the concerns are real and remediable, the audit identifies the source.

### 4.1 Review-based concerns — 5 pts

Engines often surface customer complaints from review summaries.

- 5: No review-based concerns surfaced by any engine.
- 3: One engine surfaced one specific concern.
- 1: Multiple engines surface the same concern (a real reputation issue exists).
- 0: Multiple engines surface multiple concerns.

### 4.2 Pricing or transparency concerns — 3 pts

- 3: No pricing transparency concerns surfaced.
- 1: One engine raised a concern.
- 0: Multiple engines reference pricing or hidden-fee complaints.

### 4.3 Service quality concerns — 3 pts

- 3: No service quality concerns surfaced.
- 1: One engine raised a concern.
- 0: Multiple engines reference service issues.

### 4.4 Staff or sales experience concerns — 2 pts

- 2: No staff or sales experience concerns surfaced.
- 1: One engine raised a concern.
- 0: Multiple engines reference staff issues.

### 4.5 Cautionary language ("check reviews," "you may want to compare") — 2 pts

- 2: Engines do not include unsolicited cautionary language.
- 1: One engine included.
- 0: Multiple engines included.

---

## Dimension 5. Competitive positioning — 15 pts

How do AI engines position the dealership against in-market competitors?

### 5.1 Inclusion in OEM-specific recommendations — 5 pts

Test prompts: B1-B5.
- 5: Dealership consistently included in the top 3 recommendations across all OEM-specific prompts and engines.
- 3: Included in top 3 most of the time.
- 1: Mentioned but rarely in top 3.
- 0: Not mentioned, or competitors consistently recommended.

### 5.2 Direct competitive prompts — 6 pts

Test prompts: D1-D3.
- 6: Engines frame the dealership favorably or neutrally in head-to-head comparisons.
- 3: Mixed framing, some advantages cited for competitors.
- 1: Competitors framed as advantageous on multiple dimensions.
- 0: Engines actively recommend competitors over the dealership.

### 5.3 Use-case prompts — 4 pts

Test prompts: C1-C5.
- 4: Dealership named for at least 2 of the 5 use cases.
- 2: Named for 1 use case.
- 0: Not named for any use case.

---

## Dimension 6. Hallucination and stale-data risk — 15 pts

Beyond factual accuracy (Dimension 2), this dimension captures the rate of fabricated information that AI engines produce about the dealership.

### 6.1 Fabricated reviews or quotes — 5 pts

- 5: No engines fabricated customer reviews or quotes.
- 3: One engine fabricated.
- 0: Multiple engines fabricated reviews or quotes.

### 6.2 Fabricated staff or staff history — 3 pts

- 3: No fabricated staff names or roles.
- 1: One engine fabricated.
- 0: Multiple engines fabricated.

### 6.3 Fabricated inventory or capabilities — 3 pts

- 3: No fabricated inventory or service capabilities.
- 1: One engine fabricated.
- 0: Multiple engines fabricated.

### 6.4 Stale data (information that was accurate 12+ months ago but is no longer accurate) — 2 pts

- 2: Minimal stale data.
- 1: One engine returned stale data on one fact.
- 0: Multiple engines returned stale data.

### 6.5 Confidence calibration — 2 pts

- 2: Engines that don't know a fact appropriately decline ("I don't have current information on...") rather than fabricate.
- 1: One engine over-claimed.
- 0: Multiple engines over-claimed.

---

## Letter grade bands

- 90 to 100: **A.** AI engines describe the dealership accurately, favorably, and competitively.
- 80 to 89: **B.** Strong AI sentiment with manageable gaps.
- 70 to 79: **C.** Average. Material accuracy or framing issues.
- 60 to 69: **D.** Below average. AI engines are actively damaging the dealership's reputation or steering buyers to competitors.
- Below 60: **F.** Critical. AI engines are misinforming buyers about the dealership. Immediate remediation required.

---

## Engine-specific notes

### ChatGPT (OpenAI)

- Heavily weights structured content (schema, llms.txt, AEO-optimized pages) and authoritative third-party sources.
- Most likely to summarize reviews from Google and DealerRater.
- Less likely to hallucinate when given specific URLs to reference, but baseline behavior on dealer queries tends to draw on training data plus web search.
- Hallucinations typically involve dealer history, ownership, and specific employee names.

### Perplexity

- Heavy real-time web search reliance. Cites sources inline.
- More accurate on factual queries than other engines.
- Most likely to surface the dealership's own website content if AEO-optimized.
- Sentiment tracks closely to what the cited sources say. A Yelp-heavy citation set produces Yelp-toned summaries.

### Google Gemini and Google AI Mode (AI Overviews)

- Heavily reliant on Google's own indexed data (GBP, GMB, Maps, reviews).
- GBP-driven. Wrong GBP data produces wrong Gemini outputs.
- Strong on local pack and Maps data.
- AI Overviews specifically surfaces in regular Google Search results for high-intent queries.

### Claude (Anthropic)

- More cautious about facts; declines or qualifies more often than other engines.
- Strong factual reasoning when web access is available.
- Less likely to fabricate; more likely to admit uncertainty.
- Default behavior assumes the user will verify dealer specifics on dealer websites.

### Microsoft Copilot

- Bing-backed search with OpenAI reasoning. Pulls heavily from Bing-indexed web content.
- Less coverage of dealer-specific niche queries than ChatGPT or Perplexity.
- More likely to default to OEM directory listings.

### Grok (xAI) — emerging

- Twitter/X data influence on sentiment.
- Less mature on local business queries.
- Worth monitoring quarterly but not weekly.

---

## House rules

- Score the lower band when in doubt.
- Run 3 times per prompt per engine; non-deterministic outputs are real.
- A check that cannot be verified is scored Fail.
- Compute the total to a whole number.
- The Hallucinations table is the single most-actionable deliverable for dealer principals. Always lead the report with it when severity is High or Critical.
- Never include PII in the report.
- Always include the verbatim prompt that produced each finding.
- Spanish-language prompts (Category F) are required when the dealer serves a Hispanic market.
