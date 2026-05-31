# Dealer Search Strategy — Pillar Tactics

Tactic-level detail per pillar. SKILL.md and REFERENCE.md reference this file. Use this when generating the per-pillar sections of the strategy doc.

---

## Pillar 1. Technical foundation

### What it is

The infrastructure that makes a dealer site work for both SEO and AEO/GEO. Shared between disciplines. Foundation gaps in this pillar cascade into every other pillar.

### Why it matters

A site that fails Core Web Vitals loses Google rankings and gets crawled less often. A site with broken schema is invisible to AI engines parsing structured data. A site that blocks GPTBot does not exist for ChatGPT. A site with stale or missing sitemap.xml does not get current pages indexed.

The technical foundation is the single highest-leverage area for most dealers because the issues are fixable and the gains compound across SEO and AEO/GEO simultaneously.

### Tactics

**Core Web Vitals.** Measure LCP, CLS, INP on home, an SRP, a VDP, and the service page. Target: all green on mobile. Fixes typically involve image optimization, third-party tag reduction, render-blocking script elimination. Often platform-side; engage the vendor.

**Schema markup.** AutoDealer on home, Vehicle on every VDP, LocalBusiness consistent NAP, Service on service page, FAQPage where Q&A exists, Product wrapper with offers on VDPs. Validate in Rich Results Test.

**llms.txt at root.** Use dealer-llms-txt-generator. Publish to `/llms.txt`. Re-generate every 90 days.

**robots.txt allows AI crawlers.** GPTBot, ClaudeBot, PerplexityBot, Google-Extended all allowed. Verify with curl.

**Sitemap.xml current and submitted.** Last fetched within 7 days in GSC. Inventory feed produces fresh sitemap entries.

**HTTPS enforced everywhere.** 301 from HTTP to HTTPS, HSTS header set with 6-month max-age, no mixed content warnings.

**Mobile UX.** Viewport meta tag, 48x48 px touch targets, mobile page weight under 3 MB on home/SRP/VDP, Lighthouse mobile score above 80.

**Hosting and CDN.** TTFB under 600ms, HTTP/2 or HTTP/3, CDN serving static assets, no 5xx errors on sampled pages.

### 30/60/90 day cadence for typical dealer

**Days 1-30 (Foundation triage):**
- Run dealer-site-score (full audit, 100-point grade).
- Run dealer-aeo-audit (specifically dimensions 1-3).
- Fix any AI crawler blocks (robots.txt update).
- Publish llms.txt using dealer-llms-txt-generator.
- Open vendor tickets for any platform-side schema or performance issues.

**Days 31-60 (Foundation implementation):**
- Vendor implements schema fixes, Core Web Vitals improvements, mobile UX fixes.
- Dealer team verifies fixes go live.
- Re-run dealer-site-score to measure delta.

**Days 61-90 (Foundation maintenance):**
- Establish weekly Core Web Vitals monitoring.
- Add a schema regression check to the deploy/inventory-update process.
- Document the foundation state for the strategy review.

### KPIs

- Dealer-site-score total (target: 85+)
- Mobile Core Web Vitals all green
- GSC indexed pages count (95%+ of sitemap entries)
- llms.txt published and verified

### Owner

Typically the marketing director with vendor coordination for platform-side work. Some dealers have an in-house IT or dev resource; most do not.

---

## Pillar 2. SEO (traditional Google ranking)

### What it is

The discipline of being found in Google web search for high-intent dealer queries. The "find a [brand] dealer near me" and "where to buy a [model] in [city]" type queries.

### Why it matters

Despite the migration to AI engines, the majority of high-intent dealer queries still happen on Google. SEO produces direct, attributable traffic that converts to leads and sales. Pure AEO/GEO investment without SEO leaves money on the table.

### Tactics

**Keyword research.** Identify the primary target queries by city, brand, and model. Tools: Ahrefs, Semrush, Google Keyword Planner. Output: a keyword map showing which pages target which queries.

**On-page optimization.** Title tags under 60 chars, meta descriptions under 160 chars, H1-H2-H3 hierarchy reflecting query intent, primary keyword in title and first paragraph, related entities throughout.

**Content depth.** Pages targeting high-competition queries (e.g., "GMC Sierra in Birmingham") need 1,200 to 2,500 words of genuinely useful content, not 200-word boilerplate.

**Local SEO.** GBP claimed, complete (hours, brand portfolio, services, photos, posts), reviews coming in regularly. NAP consistent across top 20 directories. Local citations from chamber, BBB, local press.

**Backlink strategy.** Earn links through PR, OEM coverage, local press, community sponsorships, trade publication mentions. Avoid paid link schemes (Google penalizes).

