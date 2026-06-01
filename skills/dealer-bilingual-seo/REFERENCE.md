# Dealer Bilingual SEO — Framework Reference

The decision tree, audit framework, and content prioritization for Spanish-language dealer SEO in the US market.

This is the authoritative framework. SKILL.md and IMPLEMENTATION.md reference this file.

---

## The architecture decision

Three options. One default answer for US dealers.

### Option 1. Subfolder (default, recommended)

URL pattern: `dealersite.com/es/`

**Pros:**
- Inherits domain authority from the parent domain
- Single GA4 property, single GSC property
- Easier hreflang implementation
- No DNS or SSL complexity
- Simpler analytics attribution

**Cons:**
- Requires CMS or platform support for the path-based routing
- Shared CMS may complicate translation workflow

**When to use:** Every US dealer, almost without exception. This is the default. Recommend this.

### Option 2. Subdomain

URL pattern: `es.dealersite.com`

**Pros:**
- Can be hosted independently (useful if CMS does not support subfolder routing)
- Independent CMS possible (useful if the dealer wants to use a different CMS for Spanish)

**Cons:**
- Treated by Google as a separate site for ranking purposes; domain authority does not transfer fully
- Splits link equity
- Two GSC properties, potentially two GA4 properties
- Harder to maintain hreflang
- More complex analytics

**When to use:** Only when the website platform structurally cannot support `/es/` subfolder routing. This is rare. Most dealer platforms (Dealer.com, DealerOn) support subfolders.

### Option 3. Country-code TLD (ccTLD)

URL pattern: `dealersite.com.mx` or `dealersite.es`

**When to use:** Never, for a US dealer serving US Hispanic buyers. ccTLDs target the country the TLD is associated with. US Hispanic buyers search on the .com. Recommending a ccTLD for a US dealer is a misunderstanding of how Google geo-targets.

**Decision:** Always recommend Option 1 (subfolder) unless the dealer platform structurally cannot support it. If asked to consider Option 2 or 3, explain the trade-offs and recommend against them in almost all cases.

---

## The hreflang spec

### Tags required per page

For an English page at `dealersite.com/inventory/new/`:

```html
<link rel="alternate" hreflang="en-US" href="https://dealersite.com/inventory/new/" />
<link rel="alternate" hreflang="es-US" href="https://dealersite.com/es/inventario/nuevos/" />
<link rel="alternate" hreflang="x-default" href="https://dealersite.com/inventory/new/" />
```

For the corresponding Spanish page at `dealersite.com/es/inventario/nuevos/`:

```html
<link rel="alternate" hreflang="en-US" href="https://dealersite.com/inventory/new/" />
<link rel="alternate" hreflang="es-US" href="https://dealersite.com/es/inventario/nuevos/" />
<link rel="alternate" hreflang="x-default" href="https://dealersite.com/inventory/new/" />
```

### Five mandatory rules

1. **Self-referencing entry.** Every page must include a hreflang tag pointing to itself.
2. **Reciprocal links.** Every page in language A must reference page in language B AND vice versa. Missing reciprocal is the most common dealer hreflang error.
3. **Valid ISO codes.** Use `en-US` and `es-US`. Do not use `en`, `es`, or `es-MX` for a US dealer. The country code matters.
4. **x-default required.** Every set must include an x-default pointing to the fallback language (usually English).
5. **Target URLs return 200.** Every hreflang target must return HTTP 200. If a Spanish version is incomplete and some pages do not exist yet, do not point hreflang at 404 pages.

### Implementation method choice

Two options:

**HTML link tags in `<head>`:** Easier to debug. Each page declares its alternates. Recommended for sites under 1000 pages.

**Sitemap-based hreflang:** Cleaner for large inventory-driven sites. The XML sitemap includes `<xhtml:link>` entries for each URL with its alternates. Required for sites where adding tags to every page is impractical.

For a dealer site, sitemap-based is the right answer because the inventory feed produces thousands of VDPs and SRPs that must each carry hreflang. The dealer CMS rarely supports per-VDP HTML tag injection.

---

## Content prioritization

Four tiers. Translate top to bottom.

### Tier 1. Must translate (Week 1 to 4)

These pages drive the highest local-intent organic traffic and conversion.

