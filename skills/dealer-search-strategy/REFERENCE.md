# Dealer Search Strategy — Reference Framework

The SEO/AEO/GEO definitions, the 4-pillar framework, and the strategic principles. SKILL.md references this file. Read it before generating any strategy doc.

---

## The terminology, clarified once and for all

### SEO (Search Engine Optimization)

The discipline of being found in traditional search engines that return a list of links.

**Primary surfaces:** Google web search, Bing.
**User behavior:** User types a query, sees a list of links, picks one, clicks through to the page.
**Signals that matter:** Backlinks, content depth, on-page optimization, Core Web Vitals, freshness, schema, E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness), internal linking, mobile-friendliness, local signals (GBP, citations, NAP).
**Outcome metric:** Ranking position, organic clicks, ranked-keyword count, organic conversion rate.

### AEO (Answer Engine Optimization)

The discipline of being cited in answer engines that assemble an answer from multiple sources.

**Primary surfaces:** Google featured snippets, People Also Ask, ChatGPT, Perplexity, Gemini, Claude, Copilot, Bing chat.
**User behavior:** User asks a question, sees an answer, may or may not click on cited sources.
**Signals that matter:** Citation breadth (mentions in trusted publications), entity reinforcement (consistent NAP and brand portfolio across the web), conversational content (Q&A in extractable structure), structured data (schema, JSON-LD), llms.txt, AI crawler access, FAQ schema, plain-language extractable sentences.
**Outcome metric:** Citation frequency in answers, brand-name accuracy in AI engines, AI-driven referral traffic (sometimes hard to measure directly).

### GEO (Generative Engine Optimization)

Functionally synonymous with AEO in most current usage. Some practitioners distinguish:

