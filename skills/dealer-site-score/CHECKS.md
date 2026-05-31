# Dealer Site Score — Technical Checks

Specific tools, URLs, commands, and validation steps for each check in `REFERENCE.md`. SKILL.md references this file. Use the commands here when running the audit.

Replace `[domain]` with the dealer's primary domain (e.g., `example-buickgmc-dealer.com`).

---

## Dimension 1. Performance

### 1.1 LCP on mobile

**Tool.** Google PageSpeed Insights: https://pagespeed.web.dev/

**Steps.**
1. Open PageSpeed Insights.
2. Enter `https://[domain]/`.
3. Click Analyze.
4. Wait for the report.
5. Look at the **Mobile** tab.
6. Find **Core Web Vitals Assessment**. Read the LCP value from the field data (last 28 days of real user data).

**Score.**
- LCP < 2.5s: 8 pts
- LCP 2.5 to 4.0s: 4 pts
- LCP > 4.0s: 0 pts

If field data is not available (low-traffic dealer site), use lab data from the same report instead and flag the limitation.

### 1.2 CLS on mobile

**Same tool, same report.** Find CLS in the Core Web Vitals section.

**Score.**
- CLS < 0.1: 6 pts
- CLS 0.1 to 0.25: 3 pts
- CLS > 0.25: 0 pts

### 1.3 INP on mobile

**Same tool, same report.** Find INP (Interaction to Next Paint).

**Score.**
- INP < 200ms: 6 pts
- INP 200 to 500ms: 3 pts
- INP > 500ms: 0 pts

### 1.4 Desktop Lighthouse score

**Same tool.** Click the **Desktop** tab on the PageSpeed Insights result.

**Score.**
- Lighthouse Performance score 90+: 5 pts
- 70 to 89: 3 pts
- Below 70: 0 pts

---

## Dimension 2. Hosting and infrastructure

### 2.1 Time to First Byte

**Tool.** WebPageTest: https://webpagetest.org

**Steps.**
1. Enter the URL, run a test from a US East location with a "Cable" connection profile.
2. After the test runs, open the **Details** tab.
3. Read TTFB from the waterfall.

Alternative quick check:
```
curl -o /dev/null -s -w "TTFB: %{time_starttransfer}s\n" https://[domain]/
```

**Score.**
- TTFB < 600ms: 4 pts
- TTFB 600ms to 1.5s: 2 pts
- TTFB > 1.5s: 0 pts

### 2.2 CDN in use

**Tool.** WebPageTest result OR curl the response headers.

```
curl -sI https://[domain]/ | grep -iE "cf-|server|cdn|akamai|cloudfront|fastly|x-cache"
```

**Score.**
- CDN identified (Cloudflare, Akamai, Cloudfront, Fastly, Cox Imageria, etc.): 3 pts
- No CDN: 0 pts

### 2.3 HTTP/2 or HTTP/3

```
curl -sI -o /dev/null -w "%{http_version}\n" https://[domain]/
```

**Score.**
- 2 or 3 in output: 2 pts
- 1.1: 0 pts

### 2.4 No 5xx response codes

**Sample 10 pages** (home, SRP, VDP, service, finance, about, staff, hours, contact, reviews).

```
for path in / /new-vehicles/ /used-vehicles/ /service/ /finance/ /about/ /staff/ /hours/ /contact/ /reviews/; do
  curl -sI -o /dev/null -w "%{http_code} $path\n" https://[domain]$path
done
```

**Score.**
- All 10 return 200 (or 301 redirect to 200): 1 pt
- Any 5xx: 0 pts

---

## Dimension 3. Crawlability

### 3.1 robots.txt is valid and not blocking

```
curl -sL https://[domain]/robots.txt
```

Verify:
- Returns 200.
- No `Disallow: /` under `User-agent: *`.
- No Disallow of critical paths (/new-vehicles/, /used-vehicles/, /service/, /finance/, /).

