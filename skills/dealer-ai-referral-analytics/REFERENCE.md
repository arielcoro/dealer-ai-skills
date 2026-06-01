# Dealer AI Referral Analytics — Framework Reference

8 dimensions. 100 points total. Per-dimension sub-scoring. AI engine referrer domain inventory. Bot identifier inventory. Letter grade bands.

Authoritative scoring framework. SKILL.md and CHECKS.md reference this file.

---

## AI engine referrer domain inventory

Domains that should be classified as "AI Search Referrals" in custom channel grouping:

### Confirmed AI-engine referrer domains

- `chat.openai.com`
- `chatgpt.com`
- `perplexity.ai`
- `www.perplexity.ai`
- `gemini.google.com`
- `bard.google.com` (legacy, may still appear in historical data)
- `copilot.microsoft.com`
- `www.bing.com/chat`
- `claude.ai`
- `www.claude.ai`
- `grok.com`
- `x.com/i/grok` (Grok-within-X)
- `you.com`
- `phind.com`
- `kagi.com` (Kagi Assistant)
- `arc.net` (Arc Search)
- `andisearch.com` (Andi)
- `huggingface.co/chat`
- `chat.deepseek.com`
- `chat.mistral.ai`
- `poe.com`

### Probable AI-engine referrer domains (newer or less common)

- `meta.ai`
- `inflection.ai`
- `pi.ai`
- `kimi.moonshot.cn` (international)
- `metaso.cn` (international)
- `chat.aiqxs.com` (varies)

Maintain this list. Add new AI engines as they appear. Audit recommended quarterly because the list is rapidly evolving.

### Note on Google AI Mode

Google AI Mode (the AI-powered search experience within Google Search) does not produce a distinct referrer. Visits arriving from AI Mode appear as `google.com` referrer or as Organic Search in GA4. The skill detects AI Mode presence indirectly through GSC: queries where impressions are high but click-through-rate is low, queries where the dealer ranks in top 3 but click-through is much lower than expected for that position, and (when GSC adds dedicated AI Mode reporting) direct AI Mode data.

---

## AI bot identifier inventory

Bots that crawl the dealership site to inform AI engines:

| Bot user agent | Engine / purpose |
|---|---|
| `GPTBot/1.0` | OpenAI training and inference |
| `ChatGPT-User/1.0` | OpenAI on-demand fetch (when ChatGPT user requests info) |
| `OAI-SearchBot/1.0` | OpenAI search index |
| `PerplexityBot/1.0` | Perplexity search index |
| `Perplexity-User/1.0` | Perplexity on-demand fetch |
| `ClaudeBot/1.0` | Anthropic training and inference |
| `Claude-User/1.0` | Anthropic on-demand fetch |
| `Claude-SearchBot/1.0` | Anthropic search index |
| `Google-Extended` | Google's Gemini / Bard training (controlled via robots.txt) |
| `GoogleOther/1.0` | Google's experimental crawl (training and other) |
| `Applebot-Extended/1.0` | Apple's Spotlight, Siri, Apple Intelligence training |
| `Applebot/1.0` | Apple's search index (Spotlight, Siri) |
| `Bytespider/1.0` | ByteDance / TikTok / Doubao |
| `Bingbot/2.0` | Microsoft Bing index (also informs Copilot) |
| `MSBOT/2.0` | Microsoft legacy |
| `CCBot/2.0` | Common Crawl (used by many AI engines as a training source) |
| `Diffbot/1.0` | Diffbot (commercial AI training data provider) |
| `Meta-ExternalAgent/1.1` | Meta AI training |
| `Meta-ExternalFetcher/1.1` | Meta AI on-demand fetch |
| `cohere-ai` | Cohere AI training |
| `Amazonbot/0.1` | Amazon's Alexa, Rufus, and other AI training |
| `Iaskbot/1.0` | iAsk AI |
| `omgilibot` | omgili (used by some AI systems) |
| `Mistralbot/1.0` | Mistral training |
| `DuckAssistBot/1.0` | DuckDuckGo's AI assistant |

This list evolves rapidly. Maintain quarterly.

---

## Dimension 1. AI referrer detection in GA4 — 14 pts

### 1.1 Custom channel group created (5 pts)
- 5: GA4 has a custom channel group "AI Search Referrals" with rules covering at least 8 confirmed AI engine referrer domains.
- 3: Custom channel group exists with partial coverage (4 to 7 domains).
- 1: Some AI traffic captured manually via segments but no formal channel group.
- 0: No AI referrer tracking. AI traffic lumped into "Referral" or "Direct."

### 1.2 Custom dimension for AI engine (4 pts)
- 4: GA4 custom dimension `ai_referrer_engine` registered. Populated via GTM or dataLayer push on AI referrer detection. Allows per-engine reporting.
- 2: Dimension exists but population is partial.
- 0: No custom dimension.

