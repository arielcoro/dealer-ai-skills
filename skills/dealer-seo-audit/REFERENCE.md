# Dealer SEO Audit — Reference Framework

The 10-dimension framework, scoring methodology, and dealer-specific overlays. SKILL.md references this file. Read it before running any audit.

Maximum score: 100 points across 10 dimensions, weighted by impact on dealer search outcomes.

---

## Dimension weights

| # | Dimension | Weight |
| --- | --- | --- |
| 1 | Crawlability and indexation | 12 |
| 2 | On-page basics (title, meta, H1) | 14 |
| 3 | Heading structure and content depth | 10 |
| 4 | Keyword targeting and cannibalization | 14 |
| 5 | URL structure | 5 |
| 6 | Internal linking and architecture | 10 |
| 7 | Local SEO | 10 |
| 8 | Inventory feed SEO (VDPs and SRPs) | 10 |
| 9 | Hreflang and bilingual SEO (when applicable) | 8 |
| 10 | E-E-A-T and content quality | 7 |
| | **Total** | **100** |

When the dealer is not bilingual, Dimension 9's 8 points are reallocated: 4 to Dimension 2, 4 to Dimension 4 (where on-page and cannibalization issues dominate non-bilingual sites).

---

## Bands

**90 to 100. A.** Excellent. Top decile of dealer sites for traditional Google SEO. Foundation is strong; focus shifts to authority building and content depth.

**80 to 89. B.** Good. Solid foundation with addressable gaps. Quick wins available within 30 days.

**70 to 79. C.** Average. Most dealer sites land here. Multiple operational gaps. 60 to 90 days of focused work produces meaningful ranking lift.

**60 to 69. D.** Below average. Significant on-page or indexation issues. Vendor escalation likely required. 90 to 180 days for meaningful improvement.

**Below 60. F.** Critical. Fundamental SEO issues blocking ranking. Foundation rebuild required before content or link investments compound.

---

## Dimension 1. Crawlability and indexation (12 points)

The foundation of being found at all.

### 1.1 Robots.txt (2 pts)

- robots.txt exists, is valid, and does not Disallow critical paths (/, /new-vehicles/, /service/, /used-vehicles/, /finance/): **2 pts**
- Blocks critical paths: **0 pts**
- Missing or malformed: **0 pts**

### 1.2 XML sitemap (2 pts)

- Exists at /sitemap.xml or per-section sitemaps, returns 200, submitted in GSC, last fetched in the last 7 days: **2 pts**
- Exists but stale or not submitted: **1 pt**
- Missing: **0 pts**

### 1.3 Indexation coverage (3 pts)

GSC Coverage report: percent of submitted URLs indexed.

- 95%+ indexed: **3 pts**
- 80% to 95%: **1 pt**
- Below 80%: **0 pts**

### 1.4 Noindex audit (2 pts)

Sample 10 important pages. Check for `<meta name="robots" content="noindex">` or X-Robots-Tag headers.

- No important pages noindexed: **2 pts**
- One important page noindexed accidentally: **1 pt**
- Multiple noindexed: **0 pts**

### 1.5 Canonicalization (2 pts)

- Every page has a self-referencing canonical (or correct cross-page canonical for duplicates): **2 pts**
- Some pages missing canonicals: **1 pt**
- Widespread canonical issues (cross-language, point-to-home): **0 pts**

### 1.6 Redirect chains and soft 404s (1 pt)

- No redirect chains beyond one hop; no soft 404s in GSC: **1 pt**
- Multiple issues: **0 pts**

---

## Dimension 2. On-page basics (14 points)

The fundamentals every page must get right.

### 2.1 Title tag uniqueness and quality (5 pts)

Sample audited pages. Check titles for:
- Uniqueness across the sample
- Primary keyword near the beginning
- 50-60 characters
- Dealership name + city included
- Not auto-generated boilerplate

Scoring (out of 5 across sampled pages):
- All pages pass: **5 pts**
- 70% to 90% pass: **3 pts**
- Below 70%: **0 to 2 pts**