**Score.**
- Valid and not blocking: 3 pts
- Blocking critical paths: 0 pts
- Missing or malformed: 0 pts

### 3.2 AI crawlers not blocked

Same robots.txt content. Search for User-agent blocks for each:
```
curl -sL https://[domain]/robots.txt | grep -iE "GPTBot|ClaudeBot|PerplexityBot|Google-Extended"
```

**Score.**
- All four allowed (or not mentioned, default-allow): 2 pts
- One blocked: 1 pt
- Multiple blocked: 0 pts

### 3.3 sitemap.xml accessible and current

```
curl -sIL https://[domain]/sitemap.xml | head -5
curl -sL https://[domain]/sitemap.xml | head -30
```

Verify:
- Returns 200.
- Contains current `<lastmod>` dates (within 7 days).
- Confirm submission in Google Search Console (ask user to verify).

**Score.**
- Valid, current, submitted: 3 pts
- Valid but stale: 1 pt
- Missing: 0 pts

### 3.4 Indexability in Google Search Console

**Tool.** Google Search Console → Coverage report.

Ask the user to:
1. Open GSC for the property.
2. Click **Pages** in the left nav.
3. Read the "Indexed" count vs total submitted URLs.

**Score.**
- 95%+ indexed: 2 pts
- 80% to 95% indexed: 1 pt
- Below 80%: 0 pts

---

## Dimension 4. Security

### 4.1 HTTPS enforced

```
curl -sI -o /dev/null -w "%{http_code} %{url_effective}\n" http://[domain]/
```

Verify the response is 301 to https://.

Also check a random deep page:
```
curl -sI -o /dev/null -w "%{http_code}\n" http://[domain]/new-vehicles/
```

**Score.**
- HTTP redirects to HTTPS on all sampled pages: 4 pts
- HTTPS available but HTTP not redirected: 2 pts
- HTTPS missing: 0 pts

### 4.2 SSL certificate valid and modern

**Tool.** SSL Labs: https://www.ssllabs.com/ssltest/

Enter the domain, wait for the test. Look for:
- Grade A or A+
- TLS 1.2 or 1.3 supported
- Certificate not expiring within 30 days

Quick check:
```
echo | openssl s_client -connect [domain]:443 -servername [domain] 2>/dev/null | openssl x509 -noout -dates
```

**Score.**
- Valid, modern TLS, not expiring soon: 2 pts
- Valid but using old TLS or expiring within 30 days: 1 pt
- Invalid: 0 pts

### 4.3 HSTS header set

```
curl -sI https://[domain]/ | grep -i "strict-transport-security"
```

Verify the header is present and `max-age` is at least 15768000 (6 months).

**Score.**
- HSTS present with 6-month max-age: 2 pts
- Missing or short: 0 pts

### 4.4 No mixed content

**Tool.** Browser DevTools → Console.

Load https://[domain]/ in Chrome with DevTools open. Check the Console tab for "Mixed Content" warnings.

Alternative:
```
curl -sL https://[domain]/ | grep -iE 'src="http:|href="http:'
```

**Score.**
- No mixed content: 2 pts
- One or more violations: 0 pts

---

## Dimension 5. Schema and structured data

### 5.1 AutoDealer schema

**Tool.** Google Rich Results Test: https://search.google.com/test/rich-results

Enter the home page URL. Check for AutoDealer entity in the parsed output.

Or directly:
```
curl -sL https://[domain]/ | grep -A 30 '"@type":"AutoDealer"'
```

**Score.**
- Present with all required fields (name, address, telephone, brand, openingHours): 3 pts
- Present but missing fields: 1 pt
- Missing: 0 pts

### 5.2 Vehicle schema on VDPs

Sample 3 VDPs (one new, one used, one CPO). Test each in Rich Results Test.

**Score.**
- All 3 VDPs have Vehicle schema with VIN, brand, model, mileage, and Product wrapper with offers: 3 pts
- Some VDPs have it: 1 pt
- No VDPs have it: 0 pts