### 1.3 Audience built for AI referrer visitors (3 pts)
- 3: GA4 audience "AI Search Visitors" created. Last 30 days, all AI referrer sources.
- 1: Audience exists but partial criteria.
- 0: No audience.

### 1.4 Audience imported into Google Ads (2 pts)
- 2: Audience available in Google Ads for remarketing or exclusion. Active usage (campaign references audience).
- 1: Imported but unused.
- 0: Not imported.

---

## Dimension 2. AI engine traffic volume and trend — 14 pts

### 2.1 Past-30-day AI traffic measurable (4 pts)
- 4: Past-30-day AI traffic count is reportable per engine. Numbers are credible (not over-inflated by including general Google traffic).
- 2: Partial measurability.
- 0: AI traffic cannot be reported separately.

### 2.2 Trend over past 90 days computable (4 pts)
- 4: 90-day trend per engine available. Direction (growing, flat, declining) is clear.
- 2: Trend available but noisy.
- 0: No trend data.

### 2.3 AI traffic share of total organic-adjacent traffic (3 pts)
- 3: AI traffic share is computed and tracked over time. Industry-typical dealer: 1% to 8% today, growing.
- 1: Share computable as a one-off but not tracked.
- 0: Not computed.

### 2.4 Engine mix understood (3 pts)
- 3: Per-engine share (ChatGPT vs Perplexity vs Gemini vs Copilot vs others) is reported. Engine mix evolves over time and dealers should monitor.
- 1: Aggregate only.
- 0: No engine-level breakdown.

---

## Dimension 3. Landing page distribution — 12 pts

### 3.1 Top 10 AI-referral landing pages identified (4 pts)
- 4: Top 10 AI-referral landing pages reportable. Often surprising (FAQ pages, location pages, specific VDPs, comparison content).
- 2: Top landing pages partially identifiable.
- 0: Cannot identify.

### 3.2 Page-type distribution (3 pts)
- 3: AI-referral traffic distribution by page type (home, SRP, VDP, service, finance, contact, location, blog) computed.
- 1: Partial.
- 0: Not computed.

### 3.3 High-AI-traffic pages have AEO-optimized content (3 pts)
- 3: The pages receiving the most AI-referral traffic have been audited (via dealer-aeo-audit) and show strong AEO optimization. AI engines surface content that helps users.
- 1: Mixed.
- 0: High-AI-traffic pages are weak AEO-wise; the dealer is leaving conversion on the table.

### 3.4 Mismatched pages identified (2 pts)
- 2: Pages where AI brings high traffic but the page is not aligned with buyer intent are flagged for redesign or redirection.
- 1: Some identified.
- 0: Not analyzed.

---

## Dimension 4. AI-traffic engagement quality — 14 pts

### 4.1 Engagement time benchmarked vs organic (4 pts)
- 4: AI-referral average engagement time is computed and benchmarked against organic search engagement. Differential explained.
- 2: Computed but not interpreted.
- 0: Not computed.

### 4.2 Engaged sessions per user (3 pts)
- 3: AI-referral engaged sessions per user computed and benchmarked.
- 1: Partial.
- 0: Not computed.

### 4.3 Bounce rate benchmarked (3 pts)
- 3: AI-referral bounce rate computed and benchmarked. Typically: AI bounce rate is lower than direct, higher than organic search.
- 1: Computed but not interpreted.
- 0: Not computed.

### 4.4 Pages per session (2 pts)
- 2: Computed and benchmarked.
- 0: Not computed.

### 4.5 Returning user rate (2 pts)
- 2: AI-referral returning user rate computed.
- 0: Not computed.

---

## Dimension 5. AI-traffic conversion — 14 pts

### 5.1 Key event rate from AI traffic measured (5 pts)
- 5: Key event (conversion) rate from AI-referral traffic is measured and reportable. AI traffic typically converts at a higher rate per session than direct, comparable or slightly lower than organic search.
- 3: Partial measurement.
- 0: Not measured.

### 5.2 Conversion per engine (4 pts)
- 4: Conversion rate per engine is reportable (ChatGPT vs Perplexity vs Gemini differ).
- 2: Aggregate only.
- 0: Not reportable.

### 5.3 Lead-to-sale conversion from AI traffic (3 pts)
- 3: For AI-referral leads, lead-to-sale conversion rate is tracked through CRM (requires GCLID alternative or session tracking through the lead form).
- 1: Lead-stage only.
- 0: Not tracked.

### 5.4 ROI on AEO investment (2 pts)
- 2: Conversion value attributable to AI referrals is computed and compared to AEO investment cost. ROI computed.
- 1: Partial.
- 0: Not computed.

---

## Dimension 6. GSC AI Mode and AI Overview presence — 12 pts

### 6.1 Queries with AI Overview detection (5 pts)
- 5: Process in place to identify queries where AI Overviews appear in Google Search. Typically: queries where the dealer ranks well in top 3 but click-through-rate is much lower than expected for that position.
- 3: Manual detection process exists but inconsistent.
- 1: Aware of the phenomenon but no detection.
- 0: No monitoring.

