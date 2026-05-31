# Dealer Bilingual SEO — Implementation Guide

Platform-specific implementation notes and OEM Spanish program reference.

This file supplements REFERENCE.md with concrete technical details for the most common dealer website platforms and OEM Spanish programs.

---

## Dealer.com (Cox Automotive)

### Supports

- Subfolder `/es/` routing (since the 2022 platform update; confirm with vendor for older accounts)
- Hreflang in HTML head tags on Tier 1 pages
- Multilingual content management in the CMS for static pages
- Inventory feed translation for VDP descriptions (limited; depends on dealer.com plan tier)

### Limitations

- The OEM Spanish program (e.g., GM en Español) is sometimes served as an embedded module on the dealer.com site, which can conflict with custom Spanish pages.
- Sitemap-based hreflang requires a custom XML sitemap, which dealer.com platform-side support is inconsistent on.
- Inventory feed translation does not support OEM-specific Spanish terminology by default; templates must be customized.

### Implementation steps

1. **Open a vendor ticket** requesting the Spanish-language module activation. Confirm the URL pattern (`/es/`) and the language toggle placement in the global header.
2. **Configure the language toggle** to appear in the dealer's global navigation (top right, typically).
3. **Configure URL slug translation**: confirm with the vendor whether dealer.com supports translating the path component (e.g., `/inventory/` to `/inventario/`) or only the language prefix. If only the prefix, accept English slugs as a Tier 1 launch and lobby for slug translation as a Tier 2 enhancement.
4. **Add hreflang** via the platform's SEO settings UI for Tier 1 pages.
5. **Customize the inventory feed Spanish template**: provide Spanish translations for vehicle descriptions, condition labels, badges (e.g., "Used" to "Usado", "Certified Pre-Owned" to "Certificado Pre-Propietario"), and CTAs.
6. **Configure Spanish schema**: the dealer.com schema injection module typically supports per-language schema. Confirm with vendor.
7. **Set GA4 properties**: a single GA4 property with Spanish-language traffic identified via the URL path filter. Do not create a separate GA4 property.

### Common dealer.com bilingual issues

- The Spanish language toggle disappears on dynamic VDP pages because the dealer.com VDP template was not configured for bilingual routing. Vendor ticket.
- The Spanish sitemap is generated but missing hreflang entries. Vendor ticket; or implement sitemap-based hreflang via a custom XML deployed alongside the platform sitemap.
- The OEM Spanish program module injects content above the dealer.com Spanish content, creating a stacked layout. Disable the OEM module or coordinate with OEM.

---

## DealerOn (Rey-Rey)

### Supports

- Subfolder `/es/` routing
- Hreflang on Tier 1 pages
- Multilingual content management

### Limitations

- DealerOn's Spanish module integration with OEM Spanish content varies by OEM partnership.
- Inventory feed Spanish templates require manual setup.

### Implementation steps

1. **Vendor ticket** for Spanish module activation.
2. **Configure language toggle** in global nav.
3. **Add hreflang** via SEO module.
4. **Spanish inventory templates** for VDP and SRP.
5. **Spanish schema** via schema settings.
6. **Single GA4 property** with URL-path filter for Spanish traffic.

### Common DealerOn bilingual issues

Similar pattern to dealer.com: VDP template not bilingual-aware, sitemap missing hreflang, OEM module conflicts.

---

## DealerInspire (CDK)

### Supports

- Subfolder `/es/` routing
- Hreflang
- Multilingual content management
- Inventory feed Spanish translation

### Implementation steps

Mirror dealer.com and DealerOn pattern. DealerInspire historically has the best out-of-the-box Spanish support of the three major dealer platforms.

---

## Custom and WordPress-based dealer sites

### Recommended approach

For a WordPress-based dealer site (rare for franchise, common for some independent dealers):

