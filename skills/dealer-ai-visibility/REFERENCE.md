# Dealer AI Visibility — Reference Framework

The analysis methodology, citation source taxonomy logic, and scoring framework. SKILL.md references this file. Read it before running any audit.

---

## What this measures

Three things:

1. **Citation count.** How many times the dealership was cited by AI engines across the query bank.
2. **Citation share.** Dealership citations divided by total dealer-relevant citations in the same query bank. Compared head-to-head with competitor rooftops.
3. **Citation accuracy.** When the dealership was cited, was the information correct (hours, address, brand portfolio, key staff)?

These three metrics, tracked quarterly, tell the dealer whether their AEO investment is producing real-world AI engine visibility — and how they stack against the named competition.

---

## Why citation share matters more than absolute citation count

Most dealer AI tools (and most marketing dashboards) report absolute numbers: "you got cited 12 times this quarter." That number means almost nothing without context. Is 12 good or bad? Depends on the query bank, the competition, and the engine behavior.

Citation share answers the real question: "of the times AI engines surfaced a dealer recommendation in our market, what percentage of those mentioned us?"

A dealer with 40% share in their market is the dominant AI-visible dealer. A dealer with 5% is being beaten by competitors who are doing the AEO work. The number reframes the conversation from "are we doing something" to "are we winning."

---

## Scoring methodology

### Per-query scoring

For each query in the bank, the skill records:
- Did the engine produce a useful answer?
- Was the dealership cited?
- If cited, was the citation accurate?
- Were named competitors cited?
- Which source buckets were cited (from SOURCE_TAXONOMY.md)?

This produces a per-query record across the 5 engines (or however many are actually polled).

### Per-engine scoring

For each engine, the skill computes:
- Query coverage rate (engine produced a useful answer for X of Y queries)
- Dealer citation rate (cited in X of Y queries)
- Competitor citation rate (per competitor, cited in X of Y queries)
- Source bucket distribution (which source types this engine favors)

### Per-source-bucket scoring

For each source bucket in SOURCE_TAXONOMY.md, the skill computes:
- How often this bucket was cited across the query bank
- What percentage of dealer-relevant citations came from this bucket
- Whether the dealer has presence in this bucket (yes/no/weak)

This identifies the highest-leverage citation outreach: source buckets that AI engines cite frequently but where the dealer is not yet present.

### Aggregate scoring

Across the full query bank:
- Total citation share (dealer vs each competitor)
- Engine coverage (in how many of the engines was the dealer cited at all)
- Brand-name accuracy (when asked directly, what percent of responses are correct)
- Top citation gap queries (where dealer should have been cited but was not)
- Quarter-over-quarter trend (when prior quarter data provided)

---

## How the source bucket taxonomy works

The skill classifies every cited URL into one of seven buckets. The taxonomy is in SOURCE_TAXONOMY.md; this section explains the logic.

The buckets are designed to map to specific dealer actions. If "OEM" is the dominant bucket for a query category, the dealer's only leverage is OEM relationship work. If "third-party listings" dominate, the dealer can fix this by improving their Cars.com, CarGurus, Autotrader, and Edmunds profiles. If "reviews" dominate, the dealer needs review velocity work.

The buckets:
1. **OEM** — manufacturer sites (gmc.com, ford.com, etc.) and OEM dealer locators
2. **Third-party listings** — Cars.com, CarGurus, Autotrader, Edmunds, TrueCar, KBB
3. **Reviews** — Google Reviews, DealerRater, Cars.com reviews, Yelp, BBB
4. **Forums and communities** — Reddit, model-specific forums (GM Authority, F150 Online, Mopar communities), Cars.com forums
5. **Local press and editorial** — local newspapers, TV news, regional auto publications, trade press
6. **Dealer-owned** — the dealership's own domain, plus any owned subdomains
7. **Other** — everything else (Wikipedia, knowledge graphs, miscellaneous)

Each bucket has a default weight in the citation share calculation. Weights reflect the practical leverage available to the dealer to influence citations in that bucket. See SOURCE_TAXONOMY.md for the specific weights and rationale.

---

## How citation share is computed

The simple version:

```
citation_share = (dealer_citations / total_dealer_relevant_citations) × 100%
```

Where:
- `dealer_citations` is the number of times the named dealership was cited across the query bank.
- `total_dealer_relevant_citations` is the count of citations across the same query bank that referenced any dealer (the named one plus any competitor or unnamed dealer mentioned in the engine response).

Engine-internal references (Wikipedia, knowledge graphs that the engine pulls from regardless of the query) are excluded from the denominator because they are not "dealer-relevant" in the competitive sense.

When weighted by source bucket (advanced mode), citations are multiplied by the bucket weight before summing. A dealer-owned citation counts more than a third-party listing citation because dealer-owned citations represent owned authority, which is harder for competitors to displace.

---

## Brand-name accuracy methodology

A separate sub-analysis runs queries that ask about the dealership by name. Examples:

- "Tell me about [Dealership Name]"
- "What are the hours for [Dealership Name]"
- "What brands does [Dealership Name] sell"
- "Is [Dealership Name] a good dealer"
- "Who is the GM of [Dealership Name]"

For each, the skill checks the engine response against ground truth (provided by the user or verified via GBP/OEM locator):
- Hours correct?
- Address correct?
- Brand portfolio correct?
- Key staff mentioned correctly?
- Sentiment accurate?

