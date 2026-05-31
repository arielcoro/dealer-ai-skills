# Dealer Site Score — Reference Framework

The 10-dimension, 100-point framework for the dealer website grader. SKILL.md references this file. Read it before scoring any audit.

Total possible score: 100 points across 10 dimensions, weighted by impact on dealer outcomes.

---

## Dimension weights (at a glance)

| # | Dimension | Weight |
| --- | --- | --- |
| 1 | Performance (Core Web Vitals) | 25 |
| 2 | Hosting and infrastructure | 10 |
| 3 | Crawlability | 10 |
| 4 | Security | 10 |
| 5 | Schema and structured data | 10 |
| 6 | Mobile experience | 10 |
| 7 | Accessibility | 5 |
| 8 | Third-party tag bloat | 10 |
| 9 | Conversion elements | 5 |
| 10 | Dealer-specific signals | 5 |
| | **Total** | **100** |

Performance is weighted highest because every other dimension lives downstream of speed. A site that fails LCP loses customers, gets crawled less, and ranks worse — regardless of how perfect the schema or accessibility is.

---

## Bands

**90 to 100. A.** Excellent. Top decile of dealer sites. Fast, clean, AI-ready, conversion-friendly. The site is not the bottleneck.

**80 to 89. B.** Good. Solid foundation with manageable gaps. Quick wins available without rebuilds.

**70 to 79. C.** Average. Mid-pack dealer site. Real opportunities to improve, especially in performance and third-party bloat. Most dealers land here.

**60 to 69. D.** Below average. Significant performance or technical debt. Conversion is being suppressed. Vendor escalation likely required.

**Below 60. F.** Critical. Fundamental issues blocking conversion and visibility. Stop other digital marketing investments until foundation is fixed.

---

## Dimension 1. Performance (25 points)

The core of the grade. Real user data from Google's Chrome User Experience Report (CrUX), validated by Lighthouse synthetic tests.

### 1.1 LCP on mobile (Largest Contentful Paint) — 8 pts

- LCP under 2.5s on mobile: **8 pts**
- LCP between 2.5s and 4.0s on mobile: **4 pts**
- LCP over 4.0s on mobile: **0 pts**

LCP measures when the largest visible element (usually the hero image or the first SRP card) renders. Dealer sites commonly fail LCP because of unoptimized hero images, render-blocking scripts, and CMS-injected fonts.

### 1.2 CLS on mobile (Cumulative Layout Shift) — 6 pts

- CLS under 0.1 on mobile: **6 pts**
- CLS between 0.1 and 0.25 on mobile: **3 pts**
- CLS over 0.25 on mobile: **0 pts**

CLS measures unexpected layout shifts. Dealer sites commonly fail CLS because of late-loading ad slots, chat widgets that push content down, and inventory cards that resize as images load.

### 1.3 INP on mobile (Interaction to Next Paint) — 6 pts

- INP under 200ms on mobile: **6 pts**
- INP between 200ms and 500ms on mobile: **3 pts**
- INP over 500ms on mobile: **0 pts**

INP replaced FID as a Core Web Vital in March 2024. Measures responsiveness to user input. Dealer sites commonly fail INP on SRP filter interactions and VDP financing calculators.

### 1.4 Desktop Lighthouse score — 5 pts

- Desktop Lighthouse Performance score 90+: **5 pts**
- 70 to 89: **3 pts**
- Below 70: **0 pts**

Desktop is weighted lower than mobile because mobile is where dealer buyers actually shop (over 70% of dealer site traffic is mobile per industry data).

---

## Dimension 2. Hosting and infrastructure (10 points)

The foundation underneath performance. Slow hosting caps every speed improvement on the front end.

### 2.1 Time to First Byte (TTFB) — 4 pts

- TTFB under 600ms: **4 pts**
- TTFB between 600ms and 1.5s: **2 pts**
- TTFB over 1.5s: **0 pts**

### 2.2 CDN in use — 3 pts

- Site serves static assets through a CDN (Cloudflare, Akamai, Cloudfront, Fastly): **3 pts**
- Static assets served from origin only: **0 pts**

### 2.3 HTTP/2 or HTTP/3 — 2 pts

- HTTP/2 or HTTP/3 enabled: **2 pts**
- HTTP/1.1 only: **0 pts**

### 2.4 No 5xx response codes — 1 pt

- No server errors on a sample of 10 pages: **1 pt**
- One or more 5xx errors: **0 pts**

---

