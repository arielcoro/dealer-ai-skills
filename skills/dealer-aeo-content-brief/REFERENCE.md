# Dealer AEO Content Brief — Reference

The principles, the 12 brief components, and the citation rules. SKILL.md references this file. Read it before generating any brief.

---

## What AEO content writing is

Answer Engine Optimization is content writing designed to be extracted from, not just read. AI engines like ChatGPT, Perplexity, Gemini, Claude, and Copilot pull specific sentences out of pages and stitch them into answers. The page that produces an extractable sentence wins the citation. The page that produces 1,500 words of marketing prose produces nothing extractable and wins nothing.

For a car dealership, this changes how every page on the site should be written. The same content that performs on Google can be invisible to AI engines if it is not written for extraction.

---

## The five AEO writing principles

These are the principles every brief should encode. They are not optional.

### 1. Answer first.

The first 100 words of every page must answer the target query directly. Not a slogan. Not a marketing introduction. The actual answer.

Wrong (marketing prose):
> Welcome to Example Buick GMC Dealer, where families have trusted us with their automotive needs for generations. Our award-winning service team is dedicated to going above and beyond...

Right (answer-first):
> Example Buick GMC Dealer offers brake service, oil changes, multi-point inspections, transmission service, and tire rotations Monday through Friday from 7am to 6pm and Saturday from 8am to 2pm at [Address]. A standard brake job on a GMC Sierra typically takes 60 to 90 minutes.

AI engines extract the second version. They extract nothing from the first.

### 2. Specific over general.

Specific facts outperform general statements every time. AI engines cite specifics because specifics are verifiable.

Wrong: "Our service department is experienced and reliable."
Right: "Our service team includes 6 GMC-certified master technicians with an average of 12 years of experience."

Wrong: "We offer competitive financing."
Right: "We work with 22 lenders including GM Financial, Ally, Capital One Auto, and credit unions across [region], with rates from 5.9% APR for qualified buyers."

Specific over general is the highest-leverage edit on any dealer page.

### 3. Q&A format wins over narrative.

AI engines extract from question-answer pairs more reliably than from running prose. Every dealer page should have at least one Q&A section, and high-AEO pages are built around Q&A entirely.

Q&A wins because:
- It signals intent ("this page answers questions").
- It produces FAQPage schema, which AI engines prefer.
- It produces atomically extractable sentences (one question, one answer).
- It mirrors how customers actually ask AI engines for help.

Every brief should include a Q&A section with at least 5 questions specific to the dealer, the location, the brand, or the page topic.

### 4. Plain language, not marketing copy.

Marketing copy is invisible to AI engines. Plain language is extractable.

Marketing copy uses: slogans, superlatives without evidence ("the best", "the leading"), passive voice, abstract claims, brand-speak.

Plain language uses: specific verbs, concrete nouns, direct statements, real numbers, named entities.

A test: read a paragraph out loud. If it sounds like a salesperson explaining the dealership to a real customer, it is plain language. If it sounds like a brochure, it is marketing copy.

### 5. Entity reinforcement throughout.

AI engines build a model of the entity (the dealership) and the relationships between the entity, the brand portfolio, the location, and the people. Every page should reinforce that model.

Entity reinforcement includes:
- Dealership name in full at least once per major section.
- City and state mentions.
- Brand portfolio mentions.
- People (when relevant) mentioned by name with title.
- Awards or credentials referenced once when relevant.

Over-mentioning is worse than under-mentioning. The goal is natural, factual reinforcement, not stuffing.

---

## The 12 brief components

Every brief produced by this skill has these 12 components, in this order.

### 1. Target query and intent

The brief opens by stating the query the page targets. Three parts:

**Primary query.** The single most important query this page should be cited for. Example: "best truck for towing 7000 lbs near Birmingham".

**Secondary queries.** Three to five related queries the page should also answer. Example: "GMC Sierra towing capacity", "AT4 vs Denali towing", "boat trailer hitch options at GMC dealer".

**Intent classification.** Informational (research), navigational (find a specific dealer), transactional (buy or schedule), local (geographic query). This classification drives tone and CTA.

