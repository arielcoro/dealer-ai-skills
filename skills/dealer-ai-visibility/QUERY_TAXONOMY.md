# Dealer AI Visibility — Query Taxonomy

The 25 to 30 query template for each audit run. SKILL.md references this file. This taxonomy is designed to be edited as the AI engine landscape and dealer buyer behavior evolve.

For each audit, the skill assembles a dealer-specific query bank by:
1. Including all universal queries from this file.
2. Adding brand-specific queries based on the dealer's portfolio.
3. Adding geographic variants using the dealer's primary market.
4. Adding bilingual variants when the dealer serves a Spanish audience.

Target total: 25 to 30 queries per audit run.

---

## Section 1. Universal queries (run for every dealer)

These run regardless of brand portfolio.

### Branded direct queries

1. "Tell me about [Dealership Name]"
2. "What are the hours for [Dealership Name]"
3. "Is [Dealership Name] a good dealer"
4. "Where is [Dealership Name] located"
5. "What brands does [Dealership Name] sell"

These are the brand-name accuracy queries. AI engines should return the dealer's actual hours, address, brand portfolio, and (where relevant) sentiment. Inaccuracies indicate entity reinforcement gaps.

### Near-me queries

6. "Best car dealer near [City]"
7. "Best [Brand] dealer near [City]"
8. "Most reputable car dealer in [City]"

These are the high-intent local discovery queries. If competitors are cited here and the dealer is not, the dealer is invisible to research-stage buyers in their own market.

### Service queries

9. "Where to get my [Brand] serviced in [City]"
10. "Best [Brand] service center near [City]"
11. "Trustworthy auto repair in [City]"

Service queries are high-volume (most dealer customer interactions are service, not sales) and often produce different citations than sales queries.

### Financing queries

12. "Best place to finance a car in [City]"
13. "Auto loans for bad credit in [City]"
14. "Lease vs buy a car in [City]"

Financing is a key conversion driver. Citations here often come from third-party listings (Cars.com, CarGurus) and editorial sources (NerdWallet, Bankrate); few come from dealer-owned content.

### Trust and reputation queries

15. "Most trustworthy car dealer in [City]"
16. "Worst car dealer in [City]" (or "car dealers to avoid in [City]")

These surface reputation signals across the market. Negative-framed queries are sometimes more revealing than positive-framed because they show which sources AI engines trust for criticism.

---

## Section 2. Brand-specific queries (run based on dealer portfolio)

For each brand the dealer sells new, run a subset.

### GM brands (GMC, Buick, Chevrolet, Cadillac)

For each GM brand in the portfolio:

17. "Best [GM brand] dealer near [City]"
18. "[GM brand] inventory in [City]"
19. "Cheapest [GM brand] lease in [City]"

For trucks (GMC Sierra, Chevy Silverado), add:

20. "Best truck for towing [weight] near [City]"

For SUVs (Yukon, Tahoe, Suburban, Enclave), add:

21. "Best family SUV in [City]"

For specific high-volume models the dealer carries, add:

22. "[Year] [Model] [Trim] near [City]" (e.g., "2026 GMC Sierra Denali near Birmingham")
23. "[Model] vs [Competitor Model]" (e.g., "GMC Sierra vs Ford F-150")

### Ford and Lincoln

For each brand in the portfolio:

17. "Best Ford dealer near [City]"
18. "Ford inventory in [City]"
19. "Lincoln dealer near [City]"

For trucks (F-150, Super Duty, Maverick, Ranger), add:

20. "Best truck for towing [weight] near [City]"

For specific models:

21. "[Year] Ford [Model] near [City]"
22. "F-150 vs Sierra"
23. "Ford Bronco vs Jeep Wrangler"

### Stellantis (CDJR — Chrysler, Dodge, Jeep, Ram)

For each brand:

17. "Best CDJR dealer near [City]"
18. "Jeep dealer near [City]"
19. "Ram truck dealer in [City]"

For Jeep (model-specific high-volume):

20. "Best Jeep Wrangler dealer in [City]"
21. "Trail Rated Jeep near [City]"

For Ram:

22. "Best Ram 1500 dealer for towing in [City]"

For performance (Dodge Challenger/Charger):

23. "Where to buy a Dodge Challenger near [City]"

### Toyota and Lexus

17. "Best Toyota dealer near [City]"
18. "Toyota Tundra dealer in [City]" (if applicable)
19. "Where to buy a Tacoma near [City]"
20. "Toyota hybrid dealer near [City]"
21. "RAV4 Hybrid availability in [City]"
22. "Lexus dealer near [City]" (if applicable)
23. "Toyota vs Honda reliability"

### Honda and Acura

17. "Best Honda dealer near [City]"
18. "Honda Pilot dealer near [City]"
19. "Best Honda Accord dealer in [City]"
20. "Acura dealer near [City]" (if applicable)
21. "CR-V availability in [City]"