## Dimension 3. Crawlability (10 points)

Whether search engines and AI engines can read the site at all.

### 3.1 robots.txt is valid and not blocking — 3 pts

- robots.txt exists, is valid, and does not Disallow critical paths (/, /new-vehicles/, /service/, /used-vehicles/): **3 pts**
- robots.txt blocks critical paths: **0 pts**
- robots.txt missing or malformed: **0 pts**

### 3.2 AI crawlers not blocked — 2 pts

- GPTBot, ClaudeBot, PerplexityBot, Google-Extended all allowed: **2 pts**
- Any one blocked: **1 pt**
- Multiple blocked: **0 pts**

(This overlaps with dealer-aeo-audit Dimension 1. Scored here for site-grade completeness.)

### 3.3 sitemap.xml accessible and current — 3 pts

- sitemap.xml returns 200, contains current pages, last fetched in GSC within 7 days: **3 pts**
- sitemap.xml exists but stale or not submitted: **1 pt**
- sitemap.xml missing: **0 pts**

### 3.4 Indexability in Google Search Console — 2 pts

- Coverage report shows over 95% of submitted pages indexed: **2 pts**
- 80% to 95% indexed: **1 pt**
- Below 80% indexed: **0 pts**

---

## Dimension 4. Security (10 points)

### 4.1 HTTPS enforced on every page — 4 pts

- All pages redirect HTTP to HTTPS with a 301: **4 pts**
- HTTPS available but HTTP not redirected: **2 pts**
- HTTPS missing: **0 pts**

### 4.2 SSL certificate valid and modern — 2 pts

- Certificate valid, not expiring within 30 days, TLS 1.2 or 1.3: **2 pts**
- Valid but expiring soon or using TLS 1.0/1.1: **1 pt**
- Invalid certificate: **0 pts**

### 4.3 HSTS header set — 2 pts

- HSTS header present with max-age of at least 6 months: **2 pts**
- HSTS missing or short max-age: **0 pts**

### 4.4 No mixed content — 2 pts

- No HTTP resources loaded on HTTPS pages: **2 pts**
- One or more mixed content warnings: **0 pts**

---

## Dimension 5. Schema and structured data (10 points)

### 5.1 AutoDealer schema on home page — 3 pts

- AutoDealer with name, address, telephone, brand, openingHours all valid: **3 pts**
- Present but missing required fields: **1 pt**
- Missing: **0 pts**

### 5.2 Vehicle schema on VDPs — 3 pts

- Sample of 3 VDPs all have Vehicle schema with VIN, brand, model, mileageFromOdometer, Product wrapper with offers: **3 pts**
- Some VDPs have it, others do not: **1 pt**
- No Vehicle schema: **0 pts**

### 5.3 LocalBusiness schema with consistent NAP — 2 pts

- LocalBusiness or AutoDealer entity with NAP matching GBP and OEM locator: **2 pts**
- Inconsistencies: **0 pts**

### 5.4 No schema validation errors — 2 pts

- Google Rich Results Test passes on home, SRP, VDP with no errors: **2 pts**
- Warnings only: **1 pt**
- Errors: **0 pts**

(Schema dimensions overlap with dealer-aeo-audit but are scored here for site-grade completeness.)

---

## Dimension 6. Mobile experience (10 points)

### 6.1 Viewport meta tag set — 2 pts

- `<meta name="viewport" content="width=device-width, initial-scale=1">` present: **2 pts**
- Missing: **0 pts**

### 6.2 Touch targets sized appropriately — 2 pts

- Buttons and links at least 48x48 px with adequate spacing: **2 pts**
- Some touch targets undersized: **1 pt**
- Mostly undersized: **0 pts**

### 6.3 Mobile page weight under 3 MB — 3 pts

- Home, SRP, and VDP each under 3 MB total transfer on mobile: **3 pts**
- 3 to 5 MB: **1 pt**
- Over 5 MB: **0 pts**

### 6.4 Mobile-friendly per Lighthouse — 3 pts

- Lighthouse mobile audit shows mobile-friendly with score above 80: **3 pts**
- Score 60 to 80: **1 pt**
- Below 60: **0 pts**

---

## Dimension 7. Accessibility (5 points)

### 7.1 Image alt text coverage — 2 pts

- 95%+ of images have descriptive alt text (Lighthouse audit): **2 pts**
- 70% to 95%: **1 pt**
- Below 70%: **0 pts**

### 7.2 Color contrast — 1 pt