1. Use a multilingual plugin: WPML or Polylang.
2. Configure subfolder routing (`/es/`).
3. Translate Tier 1 pages via the plugin's translation interface (manual or vendor-assisted).
4. Hreflang is automatic via the plugin.
5. Schema must be implemented per language; use a Schema plugin (e.g., Schema Pro, Yoast Schema) with per-language fields.

### Custom dealer platforms (rare for franchise)

Implementation is bespoke. The five mandatory hreflang rules (REFERENCE.md) still apply. Develop a clear URL pattern, server-render Spanish pages, implement hreflang in HTML head tags or sitemap, and confirm with crawler tools.

---

## OEM Spanish-language programs

### GM en Español (Buick, GMC, Chevrolet, Cadillac)

- Program URL: gm.com/es, buick.com/es, gmc.com/es, chevrolet.com/es, cadillac.com/es
- Quality: Brand-level marketing, generic. Does not adapt to individual rooftop local intent.
- Dealer integration: GM dealers can link to the OEM Spanish content; some OEM-managed sites embed the Spanish content as a module on dealer.com.
- **Recommendation:** Build dealer's own `/es/` Spanish presence. Treat OEM Spanish content as a brand-level reference. Override or coordinate where the OEM module appears on the dealer site to avoid duplicate content.

### Ford en Español (Ford, Lincoln)

- Program URL: es.ford.com, es.lincoln.com
- Quality: Brand-level, generic.
- **Recommendation:** Same as GM. Build dealer's own Spanish pages.

### Stellantis (Chrysler, Dodge, Jeep, Ram, FIAT)

- Spanish-language presence is fragmented across brand sites.
- **Recommendation:** Build dealer's own Spanish pages; do not rely on OEM Spanish content.

### Toyota Espanol

- Program URL: espanol.toyota.com
- Quality: Better than most OEM Spanish programs in terms of breadth and consistency.
- Dealer integration: Toyota has a more mature Spanish-language program than most OEMs. Some Toyota dealers can opt into a Spanish microsite framework.
- **Recommendation:** Audit the Toyota Spanish microsite framework if applicable. Often it covers Tier 1 content sufficiently; the dealer's value-add is the local-rooftop-specific Spanish content (location, hours, specials, inventory).

### Honda Espanol

- Program URL: automoviles.honda.com (note: standalone Spanish microsite)
- Quality: Brand-level.
- **Recommendation:** Build dealer's own Spanish pages.

### Hyundai Espanol

- Program URL: hyundaiusa.com/es
- Quality: Brand-level. Hyundai has invested in Hispanic marketing.
- **Recommendation:** Build dealer's own Spanish pages. Coordinate where possible.

### Kia Espanol

- Limited program. Build dealer's own.

### Subaru Espanol

- Limited program. Build dealer's own.

### Volkswagen / Audi

- Mature European-style multilingual. The US Spanish program is less mature than the European multi-language framework.
- **Recommendation:** Build dealer's own.

### Mazda

- Limited program. Build dealer's own.

---

## Hispanic auto buyer behavior — operating notes

These notes inform content priorities and tone:

1. **Family-influenced decisions.** US Hispanic buyers more often involve extended family in the decision than the general market. Spanish content that addresses the family decision (financing for the household, vehicles suited for multi-generational use) outperforms generic translations of English ad copy.

2. **Brand loyalty.** Once a Hispanic buyer establishes a relationship with a dealership and brand, repeat purchase and referral rates are above the general market. Service-and-retention content matters disproportionately.

3. **Mobile-first.** Hispanic auto buyers research more on mobile than the general market. The Spanish version must be mobile-optimized (this is true for all dealer sites, but is non-negotiable for the Spanish version).

4. **Spanish-language radio and TV still drive consideration.** Many Hispanic buyers consume Spanish-language broadcast media during research. The Spanish website should connect to broadcast campaigns where the dealer runs them.

5. **Trust signals matter more.** The dealership name, photo of the GM, photos of the sales team (with Spanish-speaking staff identifiable), and Spanish-language Google reviews are all higher-conversion than the English equivalents.