### 2.2 Meta description uniqueness and quality (4 pts)

Same audit pattern for meta descriptions:
- Unique per page
- 150-160 characters
- Includes primary keyword
- Compelling and click-worthy
- Not auto-generated

Scoring (out of 4):
- All pages pass: **4 pts**
- 70% to 90% pass: **2 pts**
- Below 70%: **0 to 1 pts**

### 2.3 H1 per page (3 pts)

Every audited page should have exactly one H1, descriptive of the page content, containing the primary keyword.

- All pages have one descriptive H1 with keyword: **3 pts**
- Some pages have multiple H1s or weak H1s: **1 pt**
- Many pages missing H1 or using H1 for styling only: **0 pts**

### 2.4 Title-H1-URL alignment (2 pts)

For each audited page, the title, H1, and URL should align on the primary topic. Misalignment indicates confused intent.

- All pages aligned: **2 pts**
- Some misalignment: **1 pt**
- Widespread misalignment: **0 pts**

---

## Dimension 3. Heading structure and content depth (10 points)

### 3.1 Heading hierarchy (3 pts)

- Logical hierarchy on audited pages (H1 → H2 → H3, no skipped levels): **3 pts**
- Some skipped levels (H1 → H3): **1 pt**
- Headings used purely for styling: **0 pts**

### 3.2 Content depth on primary pages (4 pts)

Primary pages (home, model landing pages, service, finance, key buying-help pages) should have:
- 800+ words for content-led pages
- Answers to common customer questions
- Specifics over generic claims

- Strong depth across audited pages: **4 pts**
- Mixed: **2 pts**
- Thin content widespread: **0 pts**

### 3.3 Keyword in first 100 words (3 pts)

Primary keyword should appear within the first 100 words of each primary page.

- All sampled pages comply: **3 pts**
- Some compliant: **1 pt**
- Widespread misses: **0 pts**

---

## Dimension 4. Keyword targeting and cannibalization (14 points)

**The dealer-specific killer.** Most dealer sites cannibalize themselves with multiple pages targeting the same queries.

### 4.1 Keyword mapping per page (4 pts)

Each audited page should have a clear primary keyword target, evidenced by title, H1, and content.

- All pages have clear keyword targets: **4 pts**
- Some pages target multiple primary keywords (split focus): **2 pts**
- Many pages lack clear targets: **0 pts**

### 4.2 Cannibalization audit (6 pts)

Identify pages competing for the same primary query. Common dealer patterns:

- /new-vehicles/, /new-inventory/, /new-cars/ all targeting "new cars [city]"
- /GMC/, /trucks/, /sierra/, /new-vehicles/ all competing for "Sierra [city]"
- City-specific landing pages duplicating each other
- Service page + service-specials page + service-by-brand pages overlapping
- Old blog posts competing with newer pillar pages

Score:
- No cannibalization detected: **6 pts**
- 1 to 3 cannibalization clusters: **3 pts**
- 4+ clusters: **0 pts**

The skill's most valuable output for most dealer sites lives here. Recommend specific consolidation: redirect, canonical, or content merge.

### 4.3 Search intent match (4 pts)

For each audited page's primary keyword, does the page satisfy the search intent?

- A page targeting "GMC Sierra price near me" should answer pricing — not list inventory only.
- A page targeting "how long does a brake job take" should answer time — not just sell brake service.

Score:
- All audited pages match intent: **4 pts**
- Some misalignment: **2 pts**
- Widespread mismatch: **0 pts**

---

## Dimension 5. URL structure (5 points)

### 5.1 URL readability (2 pts)

- URLs are descriptive, hyphenated, lowercase, no unnecessary parameters: **2 pts**
- Mixed quality: **1 pt**
- Heavy parameter use, session IDs, uppercase: **0 pts**

### 5.2 URL consistency (2 pts)

- Single canonical version (HTTPS, www or non-www, trailing slash convention) enforced site-wide: **2 pts**
- Inconsistencies: **0 pts**