- All text passes WCAG AA contrast: **1 pt**
- Failures present: **0 pts**

### 7.3 ARIA labels and semantic HTML — 1 pt

- Forms have associated labels, buttons have accessible names, semantic landmarks used: **1 pt**
- Multiple violations: **0 pts**

### 7.4 Keyboard navigable — 1 pt

- All interactive elements (nav, forms, chat) work via keyboard tab: **1 pt**
- Multiple unreachable elements: **0 pts**

---

## Dimension 8. Third-party tag bloat (10 points)

The hidden killer of dealer site performance. Most dealer sites carry 30 to 60 third-party tags that each add 100 to 500 ms of latency.

### 8.1 Third-party request count — 4 pts

- Fewer than 25 third-party requests on home page: **4 pts**
- 25 to 50: **2 pts**
- Over 50: **0 pts**

### 8.2 Render-blocking third-party scripts — 3 pts

- No render-blocking third-party scripts in the head: **3 pts**
- 1 to 3 blocking scripts: **1 pt**
- More than 3: **0 pts**

### 8.3 Chat widget impact — 2 pts

- Chat widget lazy-loaded, does not block LCP: **2 pts**
- Eager-loaded chat that pushes LCP: **0 pts**

### 8.4 Inactive tags identified — 1 pt

- No expired or duplicate tags (e.g., old retargeting pixels from previous vendors, duplicate GTM containers): **1 pt**
- Multiple inactive tags found: **0 pts**

---

## Dimension 9. Conversion elements (5 points)

### 9.1 Click-to-call functional — 1 pt

- Phone numbers in headers and footers are `tel:` links: **1 pt**
- Plain text phone numbers without `tel:`: **0 pts**

### 9.2 Lead forms submit successfully — 2 pts

- Sample of 3 forms (contact, finance, service) submit without errors: **2 pts**
- One form broken: **1 pt**
- Multiple broken: **0 pts**

### 9.3 Primary CTA above the fold on mobile — 1 pt

- On mobile, home page shows a clear conversion CTA without scrolling: **1 pt**
- CTA hidden below the fold: **0 pts**

### 9.4 SRP filters functional — 1 pt

- Inventory filters work without errors and return results within 2 seconds: **1 pt**
- Filters broken or slow: **0 pts**

---

## Dimension 10. Dealer-specific signals (5 points)

### 10.1 VDP load time under 3 seconds — 2 pts

- VDP renders within 3 seconds on mobile: **2 pts**
- 3 to 5 seconds: **1 pt**
- Over 5 seconds: **0 pts**

### 10.2 Inventory feed indexed — 1 pt

- GSC coverage shows over 95% of VDPs indexed: **1 pt**
- Below 95%: **0 pts**

### 10.3 OEM compliance markings present — 1 pt

- Required OEM disclosures (manufacturer logos, brand standards, compliance language) present on home and inventory pages: **1 pt**
- Missing: **0 pts**

### 10.4 Service scheduler accessible — 1 pt

- Online service scheduler reachable from at least the home page and service page, functional on mobile: **1 pt**
- Broken or hidden: **0 pts**

---

# How to compute the final score

Sum every check. The maximum is 100. Assign the letter grade per the band table at the top of this file.

For the dimension breakdown in the output, sum the checks within each dimension and report that sub-score against the dimension max.

For the top 10 issues, sort all failed or partial checks by points lost (LCP fail = 8 points lost, chat widget fail = 2 points lost) and present the highest-impact 10. This gives the user a clear priority list.

---

# Common dealer site patterns and what they mean

After running this audit on enough dealer sites, certain patterns repeat. Use these to anticipate what you will likely find.

**Dealer.com sites** typically score in the 60 to 75 range. Strong on schema and crawlability. Weak on performance (heavy hero modules), heavy on third-party tags (Cox stack), and platform-locked on many fixes.

**DealerOn sites** typically score in the 70 to 80 range. Strong on schema, mobile, and crawlability. Performance is mid-pack. Third-party tag control is better than Dealer.com.

**DealerInspire sites** typically score in the 65 to 75 range. Strong creative flexibility, often slower performance due to heavy templates.

**WordPress / custom sites** vary wildly. Top scores possible (90+) if well-maintained. Bottom scores common (under 50) if neglected.

The grade is most useful when paired with vendor-aware recommendations: identify which fixes are quick wins the dealer can implement, which are platform-side and require a ticket, and which require a platform migration to address.