Inaccuracies indicate entity reinforcement gaps. AI engines build their model of the dealership from the citation graph; inaccurate citations propagate. Fixing inaccuracies typically requires NAP cleanup, OEM locator updates, and direct GBP corrections.

---

## How to read the competitive share matrix

The skill produces a matrix like:

| Dealer | Total | Share | ChatGPT | Perplexity | Gemini | Claude | Google AI |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [Dealer] | 7 | 28% | 2 | 1 | 2 | 1 | 1 |
| [Competitor A] | 11 | 44% | 3 | 3 | 2 | 2 | 1 |
| [Competitor B] | 4 | 16% | 1 | 1 | 1 | 0 | 1 |
| Unnamed dealer | 3 | 12% | 0 | 1 | 0 | 1 | 1 |

How to read this:

- **Total citations.** Raw count across the 25 to 30 query bank.
- **Share.** Percentage of dealer-relevant citations attributed to each rooftop.
- **Per-engine columns.** Engine-specific citation count.

The patterns to look for:

- **Lopsided per-engine performance.** If a competitor dominates Perplexity but not Gemini, they are doing something specific to Perplexity citation (likely Reddit and editorial presence).
- **Unnamed dealer share.** If "unnamed dealer" share is high, engines are recommending vague responses rather than specific dealerships. The dealer can capture share by being more specifically cited.
- **Quarter-over-quarter shifts.** When prior quarter data is provided, surface the delta.

---

## The 90-day action plan structure

Every report ends with a 30/60/90 day plan. The plan is structured around the source bucket analysis:

### Quick wins (under 30 days)

Citation outreach to the buckets where the dealer has presence but weak signal:
- Update Cars.com, CarGurus, Autotrader, Edmunds profiles with full content
- Refresh GBP with hours, brand portfolio, photos, posts
- Publish llms.txt using dealer-llms-txt-generator
- Fix any NAP inconsistencies surfaced by the brand-name accuracy section

### Mid-term (30-60 days)

Content production to address citation gap queries:
- Generate content briefs using dealer-aeo-content-brief for the top 5 gap queries
- Publish 4 to 8 new or rewritten pages
- Citation outreach to local press for editorial mentions
- Review velocity campaigns to strengthen review-bucket citations

### Longer-term (60-90 days)

Structural authority work:
- OEM coverage (press release, award nomination, OEM-hosted content)
- Trade publication outreach
- Forum participation (where genuine, not spammy)
- Wikipedia article (if the dealership meets notability standards)

Each action references the specific marketplace skill that executes it.

---

## Quarterly tracking framework

The skill is designed for recurring use. Recommended cadence:

- **Quarterly:** Full audit run. Generate the report. Update the action plan. Share with the dealer principal.
- **Monthly (optional):** Track the brand-name accuracy queries only (a 5-query subset). Catches accuracy regressions early.
- **Annually:** Aggregate four quarterly runs into a trend report. Show citation share movement over the year.

When the user provides prior quarter data, the skill includes a trend comparison: "Q4 share was 22%, Q1 share is 28%, a 6-point improvement driven primarily by gains in service-related queries."

---

## What this skill does not do

- It does not directly fix citation gaps. The action plan references the skills that do (dealer-aeo-content-brief, dealer-llms-txt-generator, dealer-aeo-audit follow-up).
- It does not predict future citation patterns. AI engines change algorithms frequently.
- It does not replace human judgment on which engines to prioritize. The dealer's actual buyer behavior dictates which engines matter most.
- It does not produce ranked-list "SEO-style" outputs. Citation share is a different metric from ranking position.
- It does not generate fake responses. Every cited source is from an actual engine response.

---

## Tool dependencies and degradation

The skill operates across a spectrum of available tools:

- **Full tooling (best):** Ahrefs Brand Radar MCP + WebSearch + Chrome MCP. Skill polls engines live, extracts citations automatically, refreshes the HTML dashboard from live data.
- **Partial tooling:** WebSearch only. Skill runs queries via WebSearch, captures responses, extracts citations.
- **No tooling (Mode A):** User runs queries manually and pastes responses. Skill does the extraction and analysis. Slower but fully usable.

The skill detects what is available and adapts. The output report notes which mode was used and what limitations apply.

---

## Edge cases

### Engine returns no useful answer

Some queries produce no useful AI response (the engine cannot find relevant information). Mark the query as "no useful citation" and exclude from share calculations.

### Multiple dealerships with similar names

Some markets have multiple dealerships with similar names (e.g., "Smith Auto Group" vs "Smith Family Buick"). The skill must distinguish. Confirm with the user before running.

### Recent dealership name change

If the dealership recently changed names, AI engines may still cite the old name. Note this in the report and recommend NAP correction as a quick win.

### Group rooftop conflated with sibling rooftops

If the dealership is part of a group with sibling rooftops, engines may sometimes cite the group or a sibling instead. The skill flags these as ambiguous citations.

### Engines deflecting (refusing to answer)

Some engines (Claude, Gemini in some configurations) refuse to make specific dealership recommendations. This is engine behavior, not a dealer-specific issue. Note it in the engine-by-engine section.

---

See QUERY_TAXONOMY.md for the 25 to 30 query template and SOURCE_TAXONOMY.md for the bucket classification and weights.
