# Website checks

Each numbered item is one equally weighted check within its category. Score only applicable items using SCORING.md. Use representative page evidence; disclose template sampling limitations.

## Access and discovery — 25 points
1. Sampled canonical pages resolve successfully over HTTPS, with useful redirect destinations and no observed blocking errors.
2. robots.txt, meta robots, and X-Robots-Tag align with intended indexing/search access; distinguish deliberate exclusions from accidental blocks.
3. Important pages are discoverable through working internal links; declared sitemaps contain canonical, available URLs. A missing sitemap alone is not a failure if discovery is sound.
4. Important facts exist in accessible text; compare raw HTML with rendered content and identify dependency on rendering without assuming JavaScript always fails.
5. CDN/challenge behavior and owner-supplied indexing evidence support intended search access. If logs or Search Console are unavailable, mark those parts unknown; a site: query is not definitive indexing proof.

## Answerable content — 25 points
1. Pages explain offerings, audience, location/coverage, and meaningful differences in clear text.
2. Key decision questions have specific answers (cost conditions, eligibility, limitations, process) appropriate to the business.
3. Facts are consistent across sampled pages and relevant public listings; distinguish contradictions from different dates or legitimate contexts.
4. Time-sensitive facts include relevant dates, availability, or update context, with attributable supporting sources where needed.
5. Semantic headings, tables, descriptive links, and accessible descriptions make important information understandable without visual guesswork.

## Identity and data integrity — 20 points
1. Business identity, contact details, locations, and ownership/publisher information are clear and consistent where applicable.
2. Claims have credible evidence; authorship, methodology, or expertise is identified when material to the content.
3. Existing structured data parses and matches visible facts and page purpose; assess whether machine-readable representation is useful, not whether every page has markup.
4. Product/service attributes, identifiers, prices and conditions reconcile across the inspected website/data representations. No feed requirement for a non-commerce site.

## Customer handoff — 20 points
1. The primary next action and expected outcome are clear on relevant pages.
2. Link destinations, contact methods and form entry points work under permitted non-submitting inspection; actual delivery remains unknown without an authorized end-to-end test.
3. Relevant terms, privacy information, and restrictions are accessible before users share information or commit.
4. Mobile/keyboard usability of the sampled customer path permits understanding and reaching the next action; don't invent performance or accessibility measurements.

## Measurement and maintenance — 10 points
1. A defined process exists to keep key facts and data fresh; distinguish owner-reported practices from verified evidence.
2. Available analytics/events or a documented measurement plan connect discovery, handoffs and outcomes. An installed tag does not prove successful conversion tracking; unavailable analytics is unknown.

## Separate optional connector review — unscored
- Published capabilities and supported clients match documentation and verified tests.
- Authoritative data sources, freshness timestamps, stable identifiers and unavailable-data behavior are documented.
- Authentication/authorization boundaries prevent access to restricted data.
- Read and write actions are separated; consequential changes require appropriate confirmation.
- Error handling, rate limits and operational monitoring are documented.

Report connector status as not needed, planned, documented only, partially verified, verified for the tested scope, or blocked. Do not infer production security from a marketing page.
