# Dealer llms.txt — Canonical Template

A working skeleton to fill in. Use this as the starting point for any dealer llms.txt. SKILL.md and REFERENCE.md govern the rules; this file is the structure.

Replace every `[bracketed]` placeholder with dealership-specific information. Delete sections that do not apply (with a recommendation to the user to consider adding them).

---

## The full template

```
# [Dealership Legal Name]

> [Brand portfolio, e.g., GMC, Buick, and Chevrolet] dealer in [City], [State]. [One-line differentiator from dealership profile, e.g., Top 5 nationally ranked GMC store.]

[Optional 1 to 3 sentence about paragraph. Include: years in business or family ownership if relevant, primary service area, and the differentiator from the profile expanded to a sentence.]

## Inventory

- [/new-vehicles/](https://[domain]/new-vehicles/): Current new [brand portfolio] inventory updated daily
- [/used-vehicles/](https://[domain]/used-vehicles/): Pre-owned inventory across all makes
- [/certified-pre-owned/](https://[domain]/certified-pre-owned/): [Brand] Certified Pre-Owned vehicles

## Brands and models

- [/[brand-1-slug]/](https://[domain]/[brand-1-slug]/): [Brand 1] lineup at [Dealership Name]
- [/[brand-2-slug]/](https://[domain]/[brand-2-slug]/): [Brand 2] lineup at [Dealership Name]
- [/models/[top-model-1-slug]/](https://[domain]/models/[top-model-1-slug]/): [Top model 1] inventory, trims, and pricing
- [/models/[top-model-2-slug]/](https://[domain]/models/[top-model-2-slug]/): [Top model 2] inventory, trims, and pricing

## Service

- [/service/](https://[domain]/service/): [Brand portfolio] certified service, [hours summary]
- [/service-specials/](https://[domain]/service-specials/): Current service coupons and seasonal promotions
- [/parts/](https://[domain]/parts/): OEM and aftermarket parts ordering
- [/recalls/](https://[domain]/recalls/): Active OEM recalls and free recall service
- [/schedule-service/](https://[domain]/schedule-service/): Online service appointment scheduling

## Finance

- [/finance/](https://[domain]/finance/): Financing options for new and used vehicles
- [/credit-application/](https://[domain]/credit-application/): Secure online credit application
- [/lease/](https://[domain]/lease/): Lease offers and end-of-lease options
- [/trade-in/](https://[domain]/trade-in/): Online trade-in valuation and in-person appraisal

## About

- [/about/](https://[domain]/about/): About [Dealership Name]
- [/staff/](https://[domain]/staff/): Sales, service, finance, and management team
- [/hours-and-directions/](https://[domain]/hours-and-directions/): Hours, address, and directions to the dealership
- [/contact/](https://[domain]/contact/): Contact forms, phone numbers, and department emails

## Reputation

- [/reviews/](https://[domain]/reviews/): Customer reviews from Google, DealerRater, and Cars.com
- [/awards/](https://[domain]/awards/): OEM awards and industry recognition

## Optional

- [/blog/](https://[domain]/blog/): Dealership blog and buyer guides
- [/community/](https://[domain]/community/): Community involvement and sponsorships
- [/espanol/](https://[domain]/espanol/): Páginas en español
```

---

## Filling in the template — examples by store type

### Example 1. Single-rooftop franchise (GM brands)

