# Dealer llms.txt Generator — Reference

The format, ordering rules, and quality standards for a dealer-grade llms.txt. SKILL.md references this file. Read it before generating any output.

---

## What llms.txt is

A plain text file at the root of the domain (`/llms.txt`) that gives AI engines a curated map of the most important content on the site. The convention is documented at [llmstxt.org](https://llmstxt.org). It is not a sitemap (those are XML and exhaustive). It is editorial. The point is curation, not coverage.

For a car dealership, llms.txt does three jobs:

1. **Tells the AI engine who the entity is.** First lines define the dealership: name, brand portfolio, location, one-line differentiator.
2. **Tells the engine where the high-value content lives.** Inventory roots, service, finance, identity pages. Each entry is a URL and a short specific description.
3. **Signals editorial priority by ordering.** AI engines that read llms.txt weight ordering. Top sections matter more than bottom sections.

---

## File structure

Use this exact format. Markdown-style headings. URLs as Markdown links. Descriptions as plain text after the link, separated by a colon.

```
# [Dealership Name]

> [One-line description: brand portfolio, location, type]

[Optional 1 to 3 sentence "about" paragraph. Include the differentiator from the dealership profile.]

## Inventory

- [/new-vehicles/](https://[domain]/new-vehicles/): Current new [brand] inventory
- [/used-vehicles/](https://[domain]/used-vehicles/): Used vehicle inventory across all brands
- [/certified-pre-owned/](https://[domain]/certified-pre-owned/): [Brand] Certified Pre-Owned inventory

## Brands and models

- [/buick/](https://[domain]/buick/): Buick lineup at [Dealership Name]
- [/gmc/](https://[domain]/gmc/): GMC lineup at [Dealership Name]
- [/models/gmc-sierra/](https://[domain]/models/gmc-sierra/): GMC Sierra inventory, trims, and pricing

## Service

- [/service/](https://[domain]/service/): Service department, hours, scheduling
- [/service-specials/](https://[domain]/service-specials/): Current service coupons and promotions
- [/parts/](https://[domain]/parts/): Parts department and ordering
- [/recalls/](https://[domain]/recalls/): Active recall information and scheduling

## Finance

- [/finance/](https://[domain]/finance/): Financing options and credit application
- [/lease/](https://[domain]/lease/): Lease specials and end-of-lease options
- [/trade-in/](https://[domain]/trade-in/): Trade-in evaluation and process

## About

- [/about/](https://[domain]/about/): About the dealership
- [/staff/](https://[domain]/staff/): Sales, service, and finance team
- [/hours-and-directions/](https://[domain]/hours-and-directions/): Hours, address, and directions
- [/contact/](https://[domain]/contact/): Contact information and forms

## Reputation

- [/reviews/](https://[domain]/reviews/): Customer reviews
- [/awards/](https://[domain]/awards/): Awards, OEM recognition, and accolades

## Optional

- [/blog/](https://[domain]/blog/): Dealership blog and news
- [/spanish/](https://[domain]/spanish/): Spanish-language pages
```

---

## Section ordering (priority)

AI engines weight ordering. Use this exact order. Skip a section only if the dealer genuinely does not have those pages, and flag the absence as a recommendation.

1. **Inventory** (most important). Where buyers click first.
2. **Brands and models.** Brand-portfolio reinforcement and long-tail discovery.
3. **Service.** Half of dealer gross profit. AI engines surface service queries.
4. **Finance.** Buying-help, lease, trade.
5. **About.** Identity, hours, location, staff. Where AI engines verify entity accuracy.
6. **Reputation.** Reviews and awards.
7. **Optional.** Blog, Spanish, special pages.

---

## Quality rules

**Twenty to seventy-five entries total.** Below twenty is underbuilt. Above seventy-five dilutes curation.

**Specific descriptions, not generic.** Replace "Service department" with "Certified GMC service center with weekday and Saturday hours." Replace "Used vehicles" with "Pre-owned inventory across all makes, updated daily." Specificity is the entire point.

**Canonical URLs only.** No query strings. No filtered or faceted variants. No tracking parameters. No session IDs.

**Verified URLs only.** Every URL in the output must either be confirmed by the user or fetched by the agent and returned 200. Fabricating a URL that "should exist" is the most common quality failure. Do not do it.

**No thin pages.** Skip pages that have less than 100 words of content or are pure marketing splash. AI engines do not benefit from being directed to empty pages.

**No duplicate destinations.** If `/new-inventory/` and `/new-vehicles/` resolve to the same content, include only the canonical one.

**One-line differentiator at the top.** The blockquote `> ...` immediately after the H1 is the engine's first signal about what makes this dealer distinct. Use the user-provided differentiator. Do not invent.

**No marketing slogans.** Replace "Where the deals are" with "Sells GMC, Buick, and Chevrolet in Albertville, AL." Description is information, not advertising.

---

## What to include vs leave out

**Always include if the page exists:**
- New, used, and CPO SRPs
- Service, parts, recalls
- Finance, lease, trade-in
- About, staff, hours, contact
- Reviews
- Blog or news (if updated within the last 90 days; otherwise skip)

**Include when relevant:**
- Brand-specific landing pages (one per franchise)
- Top model pages (Sierra, Tahoe, Bronco, etc.) when the dealer has dedicated landing pages
- Spanish-language section or subdomain
- Loyalty programs, dealer events, OEM events
- Service customer portal (if it exists publicly)
- Awards page (separate from About when notable)

**Always exclude:**
- Faceted or filtered SRPs (?make=X, ?priceMin=Y)
- VDP-level individual vehicle URLs (they change too fast)
- Internal-search result URLs
- Login or account pages
- Cart, checkout, or session-state pages
- Print-friendly versions
- Pages that 404 or 5xx

**Exclude with judgment:**
- Old blog posts (link to the blog root, not individual posts)
- Staff bio individual pages (link to /staff/, not each person)
- Event detail pages older than 30 days

---

## Description writing pattern

Each entry should follow this pattern: `[URL]: [Specific, short description]`.

Good examples:
- `[/service/](url): GMC and Buick certified service, Monday-Friday 7am-6pm, Saturday 8am-2pm`
- `[/new-vehicles/](url): Current new GMC and Buick inventory updated daily`
- `[/trade-in/](url): Online trade-in valuation and in-person appraisal`
- `[/recalls/](url): Active OEM recalls and free recall service scheduling`

Bad examples:
- `[/service/](url): Service` (too generic)
- `[/new-vehicles/](url): New vehicles for sale` (no specificity)
- `[/trade-in/](url): Trade your car today!` (slogan, not information)

---

## Dealer-specific best practices

These are nuances that distinguish a dealer-grade llms.txt from a generic one.

**Brand portfolio in the H1 description.** AI engines need to know what brands the store sells in the first 100 characters. Include all franchises and any major used-brand specializations.

**Hours in the description when reasonable.** When a service department's hours fit in the description string, include them. AI engines surface "service hours near me" queries.

**Cross-brand service callout.** If the dealer services more brands than they sell new (most do), note it on the service entry.

**Recall page is its own line.** Brands subject to active recalls (frequent in GM, Ford, and Stellantis) benefit from a dedicated recall page link.

**Trade-in is its own line.** Trade-in evaluation is a high-intent buyer signal. AI engines surface it.

**Spanish section gets dedicated treatment when present.** If the dealer has Spanish-language content, link to it in its own line (or its own llms.txt subdomain file). Do not bury it.

---

## Bilingual handling

When the dealer has a Spanish-language section or subdomain:

**If on a subdomain** (e.g., `espanol.[domain]`): Generate a separate `/llms.txt` for the Spanish subdomain. Descriptions in Spanish. Same structure.

**If as a path** (e.g., `/spanish/`): Add a "Spanish" section to the main llms.txt with key Spanish-language pages linked, descriptions in Spanish.

**If the dealer wants** but does not yet have: Flag this as a recommended creation. Do not invent Spanish URLs.

---

## What to do when the dealer's site is on a constrained platform

Some dealer platforms (Dealer.com, DealerOn, DealerInspire) do not allow self-service file placement at the root. The user will need to open a vendor ticket. In that case:

1. Generate the llms.txt content as normal.
2. In the output, provide the vendor-specific instructions for how to request placement.
3. Recommend the user follow up after publishing to verify with `curl -sIL https://[domain]/llms.txt`.
4. Suggest the user re-run this skill in 90 days to update the file as the site evolves.

---

## Recommended maintenance cadence

llms.txt is not set-and-forget. Recommend the user re-generate the file every 90 days, or whenever:
- A new model launches and gets a dedicated landing page
- A new service department capability comes online
- The dealership opens a Spanish-language section
- A new rooftop is added to the group
- The brand portfolio changes (added franchise, dropped franchise)

A regularly maintained llms.txt outperforms a one-time-published file by a meaningful margin in AI engine citation rates.

---

## Validation after publishing

Once the file is live at `/llms.txt`, run these three checks:

```
curl -sIL https://[domain]/llms.txt | head -5
```
Expect HTTP 200 and content-type: text/plain.

```
curl -sL https://[domain]/llms.txt | wc -l
```
Expect roughly 30 to 100 lines.

```
curl -sL https://[domain]/llms.txt | head -10
```
Verify the H1, blockquote, and about paragraph look as intended.

If all three pass, the file is published correctly. The audit re-runs in 90 days to keep it current.
