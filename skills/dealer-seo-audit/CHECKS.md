# Dealer SEO Audit — Technical Checks

Specific tools, commands, and verification steps for each dimension. SKILL.md and REFERENCE.md reference this file.

Replace `[domain]` with the dealer's primary domain. Replace `[page-url]` with specific page URLs being audited.

---

## Critical limitation: Schema detection requires JavaScript rendering

Most dealer CMS platforms (Dealer.com, DealerOn, DealerInspire) inject JSON-LD schema via client-side JavaScript. `curl` and basic `web_fetch` do not execute JavaScript and will report "no schema found" when schema is actually present.

**For accurate schema validation, use:**
1. **Google Rich Results Test** — https://search.google.com/test/rich-results (renders JavaScript)
2. **Browser DevTools** — load the page in Chrome, open DevTools console, run: `document.querySelectorAll('script[type="application/ld+json"]')`
3. **Screaming Frog** — enable JavaScript rendering in crawl settings

Reporting "no schema" based solely on `curl` output is a false finding. Always verify with one of the above before flagging.

---

## Dimension 1. Crawlability and indexation

### 1.1 robots.txt

```bash
curl -sL https://[domain]/robots.txt
```

Check for:
- Returns 200
- No `Disallow: /` under `User-agent: *`
- No Disallow of critical paths (/new-vehicles/, /used-vehicles/, /service/, /finance/, /)
- Sitemap reference present

### 1.2 sitemap.xml

```bash
curl -sIL https://[domain]/sitemap.xml | head -3
curl -sL https://[domain]/sitemap.xml | head -30
```

Verify:
- Returns 200
- Contains current `<lastmod>` dates
- References real, indexable URLs

Check GSC: Sitemaps section. Last fetched within 7 days.

### 1.3 Indexation coverage

**Tool:** Google Search Console → Coverage report

Ask the user to share:
- Total submitted URLs
- Indexed count
- Excluded count with reasons (noindex, canonical, duplicate, not found)

Calculate: indexed / submitted as a percentage.

### 1.4 Noindex audit

Sample 10 important pages. For each:

```bash
curl -sL https://[domain]/[page-url] | grep -i -E "noindex|nofollow"
curl -sI https://[domain]/[page-url] | grep -i "x-robots-tag"
```

Flag any important page returning noindex.

Pages to check (typical sample):
- /
- /new-vehicles/
- /used-vehicles/
- /certified-pre-owned/
- /service/
- /finance/
- /about/ or /staff/
- A sample VDP
- A sample model landing page
- /contact/

### 1.5 Canonicalization

```bash
curl -sL https://[domain]/[page-url] | grep -i 'rel="canonical"'
```

Verify the canonical URL:
- Self-referencing for the primary version
- Not pointing to a different language version
- Not pointing to home page
- Matches the URL the user accessed (no upper/lowercase mismatches)

Sample 10 pages. Flag inconsistencies.

### 1.6 Redirect chains and soft 404s

```bash
curl -sIL https://[domain]/[page-url] -o /dev/null -w "%{http_code} -> %{url_effective}\n"
```

For each sampled page, check the redirect chain length. More than one redirect hop is a chain.

For soft 404 detection: check GSC → Coverage → "Soft 404" filter. Real 404s should return 404 status code.

---

## Dimension 2. On-page basics

### 2.1 Title tag uniqueness

For each sampled page:

```bash
curl -sL https://[domain]/[page-url] | grep -oE "<title>[^<]+</title>"
```

Compile titles across all sampled pages. Look for:
- Duplicates
- Generic/auto-generated patterns
- Missing brand or city
- Truncation (over 60 chars)

For sites with thousands of pages, use Screaming Frog to extract titles at scale.

### 2.2 Meta description uniqueness

```bash
curl -sL https://[domain]/[page-url] | grep -oE '<meta name="description" content="[^"]+"'
```

Same audit pattern as titles. Auto-generated meta descriptions are the single most common dealer SEO issue.

### 2.3 H1 detection

```bash
curl -sL https://[domain]/[page-url] | grep -oE "<h1[^>]*>[^<]+</h1>"
```

Count H1s per page. Flag pages with zero or multiple H1s.

For JS-injected H1s (Dealer.com pattern), verify in browser DevTools or Screaming Frog with JS rendering.

### 2.4 Title-H1-URL alignment

For each sampled page, capture title, H1, and URL slug. Check that all three contain the same primary keyword.

Example of misalignment:
- URL: `/new-2026-gmc-sierra-denali-albertville-al`
- Title: "Bob Smith Buick GMC | Albertville Alabama Dealership"
- H1: "Welcome to Bob Smith Buick GMC"

URL targets Sierra Denali, but title and H1 are generic dealership pages. This is misaligned and should not be a VDP.

---

## Dimension 3. Heading structure and content depth

### 3.1 Heading hierarchy

```bash
curl -sL https://[domain]/[page-url] | grep -oE "<h[1-6][^>]*>[^<]+</h[1-6]>"
```

Verify hierarchy:
- Single H1
- H2s under H1
- H3s under H2s (not jumping H1 → H3)