**Buyer journey stage.** Early (research), mid (comparison), late (decision), retention (existing owner). Drives depth and conversion path.

### 2. Page type and URL

The brief identifies which page-type pattern to use (from PATTERNS.md): model guide, service guide, buying help / FAQ, comparison, financing guide, local landing page, model comparison, or other.

The brief recommends a URL slug following dealer site conventions:
- Lowercase, hyphenated, no stop words.
- Includes primary topic words.
- Avoids dates (dates expire; topics do not).

The brief decides: rewrite an existing URL (provide the URL) or create new.

### 3. Title and meta

**HTML title.** Under 60 characters. Includes the primary topic, the dealership name, the location. Format: `[Topic] | [Dealership Name] | [City]`. Example: `GMC Sierra Denali Towing Guide | Example GMC Dealer | [City]`.

**Meta description.** Under 160 characters. Answers the primary query in plain language. Example: `Towing capacity, hitch options, and payload limits for the 2026 GMC Sierra Denali, with available trims at Example GMC Dealer in [City, State].`

### 4. H1 and opening 100 words

The brief writes the H1 verbatim. The brief writes the first 100 words verbatim. These are not delegated to the writer because they are the most important words on the page for AEO. A writer who is given "write an intro" produces marketing prose. A writer who is given the exact 100 words produces extractable content.

### 5. Section outline

H2 and H3 structure. Each section labeled with:
- Intent (answers a specific related query, supports the primary, builds entity trust, drives conversion).
- Recommended word count.
- Required content elements (Q&A, table, comparison, FAQ).

### 6. Required Q&A

A list of specific questions the page must answer verbatim. For each:
- The question (phrased the way a customer would ask it).
- The recommended answer (1 to 2 sentences, plain language, specific facts).
- A note marking it as an "AI extraction sentence" — these are the sentences that get pulled.

A standard dealer page has 5 to 8 required Q&A. A FAQ-style page has 15 to 25.

### 7. Entity reinforcement