### 5.3 LocalBusiness with consistent NAP

Read schema NAP from home page (curl + grep), compare to GBP and OEM locator.

**Score.**
- All sources match: 2 pts
- Any inconsistency: 0 pts

### 5.4 No schema validation errors

Use the Rich Results Test on home, an SRP, and a VDP.

**Score.**
- No errors on all three: 2 pts
- Warnings only: 1 pt
- Errors: 0 pts

---

## Dimension 6. Mobile experience

### 6.1 Viewport meta tag

```
curl -sL https://[domain]/ | grep -i "viewport"
```

Verify the meta tag is present with `width=device-width, initial-scale=1`.

**Score.**
- Present: 2 pts
- Missing: 0 pts

### 6.2 Touch targets sized appropriately

**Tool.** Lighthouse mobile audit (Chrome DevTools).

Run a Lighthouse audit on the home page with the Mobile profile. Look for the "Tap targets are sized appropriately" check.

**Score.**
- Pass: 2 pts
- Warning (some undersized): 1 pt
- Fail: 0 pts

### 6.3 Mobile page weight under 3 MB

**Tool.** WebPageTest with mobile profile, or Chrome DevTools Network panel with mobile throttling.

Measure total bytes transferred on home, SRP, and VDP.

**Score.**
- All three under 3 MB: 3 pts
- 3 to 5 MB: 1 pt
- Over 5 MB: 0 pts

### 6.4 Mobile-friendly Lighthouse

Same Lighthouse audit. Read the Performance score (mobile profile).

**Score.**
- Mobile Performance score > 80: 3 pts
- 60 to 80: 1 pt
- Below 60: 0 pts

---

## Dimension 7. Accessibility

### 7.1 Alt text coverage

**Tool.** Lighthouse → Accessibility audit. Look for the "Image elements have `[alt]` attributes" check.

Or:
```
curl -sL https://[domain]/ | grep -oE "<img [^>]*>" | grep -v "alt=" | wc -l
```

**Score.**
- 95%+ coverage: 2 pts
- 70% to 95%: 1 pt
- Below 70%: 0 pts

### 7.2 Color contrast

Lighthouse Accessibility audit. "Background and foreground colors have a sufficient contrast ratio."

**Score.**
- Pass: 1 pt
- Fail: 0 pts

### 7.3 ARIA labels and semantic HTML

Lighthouse Accessibility audit. Check for "Form elements have associated labels", "Buttons have an accessible name", "Document has a `<title>` element".

**Score.**
- All pass: 1 pt
- Multiple fails: 0 pts

### 7.4 Keyboard navigable

Manual check. Open the site in Chrome. Press Tab repeatedly. Verify focus indicators are visible and reach all interactive elements (nav links, search, forms, chat).

**Score.**
- All reachable with visible focus: 1 pt
- Multiple unreachable: 0 pts

---

## Dimension 8. Third-party tag bloat

### 8.1 Third-party request count

**Tool.** WebPageTest result → Domains tab. Count the number of distinct third-party domains making requests on the home page.

Or Chrome DevTools → Network → filter by third-party.

**Score.**
- Under 25: 4 pts
- 25 to 50: 2 pts
- Over 50: 0 pts

### 8.2 Render-blocking third-party scripts

Lighthouse → Eliminate render-blocking resources audit.

**Score.**
- No render-blocking third-party scripts in head: 3 pts
- 1 to 3: 1 pt
- More than 3: 0 pts

### 8.3 Chat widget impact

Inspect the home page in DevTools. Determine if chat (Gubagoo, ActivEngage, Drift, etc.) is eager-loaded (in head/body) or lazy-loaded (loaded after window.onload or on user interaction).

**Score.**
- Lazy-loaded: 2 pts
- Eager-loaded: 0 pts

### 8.4 Inactive or duplicate tags

Use Google Tag Assistant or manually inspect GTM container for inactive tags. Look for:
- Duplicate Google Analytics or GTM containers
- Expired retargeting pixels from previous vendors
- Old DCM/Floodlight tags from past campaigns