- Home page
- Primary inventory landing pages: `/inventory/new/`, `/inventory/used/`, `/inventory/cpo/`
- The 5 highest-traffic SRP filter pages (e.g., new Chevrolet Silverado, used Buick Encore)
- The 10 highest-traffic VDPs (top sellers)
- Contact page
- Location page (with map, hours, NAP)
- Service appointment page
- Finance / lease specials landing page
- Trade-in valuation page

### Tier 2. Should translate (Week 5 to 12)

These pages support the buyer journey but are not top-of-funnel.

- About page
- Service department landing page
- Parts department landing page
- Lease specials detail pages
- New vehicle model landing pages (one per model line for the OEM)
- Financing application page (if regulatory permits Spanish; verify)
- "Why buy from us" / sales differentiators
- Insurance and warranty pages (with regulatory check)

### Tier 3. Nice to translate (Beyond Week 12)

- Blog / news content
- OEM-supplied marketing content
- Community involvement pages
- Long-form comparison content (translate using dealer-comparison-page-builder Spanish output mode)
- FAQ pages

### Tier 4. Do not translate

- Legal disclaimers that are required in English by regulation (state-specific F&I disclosures)
- Third-party embedded iframes (KBB widgets, etc.) that cannot be translated
- OEM-supplied warranty boilerplate that is OEM-legal in English

**Decision rule:** translate where the local intent in Spanish exceeds the operational cost. Spanish-language buyers searching for "concesionario Buick GMC en [city]" should land on a Spanish page that ranks. Spanish-language buyers searching for "Buick GMC OnStar terms" can land on the English page; the regulatory copy must be English anyway.

---

## The 10-dimension Spanish SEO audit framework

Apply to Mode A (audit). 100 points total.

### Dimension 1. Architecture (10 pts)
- 10: Subfolder `/es/` with proper routing.
- 5: Subdomain `es.dealer.com` with proper hreflang.
- 0: Country-code TLD, OR Google-translated iframe, OR no Spanish version at all.

### Dimension 2. Hreflang implementation (12 pts)
- 12: All five mandatory rules satisfied. Self-referencing, reciprocal, valid codes, x-default, all 200s. Verified via screaming frog or Google's URL inspector.
- 6: Mostly correct, one or two rule violations.
- 0: Hreflang missing entirely, OR uses wrong codes, OR points to 404s.

### Dimension 3. URL pattern (8 pts)
- 8: Spanish URLs are translated (`/es/inventario/`, `/es/servicio/`, etc.), not English clones (`/es/inventory/`).
- 4: URLs use English slugs but Spanish content.
- 0: Spanish content lives at English URLs with no slug differentiation.

### Dimension 4. Content quality (12 pts)
- 12: All Tier 1 content human-translated or natively authored. Reads as natural Spanish (no obvious machine artifacts, calques, or English idioms).
- 6: Tier 1 translated but reads as machine translation with minimal human edit.
- 0: Pure Google Translate output, OR Spanish version missing Tier 1 content.

### Dimension 5. Content coverage (10 pts)
- 10: All Tier 1 plus most Tier 2 translated.
- 5: All Tier 1 translated, no Tier 2.
- 0: Tier 1 incomplete.

### Dimension 6. Spanish-language metadata (10 pts)
- 10: Page titles, meta descriptions, OG tags, alt text all in Spanish with localized keywords.
- 5: Some metadata translated but inconsistent.
- 0: Metadata still in English on Spanish pages.

### Dimension 7. Spanish-language schema (8 pts)
- 8: AutoDealer schema includes Spanish-language descriptions and offers. Vehicle schema present on Spanish VDPs with Spanish descriptions. Hreflang properly referenced in schema.
- 4: Schema present but English text on Spanish pages.
- 0: No schema, OR schema missing on Spanish pages entirely.

### Dimension 8. Spanish keyword targeting (10 pts)
- 10: Spanish pages target Spanish queries researched from ahrefs / SEMrush / Google Keyword Planner with Spanish-language seed terms and US location targeting. Localized for the dealer's metro.
- 5: Spanish pages exist but were not built from Spanish keyword research; they're translations of English-keyword-targeted pages.
- 0: No Spanish keyword targeting evident.