### 6.2 Query CTR drift monitored (3 pts)
- 3: Weekly or monthly review of GSC queries where CTR has dropped significantly. CTR drift on queries the dealer ranks for is a proxy for AI Overview cannibalization.
- 1: Quarterly review only.
- 0: No monitoring.

### 6.3 GSC "AI experience" reporting used (when available) (2 pts)
- 2: GSC's emerging AI-experience reports are referenced when available (Google has begun adding AI Mode-related filters).
- 0: Not used.

### 6.4 Impressions and clicks per query tracked over time (2 pts)
- 2: Per-query trend over 90+ days is tracked to detect AI cannibalization patterns.
- 0: Not tracked.

---

## Dimension 7. AI bot crawl traffic — 12 pts

### 7.1 Bot identification source available (4 pts)
- 4: Server logs accessible OR Cloudflare bot analytics enabled OR a dedicated bot monitoring tool is in place. AI bot crawls are reportable.
- 2: Partial (some logs but not comprehensive).
- 0: No source.

### 7.2 Per-bot crawl volume and pages (3 pts)
- 3: Crawl volume per bot reportable. Top-crawled pages per bot identified. Reveals which pages each AI engine is most interested in.
- 1: Partial.
- 0: Not reportable.

### 7.3 Blocking decisions documented (3 pts)
- 3: Decision to allow or block each AI bot documented in robots.txt with rationale. Currently allowed bots: documented. Currently blocked bots: documented with reason.
- 1: Some documentation.
- 0: No documentation; behavior is accidental.

### 7.4 Crawl-to-citation correlation tracked (2 pts)
- 2: Pages that AI bots crawl heavily are cross-referenced against pages that produce AI citations (via dealer-ai-visibility). Strong correlation confirms AEO is working; weak correlation flags an AEO investment problem.
- 0: Not tracked.

---

## Dimension 8. Attribution and reporting cadence — 8 pts

### 8.1 Reporting cadence established (3 pts)
- 3: Monthly AI referral and AI bot crawl report is produced and shared with the dealer's marketing or operations team. Cadence documented.
- 1: Ad-hoc reporting.
- 0: No cadence.

### 8.2 Report includes trend (2 pts)
- 2: Monthly report includes 30-day, 90-day, and 180-day trend. Direction is interpretable.
- 0: Snapshot only.

### 8.3 Report includes recommendations (2 pts)
- 2: Each report includes 1 to 3 prioritized recommendations based on the findings (e.g., "investing in service-page content; AI bots are crawling it heavily but organic visibility is low").
- 0: Data only, no recommendations.

### 8.4 Stakeholder consumption (1 pt)
- 1: The report reaches the dealer principal, marketing director, or other decision-maker. Decisions reference it.
- 0: Report exists but no one consumes it.

---

## Letter grade bands

- 90 to 100: **A.** Top-decile dealer AI referral analytics setup. AI traffic measured, conversion attributed, bot crawl monitored.
- 80 to 89: **B.** Strong setup with manageable gaps.
- 70 to 79: **C.** Average. AI traffic tracked but engagement and bot crawl analysis incomplete.
- 60 to 69: **D.** Below average. AI traffic largely invisible; no per-engine reporting.
- Below 60: **F.** Critical. The dealer is flying blind on AI search performance.

---

## Typical dealer benchmarks (general; verify per market)

These are general benchmarks for medium-traffic franchise dealer sites (30,000 to 100,000 monthly visitors) with moderate AEO investment. Verify against the specific dealer's actuals.

- **AI referral share of organic-adjacent traffic:** 0.5% to 5% today (2026), growing 50% to 200% year over year for dealers investing in AEO.
- **AI referral conversion rate:** typically 1.5x to 3x direct traffic conversion; 0.7x to 1.0x organic search conversion. AI-referred users are higher intent than direct but slightly lower volume than organic.
- **Engagement time:** AI referrals tend to spend slightly more time per session than direct visitors and similar to organic.
- **AI bot crawl volume:** highly variable by site size. Typical medium dealer site sees 500 to 5,000 AI bot requests per month across all bots.
- **Top AI bots by volume on dealer sites:** GPTBot, Google-Extended, PerplexityBot, ClaudeBot, Bingbot. Applebot-Extended emerging.

---

## House rules

- Score the lower band when in doubt.
- Acknowledge attribution gaps explicitly. Some AI traffic is structurally unmeasurable.
- Never inflate AI traffic numbers to make the dealer feel better. The dealer makes investment decisions on these numbers.
- Compute the total to a whole number.
- Maintain the referrer domain list and bot identifier list quarterly.
- Always cite the specific GA4, GSC, or Cloudflare path for every recommendation.
- For dealers without server log access, Cloudflare analytics is the next-best signal for bot crawl analysis. For dealers without Cloudflare, recommend implementing a bot logging mechanism.