**Score.**
- Clean: 1 pt
- Multiple inactive tags: 0 pts

---

## Dimension 9. Conversion elements

### 9.1 Click-to-call functional

```
curl -sL https://[domain]/ | grep -oE 'tel:[^"]+' | head -3
```

Verify phone numbers are wrapped in `tel:` links.

**Score.**
- Yes: 1 pt
- Plain text only: 0 pts

### 9.2 Lead forms submit successfully

Manually submit the contact form, finance pre-qualification form, and service scheduler with test data. Verify a confirmation page or success message appears.

**Score.**
- All three submit successfully: 2 pts
- One broken: 1 pt
- Multiple broken: 0 pts

### 9.3 Primary CTA above the fold on mobile

Open the home page on a mobile device (or DevTools mobile emulation). Verify a clear "Shop new vehicles", "Get pre-approved", "Schedule service", or similar CTA is visible without scrolling.

**Score.**
- Yes: 1 pt
- CTA below the fold or missing: 0 pts

### 9.4 SRP filters functional

Use the SRP filters (make, model, price range, year). Verify results update within 2 seconds without errors.

**Score.**
- Functional and fast: 1 pt
- Broken or slow: 0 pts

---

## Dimension 10. Dealer-specific signals

### 10.1 VDP load time under 3 seconds

PageSpeed Insights on a random VDP. Read the LCP from mobile field data.

**Score.**
- VDP LCP under 3s: 2 pts
- 3 to 5s: 1 pt
- Over 5s: 0 pts

### 10.2 Inventory feed indexed

GSC Coverage report. Filter by URL pattern matching VDP URLs (e.g., `/vehicle-details/` or `/inventory/`). Verify 95%+ indexed.

**Score.**
- 95%+ indexed: 1 pt
- Below 95%: 0 pts

### 10.3 OEM compliance markings present

Verify the home page and inventory page contain:
- Manufacturer brand logos (GMC, Buick, Ford, etc.)
- Required disclosure footers (e.g., "Vehicle pricing and availability subject to change")
- Brand-mandated content per OEM agreement

**Score.**
- Present: 1 pt
- Missing or inadequate: 0 pts

### 10.4 Service scheduler accessible

Click the service scheduler from the home page navigation. Verify it loads, allows date and time selection, and submits without errors on mobile.

**Score.**
- Functional on mobile: 1 pt
- Broken or hidden: 0 pts

---

# Quick command bundle for a fast audit

For an audit running in agent-driven mode (Mode B), this batch covers most of the curl-able checks:

```bash
DOMAIN="[domain]"

# Headers and version
curl -sI -o /dev/null -w "HTTP/%{http_version} %{http_code} TTFB=%{time_starttransfer}s\n" https://$DOMAIN/

# Robots and sitemap
curl -sL https://$DOMAIN/robots.txt | head -40
curl -sIL https://$DOMAIN/sitemap.xml | head -3

# HTTPS redirect
curl -sI -o /dev/null -w "HTTP-to-HTTPS: %{http_code}\n" http://$DOMAIN/

# HSTS
curl -sI https://$DOMAIN/ | grep -i "strict-transport-security"

# CDN detection
curl -sI https://$DOMAIN/ | grep -iE "cf-|server|cdn|akamai|cloudfront|fastly|x-cache"

# Viewport meta
curl -sL https://$DOMAIN/ | grep -i "viewport"

# Schema presence
curl -sL https://$DOMAIN/ | grep -c '"@type":"AutoDealer"'

# Page sample for 5xx
for path in / /new-vehicles/ /used-vehicles/ /service/ /finance/; do
  curl -sI -o /dev/null -w "%{http_code} $path\n" https://$DOMAIN$path
done
```

The browser-required checks (Core Web Vitals, Lighthouse audits, mobile experience, form submission) need to be performed in Mode A by the user pasting tool results, or in Mode B by an agent with browser tools.