### Dimension 9. Internal linking and navigation (10 pts)
- 10: Spanish version has its own navigation in Spanish. Language toggle is clearly visible. Internal links from Spanish pages point to other Spanish pages. No accidental cross-language link leaks.
- 5: Language toggle present but navigation is inconsistent.
- 0: Spanish pages have English navigation, OR no language toggle visible.

### Dimension 10. OEM Spanish program integration (10 pts)
- 10: OEM Spanish program (GM en Español, Ford Espanol, etc.) is either correctly leveraged at the brand level OR explicitly overridden, with no duplicate-content or canonical conflict.
- 5: OEM Spanish program present but conflicts with dealer's own Spanish pages on some URLs.
- 0: OEM Spanish program is competing with the dealer's own Spanish version, creating duplicate-content issues OR Google is choosing the OEM page over the dealer's.

---

## Letter grade bands

- 90 to 100: **A.** Top-decile bilingual dealer site.
- 80 to 89: **B.** Strong with optimization headroom.
- 70 to 79: **C.** Average. Material opportunity.
- 60 to 69: **D.** Below average. Significant remediation needed.
- Below 60: **F.** Critical. Spanish presence is hurting overall organic performance.

---

## The remediation decision tree (Mode C)

When the user has a broken or half-built Spanish site, identify the issue pattern:

### Pattern A. Google-translated iframe or third-party widget

**Symptom:** Spanish content is served by a third-party translation widget (Google Translate widget, Smartling, etc.) that injects content client-side.

**Severity:** Critical. Search engines do not index client-side-rendered content reliably; the Spanish pages do not exist as crawlable pages.

**Remediation:** Replace with server-rendered Spanish pages at `/es/` URLs. Implement hreflang properly. Estimate: 4 to 8 weeks for Tier 1 content.

### Pattern B. Hreflang missing or broken

**Symptom:** Spanish pages exist but Google indexes them inconsistently. The English page sometimes outranks the Spanish page in Spanish queries.

**Severity:** High.

**Remediation:** Audit hreflang against the five mandatory rules. Fix the failing rule. Implement sitemap-based hreflang if pages exceed 1000.

### Pattern C. Duplicate content

**Symptom:** Some Spanish pages serve English content (incomplete translation), or canonical tags point Spanish pages to English. GSC shows duplicate content warnings.

**Severity:** High.

**Remediation:** Audit canonicals and content. Either complete translations or remove the Spanish URL and 301 to English. Do not leave half-built Spanish pages indexed.

### Pattern D. OEM-program conflict

**Symptom:** OEM Spanish-language program serves at the dealer's URL or at a related URL, and competes with the dealer's own Spanish pages. Search results sometimes show the OEM page, sometimes the dealer page.

**Severity:** Medium.

**Remediation:** Coordinate with the OEM. Often the OEM Spanish-language content can be canonicalized to the dealer's version, or the dealer's version can be canonicalized to the OEM. Pick one. Most dealers should canonicalize to their own version when local intent matters.

### Pattern E. Wrong hreflang codes

**Symptom:** Hreflang uses `es-MX`, `es`, or just `mx`.

**Severity:** High.

**Remediation:** Replace with `es-US`. The country code matters for US dealers.

### Pattern F. Spanish pages at English URLs

**Symptom:** `/es/inventory/`, `/es/contact/` — Spanish content but English URL slugs.

**Severity:** Low to Medium.

**Remediation:** Translate URL slugs to Spanish (`/es/inventario/`, `/es/contacto/`). Set up 301 redirects from old English-slug URLs to new Spanish-slug URLs. Update internal navigation, sitemap, and hreflang.

---

## Hispanic market sizing

For Mode B (design), the skill needs to size the opportunity. Use these signals:

**Market signal 1: Census Hispanic share of metro.** Pull from US Census American Community Survey. Markets above 20% Hispanic share are clear opportunities. 30%+ is the high-leverage zone (Miami, Houston, Los Angeles, San Antonio, Albuquerque, El Paso, McAllen, Bakersfield, Phoenix, Tucson).

**Market signal 2: Spanish-language search volume for autos.** Use Google Keyword Planner with Spanish seed terms and US geo-targeting. Pull volumes for: `concesionario [OEM]`, `autos usados`, `comprar [OEM]`, `[OEM] en [city]`. If Spanish search volume is more than 10% of English equivalents, the market is worth serving.