The brief specifies:
- Dealership name mentions: where and how often (typically: H1, opening paragraph, first H2, conclusion, schema).
- Brand mentions: which brands and how often (typically: each appearance of the brand name should be the OEM-canonical form, e.g., "Buick" not "buick", "GMC" not "Gmc").
- Location mentions: city, county, surrounding area names. Frequency should feel natural, not stuffed.
- People to name: dealer principal, service manager, GM, if appropriate. Names humanize the entity for AI engines.
- Awards: recent OEM awards (Mark of Excellence, President's Award, etc.) referenced once when relevant.

### 8. Internal links

3 to 5 internal links. For each:
- Anchor text recommendation (specific, descriptive, not "click here").
- Target URL.
- Why this link matters: topical authority, conversion path, entity reinforcement, sitemap depth.

Standard internal links for dealer pages:
- A relevant inventory page (SRP or VDP cluster).
- The service page or a service Q&A.
- The financing or trade-in page.
- The location/about page.

### 9. External citations

1 to 3 authoritative external sources. AI engines trust pages that link to real sources. For each:
- Anchor text and URL.
- Why citing matters.

Standard external citations for dealer pages:
- OEM specifications page for any model mentioned (e.g., gmc.com/trucks/sierra-1500).
- NHTSA safety data when discussing safety.
- IIHS ratings when discussing crash testing.
- EPA fuel economy when discussing MPG.
- Trade publication article when referencing industry context.

The brief never recommends citing a competitor dealer page. Citations are research authorities, not competition.

### 10. Schema markup spec

Which schema types to apply, what fields are required, and where to place them. Defaults by page type:

- Model guide: Article + Vehicle (if a specific model is the subject)
- Service guide: Service + FAQPage
- Buying help / FAQ: FAQPage
- Comparison: Article + Product
- Financing guide: FinancialProduct (where applicable) + Article
- Local landing page: AutoDealer + LocalBusiness
- General blog post: Article + Author

Always include `mainEntity` properly. Always include `author` and `publisher`. Always validate in the Rich Results Test before publishing.

### 11. Image specs

The brief specifies:
- Number of images (typically 2 to 5).
- Image type for each (hero, product, service in action, staff portrait, comparison chart).
- Alt text pattern. Example: "GMC Sierra Denali AT4X towing a boat trailer at Example GMC Dealer in [City, State]." Specific, descriptive, includes brand and dealership.
- Filename recommendations. Example: `gmc-sierra-denali-towing-example-dealer.jpg` (descriptive, hyphenated, dealer-suffixed).
- Source preference: OEM stock (for product), dealer-shot (for service and staff), licensed stock (avoid generic stock when possible).

### 12. Length, tone, and DO NOTs

**Length target.** Most dealer AEO pages perform best at 1,200 to 1,800 words. FAQ-style: 800 to 1,500. In-depth model guide: 1,800 to 2,800. Avoid ultra-long (over 3,500) because extraction gets harder.

**Tone.** Plain language. Conversational. Direct. No slogans. No superlatives without evidence.

**DO NOT list (3 bullets, the easiest ways to ruin the page for AEO):**

For most dealer pages, the standard "do not" list:
- Do not lead with a marketing slogan in the first 100 words.
- Do not use phrases like "premier", "leading", "the best", "your one-stop shop", "trusted by thousands".
- Do not bury answers inside long marketing paragraphs. Use Q&A blocks.

Customize this list per brief if the page has a specific failure mode (e.g., for comparison pages: "Do not write a paragraph balancing both options. Pick the answer.")

---

## Citation rules

A few specific rules that govern when and how to cite.

**Cite the OEM for specs.** Any specification (towing capacity, payload, fuel economy, dimensions) should link to the OEM page. AI engines trust spec citations.

**Cite government data for safety and economy.** NHTSA for crash safety, IIHS for crashworthiness, EPA for fuel economy.

**Cite editorial publications for context.** When the brief involves model history, industry trends, or comparative analysis, an Auto News, Car and Driver, Edmunds, or Kelley Blue Book citation strengthens the page.

**Do not cite competitor dealers.** Use the OEM, the manufacturer, or independent editorial sources instead.

**Do not over-cite.** Two to three high-authority citations is the sweet spot. More than five looks padded.

**Never invent a citation.** If the user has not confirmed a source, the brief flags `[CONFIRM]` rather than inventing.

---

## Common page failure modes

The most common ways dealer pages fail at AEO. Every brief should explicitly prevent these.

**Marketing-prose intro.** First 100 words are a slogan. AI engines extract nothing. Fix: opening 100 words written into the brief.

**Generic content not tied to the dealer.** A "What is a brake job?" article that could be on any dealer site. AI engines do not cite generic content because it does not tie to a specific entity. Fix: entity reinforcement requirement throughout.

**Q&A without schema.** Questions and answers in HTML without FAQPage schema. Half the AEO benefit lost. Fix: schema spec includes FAQPage.

**Buried answers.** The actual answer to the query is in paragraph 4 of section 6. AI engines fail to extract it. Fix: answer-first structure, with Q&A blocks.

**Citation-free pages.** No external sources cited. AI engines weight cited pages higher. Fix: external citation requirement in every brief.

**Stale dates.** Published 2022, never updated, still mentions 2023 models. AI engines deprioritize stale content. Fix: brief includes maintenance cadence (every 90 days, or on each model-year change).

**Spanish content abandoned.** Dealer has a Spanish section but only in 5 pages and nothing AEO-optimized. Fix: bilingual mode triggered when dealer has a Spanish audience.

---

## Quality bar checklist for the finished brief

Before delivering the brief to the user, verify:

- [ ] The first 100 words answer the primary query directly.
- [ ] At least 5 required Q&A are specified with verbatim answers.
- [ ] At least 2 external citations are specified with URLs.
- [ ] Schema markup spec is included with required fields.
- [ ] Internal links are specified with anchor text.
- [ ] Image specs include alt text patterns.
- [ ] Word count target is justified.
- [ ] The DO NOT list flags page-specific failure modes.
- [ ] Entity reinforcement requirements are explicit (which mentions, where, how often).
- [ ] No fabricated dealer facts; placeholders marked `[CONFIRM]` where needed.

If any check fails, fix the brief before output.

See PATTERNS.md for the page-type templates that get applied.