```
# Howard Bentley Buick GMC

> Franchise GMC and Buick dealer in Albertville, Alabama. Top 5 nationally ranked GMC dealer for 2025.

Family-owned franchise serving north Alabama with new GMC and Buick inventory, certified pre-owned vehicles, factory-trained service, and OEM parts. Recognized as a top 5 GMC dealer nationally in 2025 with 3,955 deliveries.

## Inventory
- [/new-vehicles/](https://howardbentleybuickgmc.com/new-vehicles/): Current new GMC and Buick inventory updated daily
- [/used-vehicles/](https://howardbentleybuickgmc.com/used-vehicles/): Pre-owned inventory across all makes
- [/certified-pre-owned/](https://howardbentleybuickgmc.com/certified-pre-owned/): GMC and Buick Certified Pre-Owned vehicles

## Brands and models
- [/gmc/](https://howardbentleybuickgmc.com/gmc/): GMC lineup at Howard Bentley
- [/buick/](https://howardbentleybuickgmc.com/buick/): Buick lineup at Howard Bentley
- [/models/gmc-sierra/](https://howardbentleybuickgmc.com/models/gmc-sierra/): GMC Sierra inventory, trims, and pricing
- [/models/gmc-yukon/](https://howardbentleybuickgmc.com/models/gmc-yukon/): GMC Yukon inventory, trims, and pricing

## Service
- [/service/](https://howardbentleybuickgmc.com/service/): GMC and Buick certified service, Monday through Friday 7am to 6pm
- [/service-specials/](https://howardbentleybuickgmc.com/service-specials/): Current service coupons and seasonal promotions
- [/parts/](https://howardbentleybuickgmc.com/parts/): OEM GM parts ordering
- [/recalls/](https://howardbentleybuickgmc.com/recalls/): Active GM recalls and free recall service scheduling
- [/schedule-service/](https://howardbentleybuickgmc.com/schedule-service/): Online service appointment scheduling

## Finance
- [/finance/](https://howardbentleybuickgmc.com/finance/): Financing options for new and used vehicles
- [/credit-application/](https://howardbentleybuickgmc.com/credit-application/): Secure online credit application
- [/lease/](https://howardbentleybuickgmc.com/lease/): GMC and Buick lease offers
- [/trade-in/](https://howardbentleybuickgmc.com/trade-in/): Online trade-in valuation and in-person appraisal

## About
- [/about/](https://howardbentleybuickgmc.com/about/): About Howard Bentley Buick GMC
- [/staff/](https://howardbentleybuickgmc.com/staff/): Sales, service, finance, and management team
- [/hours-and-directions/](https://howardbentleybuickgmc.com/hours-and-directions/): Hours, address, and directions
- [/contact/](https://howardbentleybuickgmc.com/contact/): Contact forms and department phone numbers

## Reputation
- [/reviews/](https://howardbentleybuickgmc.com/reviews/): Customer reviews from Google and DealerRater
- [/awards/](https://howardbentleybuickgmc.com/awards/): OEM awards including Top 5 GMC ranking 2025
```

### Example 2. Multi-rooftop dealer group

For a group with two or more rooftops sharing a common llms.txt at a group-level domain:

```
# [Group Name]

> Multi-franchise dealer group serving [metro area] with [N] rooftops across [list of brands].

[Group description, 2 to 3 sentences.]

## Rooftops

- [/[rooftop-1-slug]/](https://[domain]/[rooftop-1-slug]/): [Rooftop 1 name, brand, location]
- [/[rooftop-2-slug]/](https://[domain]/[rooftop-2-slug]/): [Rooftop 2 name, brand, location]

## Group inventory

- [/inventory/new/](https://[domain]/inventory/new/): All new vehicle inventory across rooftops
- [/inventory/used/](https://[domain]/inventory/used/): All pre-owned inventory across rooftops

[Continue with Service, Finance, About sections rolled up at the group level, with rooftop-specific service and finance links nested where applicable.]
```

Alternatively, each rooftop publishes its own llms.txt at its own subdomain or domain. That is the cleaner pattern for AI engines because the entity-per-llms.txt is unambiguous.

### Example 3. Independent dealer (no OEM franchise)

```
# [Independent Dealer Name]

> Independent used vehicle dealer in [City], [State]. [Years in business] specializing in [niche, e.g., late-model trucks, certified pre-owned imports].

[Description, 2 to 3 sentences. Lead with the specialization that distinguishes the dealer from the franchise stores in the metro.]

## Inventory

- [/inventory/](https://[domain]/inventory/): Current pre-owned inventory updated daily
- [/inventory/trucks/](https://[domain]/inventory/trucks/): Used truck inventory
- [/inventory/suvs/](https://[domain]/inventory/suvs/): Used SUV inventory

## Service

- [/service/](https://[domain]/service/): On-site service for all makes and models

## Finance

- [/finance/](https://[domain]/finance/): Financing for all credit situations
- [/credit-application/](https://[domain]/credit-application/): Secure online credit application
- [/trade-in/](https://[domain]/trade-in/): Trade-in evaluation

## About

- [/about/](https://[domain]/about/): About [Dealer Name]
- [/hours-and-directions/](https://[domain]/hours-and-directions/): Hours and directions
- [/contact/](https://[domain]/contact/): Contact us

## Reputation

- [/reviews/](https://[domain]/reviews/): Customer reviews
```

---

## Common adjustments

**No CPO inventory.** Skip the CPO line. Flag in recommendations that CPO is a strong AEO signal when applicable.

**No dedicated model pages.** Skip the "Brands and models" individual model entries; keep only the brand-level pages.

**No blog.** Skip the blog line. Do not recommend adding one unless the dealer has resources to update it regularly.

**No Spanish section yet.** Skip the espanol line. If the dealer expressed bilingual goals, flag as recommended creation.

**No recalls page.** Skip the recalls line, but flag it as a recommended page for OEMs with frequent recalls (GM, Ford, Stellantis).

---

## After generating

Output the final llms.txt as a single fenced code block. Then provide:

1. The publishing instructions (file path, platform-specific guidance).
2. The verification curl commands.
3. A short summary of what was included and what was intentionally skipped, with reasoning.
4. A "Pages to consider adding" list for sections that were skipped because the page does not exist but should.
5. The recommended 90-day re-generation cadence.