**Market signal 3: Competitor coverage.** Search Spanish-language queries in incognito with the dealer's metro location set. Note how many results are OEM Spanish pages, how many are competitor dealer Spanish pages, and how many are third-party (Cars.com Spanish, AutoTrader Spanish). The fewer dealer-Spanish results, the more open the lane.

**Decision:** Recommend a full Spanish launch when at least two of three signals are strong. Recommend a pilot (Spanish home + 5 SRPs + location page + GBP Q&A) when one signal is strong. Recommend deferring when none.

---

## The 90-day Mode B roadmap

### Week 1 to 2: Setup
- Architecture decision (subfolder confirmed)
- URL pattern decision (Spanish slugs confirmed)
- Translation vendor selected (native-speaker auto-industry-aware preferred)
- Content prioritization tier list confirmed
- Hreflang implementation method selected (sitemap-based for dealer inventory volume)
- Schema spec confirmed

### Week 3 to 6: Tier 1 build
- Translate home, inventory landing pages, location, contact, service appointment, finance landing
- Translate top 5 SRP filter pages
- Translate top 10 VDPs (manual; rest will be programmatic from inventory feed)
- Implement hreflang
- Implement Spanish schema
- Add language toggle to global navigation
- QA: confirm all 200s, confirm hreflang reciprocal, confirm internal links

### Week 7 to 10: Tier 2 build
- Translate about, service department, parts, financing, lease specials, model landing pages
- Build Spanish-language posts in GBP (Spanish content, 1 to 2 per week)
- Build Spanish Q&A pre-seed in GBP
- Configure Spanish-language event tracking in GA4

### Week 11 to 13: Programmatic inventory translation
- Translate inventory feed template (Spanish VDP titles, descriptions, OG tags)
- Generate Spanish VDPs and SRPs at scale via inventory feed
- Confirm hreflang on every VDP / SRP via sitemap-based hreflang

### Ongoing: Monitor
- Spanish keyword rankings in GSC
- Spanish-language traffic and conversion in GA4
- Spanish-language reviews and Q&A (response within 48 hours)
- GBP post cadence in Spanish

---

## GBP and reviews strategy

### Should the dealer operate two GBPs (one English-facing, one Spanish-facing)?

**Default answer: no.** A single GBP with bilingual content in posts, Q&A, and reviews is the right architecture. Operating two GBPs creates NAP duplication, splits reviews, and risks suspension.

**Exception:** very large dealer groups with a separately-branded Hispanic-marketing arm that operates a distinct rooftop or BDC. Rare.

### Spanish-language posts in GBP

Publish at least 1 post per week in Spanish in addition to English posts. Posts in Spanish surface to Spanish-locale searchers.

### Spanish-language Q&A

Pre-seed at least 3 Spanish-language FAQs in the Q&A section. Respond to all Spanish-language customer questions in Spanish within 48 hours.

### Spanish-language reviews

Respond to Spanish-language reviews in Spanish. Use the customer's name. Reference the specific vehicle and employee where appropriate.

### Spanish review solicitation

Train BDC and service-floor staff to ask for reviews in the language the customer prefers. The Spanish-language review request should be in Spanish (a text message or email template in Spanish, with the review link). Most dealer review-request systems support multi-language templates; verify.

---

## The defensibility argument

This skill represents IP that is structurally hard for a competitor to replicate:

1. Spanish-language SEO for autos in the US is underserved by competing dealer agencies.
2. Most competing agencies do not have a native-Spanish-speaker auto-industry-aware partner.
3. The OEM Spanish-language programs do not optimize for local rooftop intent and the dealers know it.
4. Hispanic auto buyer behavior research is largely behind paywalls or in OEM-internal documents.
5. The few specialists in Spanish-language auto marketing are concentrated at OEM corporate or at very large multicultural agencies serving Tier 1 brand campaigns, not dealer-level.

A dealer who invests in Spanish-language SEO in a market like Phoenix, Houston, Miami, or Los Angeles can win local-pack and SRP rankings that competitors cannot displace with English-only content. The compounding effect over 12 to 24 months is significant.