- **GEO** specifically targets generative AI engines (ChatGPT, Perplexity, Gemini, Claude, Copilot).
- **AEO** is the broader category that includes both generative engines and classical answer engines (Google's featured snippets, People Also Ask).

For most dealers, treat AEO and GEO as the same discipline. The skill uses AEO/GEO throughout to acknowledge both terms.

### Related terms you will see

- **LLM SEO.** Optimizing for Large Language Model citation. Often used as a synonym for AEO/GEO. Some practitioners use it to specifically describe the work of getting content into AI training data, though this is now largely impractical because of how training cycles work.
- **AI Search Optimization.** Another synonym for AEO/GEO.
- **ChatGPT SEO, Perplexity SEO, Gemini SEO.** Engine-specific framings of AEO/GEO. Useful in vendor pitches but the underlying discipline is the same across engines.
- **Featured snippet optimization.** A sub-discipline of AEO that targets Google's featured snippet box. Still relevant.
- **Voice search optimization.** A pre-AEO framing of answer-engine optimization (Alexa, Siri, Google Assistant). The technical principles overlap heavily with AEO.

The dealer should not get distracted by the terminology proliferation. The core question is: am I optimizing for the link list, the answer, or both?

---

## The cleanest mental model

**SEO** targets the link list. The user picks the link.
**AEO/GEO** targets the answer. The engine assembles the answer.

A site can rank #1 in Google web search and be invisible in ChatGPT. A site can be cited frequently in Perplexity and rank on page 3 of Google. Most dealers want both. The strategy unifies the work.

---

## Why dealers need all three

For a franchise or independent car dealer, the search landscape is shifting but not in one direction. Different buyer segments use different surfaces:

- **Traditional buyers** still start at Google. They search "[brand] dealer near [city]" and click from the SERP.
- **Research-stage buyers** increasingly start at AI engines. They ask Perplexity "best truck for towing a 7000 lb trailer" and read the answer.
- **Comparison-stage buyers** mix both. They might use ChatGPT for high-level options and Google for specific dealer comparisons.
- **Local repeat customers** find the dealer through GBP, direct nav, and SMS — outside the search funnel entirely.

A dealer who invests only in SEO misses the research-stage buyer who is forming brand and dealer impressions before they ever touch Google. A dealer who invests only in AEO/GEO misses the high-intent buyer who is ready to click a link and visit.

The right strategy covers both.

---

## The 4-pillar framework

Every dealer search strategy is structured around four pillars. The pillars cover both SEO and AEO/GEO, with significant overlap in some areas and discipline-specific tactics in others.

### Pillar 1. Technical foundation

The infrastructure that makes both SEO and AEO/GEO work. Shared between both disciplines.

Includes:
- Core Web Vitals (LCP, CLS, INP)
- HTTPS, security headers, HSTS
- Mobile UX and responsiveness
- Crawlability (robots.txt, sitemap.xml, indexability)
- Schema markup (AutoDealer, Vehicle, LocalBusiness, FAQPage, Product)
- llms.txt for AI engines
- AI crawler access (GPTBot, ClaudeBot, PerplexityBot, Google-Extended)
- Site architecture and internal linking
- Hosting and CDN

This pillar is "table stakes." A dealer site that fails technical foundation cannot meaningfully invest in SEO or AEO/GEO. Both engines deprioritize slow, broken, or uncrawlable sites.

Skills that execute this pillar: `dealer-site-score` (audit), `dealer-llms-txt-generator` (specific tool).

### Pillar 2. SEO (traditional Google ranking)

The discipline of being found in Google web search.

Includes:
- Keyword research (target queries, intent classification)
- On-page optimization (title tags, meta descriptions, header structure)
- Content depth and freshness
- Local SEO (GBP claimed and complete, NAP consistency across directories, local citations)
- Backlink strategy (PR, partnerships, OEM presence, industry coverage)
- E-E-A-T signals (author credentials, site authority)
- Inventory feed and SRP/VDP optimization (this is dealer-specific — Vehicle schema, unique descriptions, photo SEO)
- Internal linking strategy (topic clusters, pillar pages, related vehicle linking)

This pillar is where most "SEO" agencies focus. The work is well-understood and the tactics are mature.

Skills that contribute to this pillar: `dealer-aeo-content-brief` (content briefs that work for both SEO and AEO), `dealer-vdp-merchandising-review` (VDP-level SEO).

### Pillar 3. AEO / GEO (AI engine citation)

The discipline of being cited in AI engine answers.

Includes:
- Entity reinforcement (consistent dealership data across the web)
- Conversational content (Q&A in extractable structure)
- Answer-first writing (first 100 words answer the query)
- Third-party citations (local press, OEM recognition, trade publications)
- llms.txt curation
- FAQPage schema and question-led headings
- Plain language over marketing copy
- AI crawler access verification
- Live AI engine testing (verifying citations in test queries)

This pillar is where most dealers and most agencies are underdeveloped. The tactics are newer and less well-understood, but the leverage is significant because competitive intensity is lower than SEO.

Skills that execute this pillar: `dealer-aeo-audit` (audit), `dealer-llms-txt-generator` (infrastructure), `dealer-aeo-content-brief` (content briefs).

### Pillar 4. Cross-channel (owned data, off-site, reputation)

The work that affects search but happens off the dealer's site.

Includes:
- Owned-data strategy (DMS, CRM as audience source for retargeting and lookalikes — supports paid search and AEO entity reinforcement)
- Off-site presence (directories, OEM locator, industry sites)
- Review velocity and breadth (Google, DealerRater, Cars.com, Yelp)
- Reputation management (review responses, sentiment trends)
- Brand monitoring (mentions across the web, including AI engine answers)

This pillar is often treated as "marketing" rather than "search," but it has direct effects on both SEO (review signals, local citations, brand authority) and AEO/GEO (entity reinforcement, citation breadth).

Skills that contribute to this pillar: `dealer-customer-sentiment-analyzer` (reputation), `dealer-equity-mining-campaign-builder` (owned-data activation).

---

## Strategic principles

The five principles that guide every dealer search strategy produced by this skill.

### 1. Foundation first.

A dealer with technical foundation gaps (Pillar 1) cannot productively invest in Pillars 2, 3, or 4. The strategy always sequences Pillar 1 first. This usually means running dealer-site-score and dealer-aeo-audit as baseline diagnostics before any content or outreach work.

### 2. AEO/GEO has lower competitive intensity than SEO.

Most dealers and most agencies have invested heavily in SEO and barely in AEO/GEO. This means AEO/GEO foundation work produces faster and larger relative gains for the first dealers in each market who do it well. The strategy recommends weighting investment toward AEO/GEO when the dealer is starting from balanced foundations.

### 3. SEO results take longer than AEO/GEO foundation results.

A dealer who fixes their llms.txt, schema, and conversational content can see AEO/GEO citation gains in 1 to 3 months. SEO ranking gains for competitive queries typically take 3 to 6 months minimum, often longer.

This timing difference matters for budget allocation. Dealers with tight quarterly windows benefit from front-loading AEO/GEO work because it produces visible signal sooner.

### 4. Content briefs are the leverage point.

Most dealer search strategies fail at execution because the content gets written by a writer who does not understand AEO. The dealer-aeo-content-brief skill closes this gap by producing briefs that specify the first 100 words verbatim, the required Q&A, and the AI extraction sentences. The strategy recommends using briefs for every page or post produced as part of the search investment.

### 5. Honest measurement beats vanity metrics.

Many "SEO reports" cite ranked-keyword count, organic impressions, and similar metrics that do not tie to dealer outcomes. The strategy recommends measuring against dealer-specific outcomes: leads attributed to organic, AI-driven referrals, citation accuracy in test queries, conversion rate from organic. Vanity metrics produce vanity strategies.

---

## Typical timeline expectations

The strategy should set realistic expectations.

### Pillar 1 (Technical foundation)

- **Quick wins** (robots.txt, llms.txt publication, basic schema): days to 2 weeks.
- **Platform-side fixes** (vendor changes to schema, CDN, mobile UX): 2 weeks to 60 days.
- **Major platform migration** (if required): 3 to 6 months.

### Pillar 2 (SEO)

- **On-page improvements**: visible Google Search Console movement in 2 to 4 weeks for non-competitive queries; 2 to 4 months for competitive queries.
- **Backlink strategy results**: 3 to 6 months for measurable authority lift.
- **Local SEO improvements**: 30 to 90 days for GBP completeness and NAP consistency to produce ranking lift.

### Pillar 3 (AEO/GEO)

- **AI crawler access** (robots.txt fix): immediate (engines re-crawl within days).
- **llms.txt publication**: AI engines that read it pick it up within 2 to 6 weeks.
- **Schema implementation**: 2 to 4 weeks for AI engines to pick up the structured data.
- **Conversational content publication**: 30 to 90 days for citation accuracy improvement.
- **Third-party citations and PR**: 3 to 12 months for measurable lift.

### Pillar 4 (Cross-channel)

- **Review velocity improvement**: 30 to 60 days for visible cadence improvement.
- **Owned-data audience activation**: 14 to 30 days to deploy; results compound thereafter.

---

## Budget allocation framework

The strategy recommends budget allocation based on the dealer's scenario.

### Lean budget ($1K to $3K/month for organic search)

Recommended allocation:
- 40% AEO/GEO content production and infrastructure
- 30% SEO content and on-page work
- 20% review and reputation work
- 10% technical foundation maintenance

Rationale: at lean budget, AEO/GEO offers the highest leverage per dollar because foundation tactics are cheap and competitive intensity is low.

### Mid budget ($3K to $10K/month)

Recommended allocation:
- 30% AEO/GEO content production, citation outreach, infrastructure
- 30% SEO content, technical, on-page
- 20% local SEO, reputation, review work
- 10% technical foundation
- 10% reserved for testing and experimentation

Rationale: balanced investment across all four pillars. Includes capacity for PR/citation outreach which moves both SEO authority and AEO/GEO citation breadth.

### High budget ($10K+/month)

Recommended allocation:
- 25% AEO/GEO comprehensive program
- 25% SEO comprehensive program
- 20% local SEO and reputation
- 15% PR, citation outreach, OEM coverage
- 10% technical platform and engineering
- 5% reserved for testing

Rationale: at high budget, the dealer can run a full program across all dimensions. Includes dedicated SEO/AEO specialist (in-house or agency-led).

---

## Vendor strategy guidance

Every dealer search strategy should address what to bring in-house, what to outsource, and what to expect from the website platform vendor.

### Typically in-house

- GBP maintenance and posts
- Review responses
- Content writing (executed from briefs)
- Basic platform-side updates (where the platform allows)
- Performance review and weekly reporting

### Typically outsourced (agency or specialist)

- Citation outreach and PR for third-party authority
- Complex schema implementation
- Technical SEO audits beyond quarterly
- AEO/GEO specialist work (still rare; most agencies are still SEO-only)
- Specialized content production (video, deep-dive guides)

### Typically platform vendor (Dealer.com, DealerOn, DealerInspire)

- Platform-level schema bundle
- robots.txt and AI crawler access
- Mobile UX templates
- Core Web Vitals at the template level
- Schema for inventory feed (Vehicle, Product)

The strategy flags when a recommended action requires the website platform vendor specifically. Many dealers do not realize their platform vendor can implement specific changes if asked.

---

## Strategic principles for SEO/AEO/GEO clarity

The skill produces strategy docs that clarify the terminology for the dealer's team. This is part of the value. Every doc includes the clarifier section because most dealer team members and many agency partners use the terms interchangeably.

The principles that govern the clarification:

- **Use all three terms (SEO, AEO, GEO) in the doc** even when the dealer is starting from confusion. The doc creates shared vocabulary inside the dealership.
- **Acknowledge that AEO and GEO are often synonymous** but explain the slight distinction.
- **Never claim one will replace the other.** SEO is not dying. AEO/GEO is not a fad. Both serve different buyer behaviors.
- **Position the dealer to invest in both** with clear allocation guidance.

See PILLARS.md for the tactic-level detail per pillar and ROADMAP.md for the 90-day template structure.