### Hyundai and Kia (and Genesis)

17. "Best Hyundai dealer in [City]"
18. "Kia dealer near [City]"
19. "Genesis dealer near [City]" (if applicable)
20. "Best EV dealer for Ioniq 5 in [City]"
21. "EV6 dealer near [City]"

### Other brands

For dealers selling brands not covered above (Subaru, VW, Audi, BMW, Mercedes, Mazda, Nissan, Infiniti, etc.), substitute brand-specific equivalents using the same pattern.

---

## Section 3. Bilingual variants (Spanish)

When the dealer serves a Spanish-speaking audience, add Spanish versions of the highest-priority queries. The Spanish landscape is typically less competitive, so first-mover advantages are real.

### Spanish branded queries

24. "Dime sobre [Dealership Name]"
25. "¿Es [Dealership Name] un buen concesionario?"
26. "Horario de [Dealership Name]"

### Spanish near-me queries

27. "Mejor concesionario de carros cerca de [Ciudad]"
28. "Mejor concesionario de [Marca] en [Ciudad]"
29. "Concesionario en español en [Ciudad]"

### Spanish trust query

30. "Concesionario más confiable en [Ciudad]"

For dealers serving large Spanish audiences (Hispanic markets in California, Texas, Florida, New York), consider expanding bilingual queries to 5 to 8 of the total.

---

## Section 4. Custom queries (dealer-specific, optional)

The user may add 2 to 5 dealer-specific queries that matter to the business. Common examples:

- Queries about a specific high-volume model the dealer has in stock.
- Queries about a recent promotion or OEM program.
- Queries about a competitor by name (the dealer wants to know how AI compares them).
- Queries about a specific service the dealer specializes in (off-road conversions, EV charging install, fleet service).

These are added at audit setup time and tracked across quarters if the dealer wants ongoing comparison.

---

## Section 5. Query construction rules

When assembling the query bank for a specific dealer audit:

### Variable substitution

`[Dealership Name]` → The dealer's exact legal name as it appears on GBP.
`[City]` → The dealer's primary market city. Run a separate variant for each major surrounding city the dealer targets (typically 2 to 3 cities total).
`[Brand]` → Each brand in the dealer's portfolio.
`[Model]` → Top 2 to 3 highest-volume models per brand.
`[Year]` → Current model year for new vehicle queries.

### Query quantity guidance

- **Lean dealer (single rooftop, single brand):** 20 to 25 queries total.
- **Standard dealer (single rooftop, 2 to 3 brands):** 25 to 30 queries.
- **Group dealer (multi-rooftop, multi-brand):** 30 to 40 queries with rooftop-specific variants.

If the user asked for "Deep: 25-30 queries (with bilingual variants)" in scoping, the skill defaults to 28 queries with 5 bilingual variants for bilingual markets.

### Query rotation

Some queries should be the same every quarter (for trend tracking). Others can rotate to surface fresh patterns.

- **Always-include (12 queries):** All 16 universal queries from Section 1, minus the brand-specific subset.
- **Brand-rotating (8 to 12 queries):** Brand-specific queries from Section 2. Rotate trim, model, comparison combinations quarter to quarter.
- **Custom-rotating (2 to 5 queries):** Dealer-specific. Edit per quarter based on what is operationally relevant.

---

## How to update this taxonomy

This file is designed to be edited. When the AI engine landscape changes:

- **A new dominant query pattern emerges.** Add it to Section 1 or the relevant brand subsection.
- **A query stops producing useful engine responses.** Mark it as deprecated rather than deleting (preserves the trend continuity).
- **A new engine launches with different ranking signals.** Add engine-specific query variants if needed.
- **A new bilingual market becomes relevant.** Add language variants for that market.

Edits to this file affect every future audit run. The skill pulls from the current file content at run time.

When in doubt about adding a query: would a real car buyer or dealer principal type this into an AI engine to make a real decision? If yes, include it. If it is a vanity query that does not reflect real intent, leave it out.

---

## Notes on engine-specific query behavior

Some patterns to expect when running these queries:

- **ChatGPT** with browsing tends to cite editorial sources (Cars.com, Edmunds, KBB) and OEM pages, with selective third-party listing citations.
- **Perplexity** strongly favors Reddit, with heavy citation of model-specific subreddits. For dealer queries, it often pulls from Cars.com and DealerRater.
- **Gemini** tends to favor Google Business Profile data, Google Reviews, and Maps-adjacent sources. Strong on local queries.
- **Claude** with web search behaves similarly to ChatGPT but more conservative on specific recommendations. Refusal patterns are more common.
- **Google AI Mode** pulls from a mix of editorial and Google's local pack data. Strong on geographic queries.

These patterns shift with engine updates. The source bucket analysis in the report captures the current patterns, not the historical ones.

See SOURCE_TAXONOMY.md for how cited sources are classified.