### 3.2 Content depth

Manual review of primary pages. Word count:

```bash
curl -sL https://[domain]/[page-url] | sed 's/<[^>]*>//g' | wc -w
```

Note: this strips HTML and counts words, including navigation and footer. Subtract roughly 100-200 words for chrome. Primary content pages should have 800+ words of body content.

### 3.3 Keyword in first 100 words

Read the first 100 words of each primary page's body content. Verify the primary keyword appears.

---

## Dimension 4. Keyword targeting and cannibalization

### 4.1 Keyword mapping per page

For each sampled page, identify the primary keyword target (from title + H1 + URL + content focus). Build a mapping table:

| Page URL | Primary keyword | Title contains | H1 contains | URL contains |
| --- | --- | --- | --- | --- |
| /new-vehicles/ | "new cars [city]" | ✓ | ✓ | ✓ |
| /gmc/ | "GMC dealer [city]" | ✓ | ✓ | ✓ |

### 4.2 Cannibalization detection

The most valuable audit step for most dealer sites.

**Method:**
1. Use GSC Performance report. Filter by a target query.
2. Look at the "Pages" tab. If more than one page on the site ranks for the same query, you have cannibalization.
3. Repeat for each high-priority target query.

**Alternative without GSC:** Use Ahrefs or Semrush "Organic Keywords" report for the domain. Sort by query. Multiple pages ranking for the same query = cannibalization.

**Common dealer cannibalization patterns to specifically check:**

- "[brand] dealer [city]": likely competes between /, /[brand]/, /about/
- "Sierra [city]" or "[model] [city]": likely competes between /[model]/, /new-vehicles/, /trucks/
- "[brand] service [city]": likely competes between /service/, /[brand]/, /service-specials/
- "[brand] lease [city]": likely competes between /finance/, /lease/, /lease-specials/

**Consolidation recommendations per cluster:**

1. **Pick the canonical page** (the one with strongest signals and best UX).
2. **301 redirect** the duplicates to the canonical.
3. **Update internal links** to point to the canonical.
4. **Merge content** if duplicates had unique content worth preserving.

### 4.3 Search intent match

For each primary query, ask: does the ranking page answer the intent?

- "GMC Sierra price near me" intent: pricing. Page should show pricing prominently.
- "How long does an oil change take" intent: time. Page should answer time in the opening.
- "Best truck for towing 7000 lbs" intent: recommendation. Page should pick a model and explain why.

Pages that rank for queries but don't answer them get demoted. Update content to match intent.

---

## Dimension 5. URL structure

### 5.1 URL readability

Audit sample URLs against criteria:
- Lowercase
- Hyphens (not underscores)
- Descriptive (not /p?id=12345)
- No unnecessary parameters

### 5.2 URL consistency

```bash
# Test HTTP/HTTPS redirect
curl -sIL -o /dev/null -w "%{http_code}\n" http://[domain]/

# Test www/non-www redirect (test the one not in canonical)
curl -sIL -o /dev/null -w "%{http_code}\n" https://www.[domain]/

# Test trailing slash convention
curl -sIL -o /dev/null -w "%{http_code} %{url_effective}\n" https://[domain]/new-vehicles
```

Verify single canonical version is enforced.

### 5.3 Faceted SRP handling

Test filtered SRP URLs (e.g., /new-vehicles/?make=GMC&trim=Denali):

```bash
curl -sL https://[domain]/new-vehicles/?make=GMC | grep -i 'rel="canonical"'
```

Filtered SRPs should canonical to the base SRP, or be noindex'd, or robots.txt-disallowed.

---

## Dimension 6. Internal linking and architecture

### 6.1 Orphan pages

Use Screaming Frog "Orphan URLs" report (requires GSC + sitemap integration during crawl).

Alternative: check GSC → Pages → Indexed → URLs with no inbound internal links.

### 6.2 Click depth

Screaming Frog → Internal → Crawl Depth column. Filter for important pages (sample of inventory roots, service, finance, about).

Pages at click depth > 3 from home are buried.

### 6.3 Internal anchor text

Screaming Frog → Inlinks for sampled important pages. Review anchor text.

Flag anchor text like:
- "click here"
- "read more"
- "learn more"
- "this page"

Recommend descriptive replacements.

### 6.4 Pillar-page architecture

Manual check. For each brand the dealer sells:
- Is there a brand pillar page (e.g., /gmc/, /buick/)?
- Does it link to all model pages for that brand?
- Does it link to brand-specific service?
- Does it link to brand-specific financing?

If yes for all brands: full points. If partial or missing: deduct accordingly.

---

## Dimension 7. Local SEO

### 7.1 GBP completeness

Manual audit of GBP listing for the dealership:
- Claimed (no "Own this business?" prompt)
- Hours present and current
- Phone number matches website
- Brand portfolio in "Services" or relevant fields
- At least 10 photos
- At least 1 post in the last 30 days
- Service area defined
- "From the owner" description present

### 7.2 NAP consistency