### 5.3 No unnecessary URL parameters (1 pt)

- Faceted SRP URLs (filtered inventory) properly handled (canonical to base SRP or noindex'd): **1 pt**
- Faceted parameters indexed and cannibalizing: **0 pts**

---

## Dimension 6. Internal linking and architecture (10 points)

### 6.1 Orphan pages (3 pts)

Orphan = no internal links pointing to it.

- No orphan pages in critical sections (inventory, service, finance): **3 pts**
- Some orphans: **1 pt**
- Many orphans, including primary pages: **0 pts**

### 6.2 Click depth (3 pts)

Important pages reachable within 3 clicks from home.

- All primary pages within 3 clicks: **3 pts**
- Some buried: **1 pt**
- Many buried: **0 pts**

### 6.3 Internal anchor text quality (2 pts)

- Descriptive anchor text on internal links (not "click here", not "read more"): **2 pts**
- Mixed: **1 pt**
- Mostly generic anchors: **0 pts**

### 6.4 Pillar-page architecture (2 pts)

For each brand the dealer sells, is there a brand pillar page that links to all model pages, service for that brand, financing relevant to that brand?

- Yes for all brands: **2 pts**
- Partial: **1 pt**
- No pillar architecture: **0 pts**

---

## Dimension 7. Local SEO (10 points)

### 7.1 GBP completeness (3 pts)

- GBP claimed, complete (hours, brand portfolio, services, photos, posts in last 30 days): **3 pts**
- Mostly complete: **1 pt**
- Unclaimed or sparse: **0 pts**

### 7.2 NAP consistency (3 pts)

Name, address, phone identical across:
- Website
- GBP
- OEM locator
- Apple Maps, Bing Places, Yelp
- BBB, chamber of commerce
- DealerRater, Cars.com profile

- All sources identical: **3 pts**
- 1-2 discrepancies: **1 pt**
- Multiple discrepancies: **0 pts**

### 7.3 Location page hierarchy (2 pts)

For multi-rooftop dealers or dealers targeting multiple cities, are location-specific pages built with unique content (not boilerplate)?

- Yes, unique per location: **2 pts**
- Boilerplate or thin: **0 pts**
- N/A (single rooftop, single market): full **2 pts** by default

### 7.4 "Near me" keyword targeting (1 pt)

Relevant pages (service, inventory, finance) target "[topic] near [city]" or "[topic] near me" variants.

- Yes: **1 pt**
- No: **0 pts**

### 7.5 Local citations (1 pt)

Chamber, BBB, local press citations existing.

- Yes: **1 pt**
- No: **0 pts**

---

## Dimension 8. Inventory feed SEO (10 points)

The dealer-specific dimension. Inventory feed SEO is the single biggest SEO surface dealers have and the most under-optimized.

### 8.1 VDP title tag pattern (2 pts)

Every VDP should have a title pattern like:
`[Year] [Make] [Model] [Trim] for sale in [City] | [Dealership Name]`

- Pattern consistent and complete: **2 pts**
- Partial: **1 pt**
- Generic or missing: **0 pts**

### 8.2 VDP meta description uniqueness (2 pts)

- Each VDP has a unique meta description based on the specific vehicle: **2 pts**
- Auto-generated boilerplate identical across VDPs: **0 pts**

### 8.3 Vehicle schema completeness (3 pts)

Already covered in dealer-site-score and dealer-aeo-audit; this dimension validates from an SEO angle:

- Every VDP has Vehicle schema with VIN, brand, model, modelDate, mileageFromOdometer, fuelType, Product wrapper with offers: **3 pts**
- Schema present but missing fields: **1 pt**
- No Vehicle schema: **0 pts**

### 8.4 No duplicate descriptions across VDPs (2 pts)

Sample 5 random VDPs. Check description uniqueness.

- All unique: **2 pts**
- Some boilerplate, some unique: **1 pt**
- All identical or near-identical: **0 pts**

### 8.5 Aged inventory handling (1 pt)

Sold vehicles or aged inventory beyond 60 days should be handled appropriately (noindex, redirect to similar, or removed).

- Aged inventory handled cleanly: **1 pt**
- Aged inventory remaining indexed and creating thin/sold pages: **0 pts**

---

## Dimension 9. Hreflang and bilingual SEO (8 points)

**Only audited when the dealer serves a Spanish-speaking audience.** If not bilingual, the 8 points are reallocated to Dimensions 2 (+4) and 4 (+4).

See HREFLANG.md for the full audit framework. Summary scoring:

### 9.1 Hreflang implementation present (3 pts)

- Implemented via HTML link, HTTP header, or sitemap: **3 pts**
- Missing entirely: **0 pts**

### 9.2 Hreflang correctness (3 pts)

- Self-referencing entries present, reciprocal links present, valid ISO codes, x-default specified: **3 pts**
- Some implementation but with errors: **1 pt**
- Multiple errors (invalid codes, missing reciprocity, conflicting with canonical): **0 pts**

### 9.3 Spanish content quality (2 pts)

- Spanish pages have fully translated content (not just navigation chrome): **2 pts**
- Boilerplate-only translation: **1 pt**
- No Spanish content where claimed: **0 pts**

---

## Dimension 10. E-E-A-T and content quality (7 points)

### 10.1 Dealer principal and staff visibility (2 pts)

- Dealer principal bio with credentials, staff page with named individuals and bios: **2 pts**
- Partial: **1 pt**
- Generic "Team" page or anonymous: **0 pts**

### 10.2 OEM credentials visible (2 pts)

OEM awards (Mark of Excellence, President's Award, Mark of Quality, etc.) displayed with date.

- Yes, current: **2 pts**
- Stale awards (2+ years old as the most recent): **1 pt**
- None displayed: **0 pts**

### 10.3 Trust signals (2 pts)

- Privacy policy, terms, return/exchange policy, satisfaction guarantee, contact information visible site-wide, HTTPS enforced: **2 pts**
- Some missing: **1 pt**
- Multiple missing: **0 pts**

### 10.4 Author attribution on content (1 pt)

Blog posts and editorial content have author attribution (named human), not "Admin" or "Marketing Team."

- Yes: **1 pt**
- No: **0 pts**

---

## How to compute the final score

Sum every check. Total is out of 100 (or out of 100 when Dimension 9 is reallocated for non-bilingual).

Apply band thresholds to determine letter grade.

---

## Dealer-specific patterns common to flag

After running this audit on enough dealer sites, certain patterns repeat. Surface these proactively when detected.

**Cannibalization across model and inventory pages.** Most dealer sites have 3-5 pages competing for the same primary query. Consolidation produces fastest ranking lift.

**Stale inventory URLs.** VDPs for sold vehicles remain indexed for weeks or months, creating thin-content pages that drag down site-wide quality signal. Recommend automated noindex or 301 to similar inventory at sale.

**Generic meta descriptions site-wide.** Many platforms generate identical meta descriptions across thousands of pages. High-leverage fix.

**No hreflang on bilingual sites.** Most bilingual dealer sites either skip hreflang entirely (suppressing Spanish indexation) or implement it wrong. Significant first-mover advantage available.

**Single H1 problem on some platforms.** Some dealer platforms generate multiple H1s on inventory pages (banner + page title + vehicle title). Confusing to Google.

**Title tag truncation on long dealership names.** Dealers with long names (e.g., "Bob Smith Buick GMC Chrysler Jeep Dodge Ram Cadillac") often have titles that truncate the model and city information that actually rank. Recommend short brand variant.

**Local SEO neglect.** Many dealers have unclaimed GBP, inconsistent NAP, or missing services in GBP. Highest-ROI quick win for local queries.

**Service-vs-sales SEO conflicts.** Dealer sites often have service pages that compete with sales pages for the same brand keywords. Different intent; should be different pages with clear separation.

See CHECKS.md for tool-by-tool verification commands and HREFLANG.md for bilingual deep-dive.
