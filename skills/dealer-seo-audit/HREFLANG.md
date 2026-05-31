# Dealer SEO Audit — Hreflang and Bilingual SEO Deep Dive

The complete hreflang reference for bilingual dealer sites. SKILL.md and REFERENCE.md reference this file. Apply this audit only when the dealer serves a Spanish-speaking audience.

---

## Why this matters for dealers

Hispanic markets are among the fastest-growing dealer customer segments in the US. Markets like South Florida, Texas, Southern California, Arizona, and New York have dealer customer bases where 30% to 60% of car-buying intent searches happen in Spanish.

Most bilingual dealer sites do hreflang wrong or skip it entirely. The consequences:

- **Spanish pages suppressed from Spanish-language Google indexing.** Google can't tell which version to show for Spanish queries.
- **Duplicate content penalties.** Without hreflang, near-identical English and Spanish versions look like content duplication.
- **Wasted Spanish content investment.** A dealer who paid to translate 50 pages into Spanish gets little ranking benefit if hreflang is missing.

Hreflang done right is one of the highest-leverage SEO improvements for bilingual dealers because the competitive density in Spanish-language dealer SEO is dramatically lower than English. First-mover advantage is real.

---

## What hreflang does

Hreflang tells search engines: "This URL is the Spanish version of that URL." It's a signal of language and regional targeting.

Three equivalent placement methods:

1. **HTML link tags** in the `<head>`
2. **HTTP Link headers**
3. **XML sitemap `<xhtml:link>` entries**

Choose one method per site (consistency matters). Sitemap-based is preferred for 10+ locales because it scales without adding page weight. HTML link tags are simpler for 2-locale sites (English + Spanish).

---

## The five rules of hreflang done right

### Rule 1. Self-referencing entry on every page

Every page must include itself in its own hreflang set.

**Correct (English page):**

```html
<link rel="alternate" hreflang="en" href="https://example.com/page" />
<link rel="alternate" hreflang="es" href="https://example.com/es/page" />
<link rel="alternate" hreflang="x-default" href="https://example.com/page" />
```

**Wrong (missing self-reference):**

```html
<link rel="alternate" hreflang="es" href="https://example.com/es/page" />
```

When the self-reference is missing, Google ignores the entire hreflang cluster for that page.

### Rule 2. Reciprocal links

If page A points to page B, page B must point back to page A. Both must include themselves.

**Correct.** English page `/page` and Spanish page `/es/page` both have:

```html
<link rel="alternate" hreflang="en" href="https://example.com/page" />
<link rel="alternate" hreflang="es" href="https://example.com/es/page" />
<link rel="alternate" hreflang="x-default" href="https://example.com/page" />
```

**Wrong.** English page points to Spanish, but Spanish doesn't point back. Google drops the entire pair.

### Rule 3. Valid ISO codes

Use ISO 639-1 language codes (en, es) and optional ISO 3166-1 Alpha 2 region codes (US, MX).

**Common dealer mistakes:**

- `en-UK` — wrong. Use `en-GB` (United Kingdom is "GB" in ISO 3166).
- `es-LA` — wrong. Latin America isn't a country code.
- `english`, `spanish` — wrong. Use ISO codes.
- `en-us` lowercase region — technically tolerated but the standard is `en-US`.

**For most US dealers serving bilingual customers:**

- `en` for English (or `en-US` if regional differentiation matters)
- `es` for Spanish (or `es-US` for US Spanish if specifically targeting US Hispanic markets)
- `x-default` as the fallback

Avoid `es-MX` unless content is genuinely targeted to Mexican Spanish (different from US Spanish vocabulary).

### Rule 4. x-default for the fallback

`x-default` tells Google which page to show when no language match exists.

For a US dealer, `x-default` should point to the English version (the broader-reach version):

```html
<link rel="alternate" hreflang="x-default" href="https://example.com/page" />
```

Without `x-default`, Google may show the wrong language version to international searchers or fall back unpredictably.

### Rule 5. All target URLs must return 200, be indexable, and match their canonical

If page B is in page A's hreflang set, page B must:
- Return HTTP 200 (not 404, not 301 redirect, not 5xx)
- Not be noindex'd
- Have a canonical URL that matches the URL in the hreflang (no cross-canonical to English)

**Common error: canonical conflicts with hreflang.**

```html
<!-- WRONG: Spanish page canonicals to English -->
<link rel="canonical" href="https://example.com/page" />
<link rel="alternate" hreflang="en" href="https://example.com/page" />
<link rel="alternate" hreflang="es" href="https://example.com/es/page" />
```

In this case, Google sees the Spanish page canonicaling to the English version, which suppresses Spanish indexation entirely. The dealer paid for Spanish content that Google won't show in Spanish-language search results.

**Correct: each page self-canonicals.**

Spanish page should have:

```html
<link rel="canonical" href="https://example.com/es/page" />
<link rel="alternate" hreflang="en" href="https://example.com/page" />
<link rel="alternate" hreflang="es" href="https://example.com/es/page" />
<link rel="alternate" hreflang="x-default" href="https://example.com/page" />
```

---

## Audit checklist

For each page in the bilingual sample, verify:

- [ ] Self-referencing hreflang entry present
- [ ] Reciprocal hreflang entry on the corresponding language page
- [ ] Valid ISO codes (en, es, en-US, es-US — not en-UK or es-LA)
- [ ] x-default specified and pointing to fallback
- [ ] All hreflang target URLs return 200
- [ ] All hreflang target URLs are indexable (not noindex'd)
- [ ] Canonical URL on each page matches its own URL (no cross-language canonical)
- [ ] HTML, HTTP header, and sitemap hreflang signals agree (no conflicts)

---

## Quick verification commands

### Check HTML hreflang on a page

```bash
curl -sL https://[domain]/[page-url] | grep -i "hreflang"
```

Expected output: multiple `<link rel="alternate" hreflang="..." href="...">` lines including the page's own language code as self-reference.

### Check HTTP Link header hreflang

```bash
curl -sI https://[domain]/[page-url] | grep -i "link:"
```

Expected output (if using HTTP header method): `Link: <https://example.com/es/page>; rel="alternate"; hreflang="es"`

### Check sitemap hreflang

```bash
curl -sL https://[domain]/sitemap.xml | grep -A 5 "xhtml:link"
```

Expected output: `<xhtml:link rel="alternate" hreflang="es" href="https://example.com/es/page"/>` entries.

### Verify hreflang target URLs return 200

For each hreflang target URL from the HTML:

```bash
for url in [hreflang URL 1] [hreflang URL 2] [hreflang URL 3]; do
  curl -sI -o /dev/null -w "%{http_code} $url\n" $url
done
```

### Verify canonical doesn't conflict

```bash
curl -sL https://[domain]/es/[page-url] | grep -i 'rel="canonical"'
```

If the Spanish page's canonical points to the English URL, that's a critical error.

---

## Content quality across locales

Hreflang implementation is necessary but not sufficient. Google also checks whether the content is genuinely translated.

### What Google looks for

- **Visible content translated.** Not just navigation chrome — the body content, headings, titles, meta descriptions, alt text.
- **Localized signals where applicable.** Phone format (US Spanish: same format), addresses, currency notation.
- **Not scaled low-value translation.** AI-translated content alone is not against guidelines, but pages where Spanish translation adds nothing original (compared to the English) can trigger scaled content abuse policy.

### Common dealer translation failures

**Failure 1: Boilerplate-only translation.** Only navigation, header, footer translated. Body content stays in English. Google sees these as duplicates.

**Failure 2: Machine translation without review.** Word-for-word machine translation produces awkward phrasing. Customers bounce; engagement signals drop; rankings suppress.

**Failure 3: Translating only some pages.** 5 Spanish pages alongside 200 English pages signals incomplete localization. Google may rank either inconsistently.

**Failure 4: No localized signals.** Spanish service page uses English-only OEM brand voice without acknowledging Spanish-speaking customer concerns (family-buying decisions, multi-generational dynamics, community involvement).

### Audit content quality

For each sampled Spanish page:
- Verify body content is fully translated
- Check meta description is in Spanish (not English)
- Check alt text on key images is in Spanish
- Read for naturalness (does it read as written by a fluent Spanish speaker or as machine output)
- Check for localized phone, address, and any geo-specific references

Flag any failures.

---

## Sitemap-based hreflang for dealers

For dealers with hundreds of pages (inventory feeds especially), sitemap-based hreflang scales better than HTML link tags.

### Standard format

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <url>
    <loc>https://example.com/page</loc>
    <xhtml:link rel="alternate" hreflang="en" href="https://example.com/page"/>
    <xhtml:link rel="alternate" hreflang="es" href="https://example.com/es/page"/>
    <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/page"/>
  </url>
  <url>
    <loc>https://example.com/es/page</loc>
    <xhtml:link rel="alternate" hreflang="en" href="https://example.com/page"/>
    <xhtml:link rel="alternate" hreflang="es" href="https://example.com/es/page"/>
    <xhtml:link rel="alternate" hreflang="x-default" href="https://example.com/page"/>
  </url>
</urlset>
```

Note that each `<url>` block includes the full hreflang set, including self-reference.

### Sitemap size limits

A standard sitemap can hold 50,000 URLs and is limited to 50 MB uncompressed. The `<xhtml:link>` children do NOT count toward the 50K URL limit (only `<url>` blocks do), but the file size limit becomes the bottleneck.

For full hreflang on inventory feeds with thousands of VDPs, plan for 2K to 5K URLs per sitemap file, with a sitemap index pointing to multiple sitemaps.

---

## When to recommend implementation

If the audit finds hreflang missing entirely on a bilingual dealer site, the recommendation depends on dealer scope:

**Single-rooftop dealer with translated Spanish section (~20-50 pages):**
- HTML link tag method is fine
- Implementation: 1-2 weeks vendor work
- Expected ranking lift: visible in 30 to 90 days for Spanish queries
- ROI: high (first-mover advantage in most metros)

**Multi-rooftop group with full bilingual site (200+ pages):**
- Sitemap-based hreflang preferred
- Implementation: 4-8 weeks vendor work plus content audit
- Expected ranking lift: visible in 60 to 120 days
- ROI: very high for groups serving major Hispanic metros

**Dealer with only navigation translated (Spanish "skin" over English content):**
- Hreflang implementation is wasted until content is genuinely translated
- Recommend content translation first, hreflang second

---

## How this dimension scores

See REFERENCE.md Dimension 9 for the scoring breakdown. The summary:

- **9.1 Hreflang implementation present (3 pts):** Any of HTML, HTTP header, or sitemap method counts.
- **9.2 Hreflang correctness (3 pts):** All five rules above satisfied (self-reference, reciprocal, valid codes, x-default, target URLs valid).
- **9.3 Spanish content quality (2 pts):** Fully translated body content, not just boilerplate.

When the dealer is not bilingual, Dimension 9 is N/A and the 8 points are reallocated to Dimensions 2 (+4) and 4 (+4).