Check NAP on:
1. Website footer
2. GBP
3. OEM dealer locator
4. Apple Maps (search the dealership name)
5. Bing Places (bing.com/maps)
6. Yelp
7. BBB
8. Facebook
9. Cars.com dealer profile
10. DealerRater profile

Capture each NAP. Flag discrepancies.

### 7.3 Location page hierarchy

Manual review. For dealers targeting multiple cities, check each city's landing page:
- Has unique content (not boilerplate)
- Has unique title and meta
- Has city-specific schema
- Internal links to city-specific inventory

### 7.4 "Near me" keyword targeting

Search target pages for "near me" or "near [city]" phrasing:

```bash
curl -sL https://[domain]/service/ | grep -i "near"
curl -sL https://[domain]/new-vehicles/ | grep -i "near"
```

### 7.5 Local citations

Google: `"[dealership name]" site:chamber.org OR site:bbb.org OR site:[local newspaper domain]`

Verify presence on at least 3 local citation sources.

---

## Dimension 8. Inventory feed SEO

### 8.1 VDP title tag pattern

Sample 5 VDPs. Compare title patterns. Should be consistent: `[Year] [Make] [Model] [Trim] for sale in [City] | [Dealership Name]`

### 8.2 VDP meta description

Sample 5 VDPs. Compare meta descriptions. Should be unique per vehicle, mentioning specific features, mileage, color, or other distinguishing details.

### 8.3 Vehicle schema completeness

Google Rich Results Test on each sampled VDP. Verify Vehicle schema includes:
- VIN
- brand
- model
- modelDate
- mileageFromOdometer
- fuelType
- color
- Product wrapper with offers (price, priceCurrency, availability, itemCondition)
- Image array

### 8.4 No duplicate descriptions

Sample 5 random VDPs. Compare description body text.

Auto-generated boilerplate (e.g., "This vehicle has been well-maintained and is in excellent condition") repeated across vehicles indicates feed-generated content.

### 8.5 Aged inventory handling

Manually check 3 vehicles that were on the lot 90+ days ago. Are they still indexed? Are sold vehicles redirecting? Are 60+ day aged inventory items marked appropriately?

GSC → Pages → look for soft 404s flagged on inventory pages.

---

## Dimension 9. Hreflang and bilingual SEO

See `HREFLANG.md` for the dedicated bilingual SEO audit framework.

Quick verification:

```bash
# Check HTML hreflang
curl -sL https://[domain]/ | grep -i "hreflang"

# Check HTTP header hreflang
curl -sI https://[domain]/ | grep -i "link"

# Check sitemap hreflang
curl -sL https://[domain]/sitemap.xml | grep -i "xhtml:link"
```

If bilingual but no hreflang implementation found → Dimension 9 fails entirely.

---

## Dimension 10. E-E-A-T and content quality

### 10.1 Dealer principal and staff visibility

Manual review of /about/ and /staff/ pages. Look for:
- Dealer principal named with bio
- Staff named individually (not just photos)
- Credentials, tenure, OEM certifications mentioned

### 10.2 OEM credentials

Manual review of home page and /about/ page. Look for:
- Recent OEM awards displayed
- Date of most recent recognition
- Specific award names (Mark of Excellence, President's Award, Mark of Quality, etc.)

### 10.3 Trust signals

Check site footer and key pages for:
- Privacy policy link
- Terms of use
- Return or exchange policy (sometimes only for vehicles)
- Satisfaction guarantee (often dealer-specific)
- Phone number and address site-wide
- HTTPS lock icon

### 10.4 Author attribution on content

Review 3 blog posts. Check for:
- Named author (not "Admin", "Marketing Team", "Staff Writer")
- Author bio with credentials
- Author photo
- Author page linking to all their content

---

## Sample audit run command bundle

For a fast first-pass audit (some checks still require GSC and browser):

```bash
DOMAIN="[domain]"
echo "=== Robots.txt ==="
curl -sL https://$DOMAIN/robots.txt | head -20

echo "=== Sitemap ==="
curl -sIL https://$DOMAIN/sitemap.xml | head -3

echo "=== HTTPS redirect ==="
curl -sI -o /dev/null -w "HTTP-to-HTTPS: %{http_code}\n" http://$DOMAIN/

echo "=== Canonical check (home) ==="
curl -sL https://$DOMAIN/ | grep -i 'rel="canonical"'

echo "=== Title and meta (home) ==="
curl -sL https://$DOMAIN/ | grep -oE "<title>[^<]+</title>"
curl -sL https://$DOMAIN/ | grep -oE '<meta name="description" content="[^"]+"' | head -1

echo "=== H1 (home) ==="
curl -sL https://$DOMAIN/ | grep -oE "<h1[^>]*>[^<]+</h1>"

echo "=== Hreflang ==="
curl -sL https://$DOMAIN/ | grep -i "hreflang" | head -5

echo "=== Sample VDP, sample SRP, sample service page ==="
# Repeat the title/meta/H1/canonical checks above on each
```

For deeper analysis (orphan pages, click depth, anchor text patterns, full schema), use Screaming Frog with JavaScript rendering enabled.