**E-E-A-T signals.** Author bios with credentials on content pages, dealer principal bio with industry recognition, OEM awards displayed, security certifications visible.

**Inventory feed and SRP/VDP optimization.** SRPs target broad keyword variants ("used trucks in [target city]"). VDPs target specific model-trim-year combinations. Vehicle schema on every VDP. Unique descriptions per vehicle. Photo SEO (filenames, alt text).

**Internal linking strategy.** Pillar pages (e.g., GMC Sierra overview) link to specific model-year pages. Service guides link to scheduling page. Buying help pages link to financing.

### 30/60/90 day cadence for typical dealer

**Days 1-30 (SEO audit and quick wins):**
- Audit GBP for completeness. Update missing fields. Post regularly.
- Verify NAP consistency across top 10 directories. Fix discrepancies.
- Run on-page audit using a tool like Ahrefs or Screaming Frog. Identify top 20 pages with title tag, meta, or schema issues. Fix.
- Identify top 10 keyword opportunities. Plan content briefs for the next 90 days.

**Days 31-60 (Content production and on-page):**
- Generate content briefs for the planned content using dealer-aeo-content-brief (briefs work for both SEO and AEO).
- Production: 4 to 8 new or rewritten pages.
- Continue NAP cleanup across long-tail directories.
- Begin backlink outreach.

**Days 61-90 (Content production and authority):**
- 4 to 8 more pages produced.
- PR outreach for citation and link opportunities.
- Re-measure rankings on target queries via GSC and Ahrefs.

### KPIs

- Ranked-keyword count (with intent classification)
- Organic clicks (GSC)
- Average position for primary target queries
- Conversion rate from organic traffic
- GBP impressions and clicks

### Owner

Marketing director or SEO agency. In-house content writer (with brief from dealer-aeo-content-brief).

### Vendor involvement

Website platform vendor for some technical fixes. Agency for PR/citation outreach (most dealers do not have this in-house).

---

## Pillar 3. AEO / GEO (AI engine citation)

### What it is

The discipline of being cited in AI engine answers when buyers ask AI engines (ChatGPT, Perplexity, Gemini, Claude, Copilot) about local dealers, brands, vehicles, service, or financing.

### Why it matters

A growing share of buyer research happens at AI engines. Buyers ask "best GMC dealer in [target city]" of ChatGPT directly, read the answer, and form impressions of which dealers exist and which are credible before they ever touch Google.

A dealer who is missing from AI answers does not exist for the research-stage buyer. The cost of being missing is invisible — there is no log of the conversation — but it is real.

### Tactics

**Entity reinforcement.** Consistent NAP, brand portfolio, hours, and key facts about the dealership across the dealer website, GBP, OEM locator, Apple Maps, Bing Places, Yelp, BBB, Cars.com, DealerRater, and major directories. Inconsistency makes AI engines distrust the entity.

**Conversational content.** Service page answers "how long does an oil change take" in plain language. Buying-help page answers "do you take trades with negative equity." Q&A blocks throughout the site. Plain language over marketing prose.

**Answer-first writing.** First 100 words of every page answers the target query directly. AI engines extract from top-of-page first. Marketing-prose intros produce nothing extractable.

**Third-party citations.** Local press mentions, OEM press releases, trade publication coverage. AI engines weight pages cited by trusted publications.

**llms.txt publication.** Use dealer-llms-txt-generator. Re-generate every 90 days.

**FAQPage schema.** On any page with real Q&A. Both as a ranking signal and as an AEO extraction signal.

**AI crawler access.** robots.txt allows GPTBot, ClaudeBot, PerplexityBot, Google-Extended. Verified.

**Live AI engine testing.** Run a query bank (10 queries) on ChatGPT, Perplexity, and Gemini monthly. Track whether the dealer is cited, with what accuracy. This is the AEO/GEO equivalent of rank tracking in SEO.

**Spanish-language AEO.** Where the dealer serves a bilingual market, AEO opportunities in Spanish are even less competitive. Spanish-language AEO content is often a quick win.

### 30/60/90 day cadence for typical dealer

**Days 1-30 (AEO foundation):**
- Run dealer-aeo-audit (all 10 dimensions).
- Fix AI crawler blocks (immediate).
- Publish llms.txt using dealer-llms-txt-generator.
- Verify NAP consistency across top 20 directories.
- Establish a 10-query test bank for monthly live AI engine testing.