6. **The "yo hablo Español" badge is a conversion lever.** A clearly-displayed "Hablamos Español" badge on the home, contact, and location pages, plus the names of bilingual sales associates on the team page, increase form fills and call rates from Spanish-language traffic.

7. **Spanish-language SMS for follow-up.** If the dealer's BDC and CRM (DriveCentric, Fullpath, Reynolds) support Spanish-language SMS templates, configure them. Spanish-language buyers respond at higher rates to Spanish follow-up SMS than to English.

8. **Spanish-language video.** Walk-around videos, financing explainers, and service-floor videos in Spanish outperform translated text content for Hispanic buyer engagement metrics. Where the dealer can produce Spanish-language video, do so.

---

## Translation vendor selection

### What to look for

- Native Spanish speaker (preferably from a US Hispanic market, not Spain or Mexico exclusively)
- Auto industry experience (knows the difference between "auto" and "carro," uses "concesionario" vs "agencia" correctly per market)
- Familiarity with US dealer terminology (knows "F&I," "BDC," "CPO," "test drive" handling in Spanish)
- Ability to translate at scale (Tier 1 launch typically 10,000 to 30,000 words; inventory feed templates are smaller but recurring)

### What to avoid

- Pure machine translation as a delivery
- Spanish-language translators with no US Hispanic market familiarity (their Spanish reads correctly but is culturally tone-deaf to US Hispanic buyers)
- Translation as a one-time project; ongoing content and inventory translation needs a continuous arrangement

### Cost guidance (general; verify locally)

- Tier 1 launch translation: $2,000 to $8,000 depending on word count and vendor
- Ongoing content: $0.10 to $0.20 per word for high-quality Spanish translation
- Inventory feed template setup: $500 to $2,000 one-time, plus ongoing maintenance

These are general benchmarks. Local vendors and freelancers in major Hispanic markets (Miami, Houston, Los Angeles) are often cost-effective.

---

## QA checklist post-launch

After the Tier 1 launch, run this 25-point checklist:

### Crawl and indexation
1. Every Spanish Tier 1 page returns HTTP 200.
2. Every Spanish Tier 1 page is in the Spanish sitemap.
3. The Spanish sitemap is submitted to GSC.
4. GSC shows the Spanish pages indexed within 14 days.
5. No duplicate-content warnings in GSC between English and Spanish versions.

### Hreflang
6. Every Spanish Tier 1 page has hreflang to its English equivalent.
7. Every English Tier 1 page has hreflang to its Spanish equivalent.
8. All hreflang tags use `es-US` and `en-US`.
9. x-default is present on all sets.
10. Hreflang reciprocal validation passes (use Screaming Frog or Sitebulb).

### Content
11. All Tier 1 content is human-translated or natively authored.
12. Page titles in Spanish.
13. Meta descriptions in Spanish.
14. OG tags in Spanish.
15. Image alt text in Spanish.
16. Internal links from Spanish pages go to Spanish pages.
17. CTAs in Spanish.

### Schema
18. AutoDealer schema includes Spanish description on Spanish pages.
19. Vehicle schema includes Spanish description on Spanish VDPs.
20. FAQPage schema in Spanish where Spanish FAQs exist.

### UX and conversion
21. Language toggle visible on every page.
22. Spanish forms in Spanish (labels, error messages, success messages).
23. Spanish thank-you pages.
24. Spanish form submissions route to the same lead pipeline (DriveCentric, etc.) with a Spanish-language source tag.
25. GA4 event tracking fires on Spanish pages (configured filter to identify Spanish traffic by URL path).

### Bonus
26. Spanish posts in GBP, at least 4 published in the past 30 days.
27. Spanish Q&A pre-seeded in GBP (5 entries).
28. Spanish reviews responded to in Spanish within 48 hours of the past 25 reviews.
29. BDC and sales team trained on bilingual handoff.
30. CRM Spanish-language follow-up templates configured.