**Days 31-60 (AEO content):**
- Generate content briefs using dealer-aeo-content-brief for the highest-priority AEO gaps.
- Production: 3 to 6 new or rewritten pages optimized for AEO.
- Begin third-party citation outreach (local press, trade publications).
- Re-run dealer-aeo-audit to measure delta.

**Days 61-90 (AEO authority and amplification):**
- 3 to 6 more pages produced.
- Continue citation outreach.
- Live AI engine testing: measure citation accuracy across the test bank.
- Document any newly-cited queries.

### KPIs

- AI engine citation count across the test bank (target: 60%+ accuracy by day 90)
- llms.txt published, verified, and re-fetched by AI engines
- Entity accuracy in brand-name lookups (correct hours, address, brand portfolio in ChatGPT, Perplexity, Gemini)
- Third-party citations earned (count, monthly)

### Owner

Marketing director or AEO specialist (rare; most agencies do not have one). Content writer for execution.

### Vendor involvement

Platform vendor for schema and crawler access. PR firm or specialist for citation outreach.

---

## Pillar 4. Cross-channel (owned data, off-site, reputation)

### What it is

The off-site work that affects both SEO and AEO/GEO: review activity, owned-data audience strategy, off-site brand presence, reputation management.

### Why it matters

Reviews drive both local SEO (Google considers review velocity and breadth in local ranking) and AEO/GEO (AI engines weight review sentiment and volume when describing dealers). Owned-data audiences amplify both SEO traffic (through retargeting that reinforces brand visibility) and entity authority.

This pillar often gets categorized as "marketing" rather than "search," but it directly affects both disciplines.

### Tactics

**Review velocity and breadth.** Process for requesting reviews from every customer who has a positive interaction. Target: 5+ fresh reviews per week across Google, DealerRater, Cars.com. Use dealer-customer-sentiment-analyzer to monitor sentiment trends.

**Review response cadence.** Respond to all reviews within 7 days. Negative within 24 hours. Sentiment analyzer surfaces which reviews need response priority.

**Owned-data audience strategy.** DMS and CRM data as audiences for retargeting and lookalike modeling. This is the equity mining campaign builder's input source. Refresh quarterly.

**Off-site brand presence.** OEM locator complete, BBB profile claimed, chamber of commerce, industry trade groups, local press relationships. Each presence reinforces entity for AI engines.

**Brand monitoring.** Mentions of the dealership across the web (positive and negative). Tools: Google Alerts, Ahrefs Brand Monitoring, mentions in social. Monthly review.

**Reputation management.** Address negative reviews honestly. Encourage positive reviews from satisfied customers. Surface star performers internally. Use dealer-customer-sentiment-analyzer to identify operational signals.

### 30/60/90 day cadence for typical dealer

**Days 1-30 (Foundation):**
- Run dealer-customer-sentiment-analyzer on the last 90 days of reviews.
- Establish review request workflow at sales delivery and service checkout.
- Verify off-site brand presence (OEM locator, BBB, chamber).
- Implement brand monitoring alerts.

**Days 31-60 (Cadence):**
- Hit 5+ reviews per week target.
- Respond to all reviews within the SLA.
- Begin owned-data audience activation (if equity mining campaign is in scope).

**Days 61-90 (Optimization):**
- Re-run dealer-customer-sentiment-analyzer to measure delta.
- Adjust review request workflow based on what is working.
- Continue brand monitoring.

### KPIs

- Reviews per week (target: 5+)
- Star rating (Google, DealerRater, Cars.com — track all three)
- Response cadence (target: 100% responses within 7 days)
- Sentiment trend (positive/mixed/negative distribution, monthly)
- Brand mention count (web mentions, monthly)

### Owner

Marketing director, BDC manager (for review requests), GM (for reputation oversight).

### Vendor involvement

Usually none. Reputation management is mostly in-house work.

---

## How the pillars compound

The pillars are not independent. Specific compounding effects:

**Technical foundation + AEO content.** Even excellent AEO content fails if the site is technically broken. Foundation gates AEO performance.

**SEO content + AEO content.** Briefs from dealer-aeo-content-brief work for both. The same page that ranks in Google can also be cited in ChatGPT if written correctly.

**Cross-channel reputation + AEO entity reinforcement.** Reviews on multiple platforms reinforce the dealership entity for AI engines. The same review velocity that improves local SEO also improves AEO citation accuracy.

**Owned-data audiences + SEO retargeting.** Customer Match in Google Ads (built from DMS data) reinforces brand visibility, which has indirect effects on organic CTR.

The strategy weights actions by their cross-pillar effects. Actions that move multiple pillars get prioritized.

See ROADMAP.md for the integrated 90-day template that translates these pillar tactics into a sequenced calendar.
