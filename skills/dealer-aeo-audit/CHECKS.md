# Dealer AEO Audit — Technical Checks

Specific commands, queries, and validation steps for each of the 30 checks in `REFERENCE.md`. SKILL.md references this file. Use the commands here when running the audit so users see the exact verification, not a vague description.

Replace `[domain]` with the dealer's primary domain (e.g., `example-buickgmc-dealer.com`). Replace `[brand]`, `[city]`, `[model]`, `[zip]` with the dealer's specifics.

---

## Dimension 1. AI crawler access

### 1.1 GPTBot is not blocked

**Check.**
```
curl -sL https://[domain]/robots.txt | grep -i -A 2 "GPTBot"
```

**Pass.** No "Disallow" line under a `User-agent: GPTBot` block. Or no GPTBot mention at all (default-allow).

**Fail.**
```
User-agent: GPTBot
Disallow: /
```

**Fix.** Remove the Disallow line, or change the user-agent default. On Dealer.com or DealerOn, this often requires a vendor change request.

---

### 1.2 ClaudeBot, PerplexityBot, Google-Extended

**Check.**
```
curl -sL https://[domain]/robots.txt | grep -i -E "ClaudeBot|PerplexityBot|Google-Extended"
```

**Pass.** No Disallow under any of the three user-agent blocks.

**Fail.** Any Disallow.

**Notes.** Some platforms ship robots.txt with all four bots (GPTBot, ClaudeBot, PerplexityBot, Google-Extended) disallowed by default "for SEO protection." That is wrong for AEO. They need to be allowed.

---

### 1.3 No platform-level blocking

**Check.** Ask the dealer's platform vendor:
- DealerOn: "Is GPTBot, ClaudeBot, and PerplexityBot allowed in our robots.txt? Are there any platform-side WAF rules or Cloudflare bot management rules blocking AI crawlers?"
- Dealer.com (Cox): Same question, plus check for "Bot Management" rules in the Cox dashboard.
- DealerInspire: Same question.
- Independent platforms (WordPress, etc.): Check Cloudflare or Sucuri WAF rules.

**Pass.** Vendor confirms in writing that the four bots above are allowed at platform, WAF, and CDN levels.

**Fail.** Vendor cannot confirm, or confirms blocking.

---

## Dimension 2. llms.txt presence and quality

### 2.1 llms.txt exists at the root

**Check.**
```
curl -sIL https://[domain]/llms.txt | head -5
```

**Pass.** Returns HTTP 200 and text/plain content-type.

**Fail.** 404.

---

### 2.2 llms.txt is curated, not boilerplate

**Check.**
```
curl -sL https://[domain]/llms.txt
```

**Pass.** The file lists 20 to 50 high-value pages with one-line descriptions. Structure looks like:
```
# Example Dealership
Franchise GMC and Buick dealer in [City, State].

## Inventory
- /new-vehicles/: Current new GMC and Buick inventory
- /used-vehicles/: Used vehicle inventory across all brands

## Service
- /service-center/: Service hours, scheduling, brands serviced
- /service-specials/: Current service coupons
```

**Partial.** File exists but contains only the home page, or contains an auto-generated dump of every URL on the site.

**Fail.** No file or empty file.

**Generator.** A free generator for dealer llms.txt is available at dealeraiguy.com/tools.

---

## Dimension 3. Schema markup

### 3.1 AutoDealer schema on the home page

**Check.**
```
curl -sL https://[domain]/ | grep -i -A 50 '"@type":"AutoDealer"'
```

Or use Google's Rich Results Test: https://search.google.com/test/rich-results

**Pass.** AutoDealer entity with: name, address (full PostalAddress), telephone, brand portfolio (as `brand` array), openingHoursSpecification, areaServed.

**Partial.** Entity exists but missing two or more required fields.

**Fail.** No AutoDealer schema, or schema validation errors.

---

### 3.2 Vehicle schema on every VDP

**Check.** Sample three random VDPs (one new, one used, one CPO if available).
```
curl -sL https://[domain]/[vdp-url] | grep -i -A 60 '"@type":"Vehicle"'
```

Or use Google's Rich Results Test on each.

**Pass.** All three VDPs include Vehicle schema with: VIN, brand, model, modelDate, mileageFromOdometer, fuelType, and a Product wrapper with: offers (price, priceCurrency, availability), image, description.

**Partial.** Some VDPs have it, others do not, or required fields missing on some.

**Fail.** No Vehicle schema on any sampled VDP.

---

### 3.3 LocalBusiness schema with consistent NAP

**Check.**
```
curl -sL https://[domain]/ | grep -E '"name"|"telephone"|"streetAddress"|"addressLocality"|"postalCode"' | head -20
```

Compare the values against:
- Google Business Profile
- OEM locator listing
- Apple Maps
- Yelp

**Pass.** All sources show identical name, address, and phone.

**Partial.** One source disagrees.

**Fail.** Multiple sources disagree.

---

### 3.4 FAQPage schema on Q&A pages

**Check.** Identify the service page, finance page, and any buying-help page. For each:
```
curl -sL https://[domain]/[page-url] | grep -i -A 30 '"@type":"FAQPage"'
```

**Pass.** FAQPage schema present with `mainEntity` array of Question/Answer pairs.

**Partial.** Schema present on one page, not others.

**Fail.** No FAQPage schema on any sampled page.

---

## Dimension 4. Entity reinforcement

### 4.1 Google Business Profile claimed and complete

**Check.** Search Google for the dealer's exact name. The GBP knowledge panel should appear on the right side. Verify:
- Claimed (no "Own this business?" link)
- Hours present and current
- Phone number matches website
- Brand portfolio in the "Brands" section
- At least 5 recent photos
- At least one post in the last 30 days
- Service area or service categories listed

**Pass.** All seven items confirmed.

**Partial.** Three to six items confirmed.

**Fail.** Two or fewer items, or unclaimed.

---

### 4.2 NAP consistent across top 10 directories

**Check.** Verify NAP on each:
1. Website footer
2. Google Business Profile
3. Apple Maps (search apple.com/maps or Maps app)
4. Bing Places (bing.com/maps)
5. Yelp
6. BBB
7. OEM locator
8. Facebook (the dealership's official page)
9. Cars.com dealer profile
10. DealerRater profile

**Pass.** All 10 sources show identical NAP.

**Partial.** Up to two inconsistencies.

**Fail.** Three or more inconsistencies, or missing from three or more directories.

---

### 4.3 OEM locator listing matches

**Check.** Find the dealer on the OEM locator:
- GMC: gmc.com → find a dealer
- Buick: buick.com → find a dealer
- Chevrolet: chevrolet.com → find a dealer
- Ford: ford.com → dealer locator
- Stellantis (CDJR): each brand site has its own locator

Compare NAP, hours, brand portfolio, services offered.

**Pass.** All four data points match the website.

**Partial.** One discrepancy.

**Fail.** Multiple discrepancies, or missing from the locator.

---

## Dimension 5. Conversational content

### 5.1 Service page real-question coverage

**Check.** Open the service page in a browser. Search the rendered page (Cmd+F or Ctrl+F) for answers to:
- "How long does an oil change take?"
- "Do you take walk-ins?"
- "What are your service hours?"
- "Do you offer loaners?"
- "What brands do you service?"

**Pass.** Five or more of the questions have direct, plain-language answers on the page or in a linked FAQ.

**Partial.** Two to four answers.

**Fail.** One or fewer, or page is marketing copy only.

---

### 5.2 Buying-help page real-question coverage

**Check.** Identify the buying-help, "how to buy from us," or financing page. Verify answers to:
- "Do you take trades with negative equity?"
- "Can I bring my own financing?"
- "Do you sell to out-of-state buyers?"
- "What is your return or exchange policy?"
- "Do you ship vehicles?"

**Pass.** Five or more answered.

**Partial.** Two to four answered.

**Fail.** One or fewer, or page does not exist.

---

### 5.3 Plain language, not marketing copy

**Check.** Read three random paragraphs on the home page, the service page, and the about page. Count how many sentences read like a human explaining the dealership versus how many read like advertising slogans.

**Pass.** More than 70% of sentences are explanatory.

**Partial.** Mixed (40-70% explanatory).

**Fail.** Mostly slogans, headlines, and marketing phrases.

---

## Dimension 6. Third-party citations

### 6.1 Local press in the last 12 months

**Check.** Search Google with:
```
"[dealership name]" site:[local newspaper domain] OR site:[local TV station domain]
```

Also search:
```
"[dealer principal name]" "[city]"
```

**Pass.** At least one indexable article in the last 12 months.

**Partial.** Article exists but is older than 12 months.

**Fail.** No press mention found.

---

### 6.2 OEM press release or recognition

**Check.** Search:
```
"[dealership name]" site:gmc.com OR site:gm.com OR site:ford.com OR site:stellantis.com
```

Also search general web for OEM awards:
```
"[dealership name]" "Mark of Excellence" OR "President's Award" OR "Dealer of the Year"
```

**Pass.** At least one OEM-hosted recognition page or press release.

**Partial.** Award exists but only mentioned on the dealer's own site.

**Fail.** No OEM recognition.

---

### 6.3 Trade publication mention

**Check.** Search:
```
"[dealership name]" site:autonews.com OR site:wardsauto.com OR site:digitaldealer.com OR site:dealermagazine.com OR site:fi-magazine.com
```

**Pass.** At least one mention in the last 24 months on a trade publication.

**Partial.** Mention exists but older than 24 months.

**Fail.** No trade mention.

---

## Dimension 7. Review velocity and breadth

### 7.1 Fresh Google reviews

**Check.** Open the GBP. Sort reviews by "Newest." Count reviews in the last 30 days and last 90 days.

**Pass.** Five or more in last 90 days, with at least one in the last 30 days.

**Partial.** One to four in last 90 days.

**Fail.** Zero in the last 90 days.

---

### 7.2 Cross-platform review presence

**Check.** Verify at least one review in the last 90 days on each:
- Google
- Yelp
- DealerRater
- Cars.com

**Pass.** Active on all four.

**Partial.** Active on two or three.

**Fail.** Active on one or zero.

---

### 7.3 Review velocity is steady

**Check.** Scroll the Google reviews timeline. Look for the pattern of dates over the last 12 months.

**Pass.** Reviews land in a regular cadence (a handful per month, every month).

**Partial.** Bursts of reviews around obvious campaign windows, with quiet stretches in between.

**Fail.** A large burst (10+ reviews in one week) followed by silence, or only a single recent burst with no historical pattern.

---

## Dimension 8. Live AI engine spot-check

For Mode B (agent-driven), run these queries directly. For Mode A (guided), ask the user to run them.

### 8.1 ChatGPT brand+city query

**Query.** Open ChatGPT (with browsing enabled or in the default model): `"best [brand] dealer near [city]"`.

**Pass.** The dealership is named in the answer with accurate address and hours.

**Partial.** Mentioned but with errors (wrong address, wrong hours).

**Fail.** Not mentioned.

---

### 8.2 Perplexity targeted query

**Query.** Open Perplexity: `"where to buy a [popular model the store sells] in [metro area]"`.

**Pass.** Dealership cited with source link.

**Partial.** Mentioned in the answer without a direct citation, or mentioned with errors.

**Fail.** Not mentioned.

---

### 8.3 Gemini service query

**Query.** Open Gemini: `"where to get my [brand] [model] serviced in [zip code or city]"`.

**Pass.** Dealership named with correct service hours and address.

**Partial.** Mentioned with errors.

**Fail.** Not mentioned.

---

### 8.4 Brand-name lookup accuracy

**Query.** Ask each of ChatGPT, Perplexity, and Gemini directly: `"tell me about [dealership name]"`.

**Pass.** All three return accurate hours, address, brand portfolio, and key staff names.

**Partial.** Two of three are accurate.

**Fail.** One or zero are accurate.

---

## Dimension 9. Page-level AEO signals

### 9.1 "Who we are" answer in first 100 words

**Check.** Read the first paragraph of the home page (the first 100 words of body text). Look for the dealership name, brand portfolio, city, and one differentiating fact.

**Pass.** All four present.

**Partial.** Two or three present.

**Fail.** One or zero present, or the home page leads with a marketing slogan and no entity information.

---

### 9.2 Q&A is in extractable HTML

**Check.** View source on the service and finance pages. Look for `<h2>` or `<h3>` containing questions, followed by `<p>` answers. Or `<dt>`/`<dd>` pairs. Or FAQPage schema-marked questions.

**Pass.** Q&A is in extractable structure.

**Partial.** Q&A exists but hidden behind accordion JavaScript that requires a click to expand.

**Fail.** No Q&A, or Q&A is in PDF or image only.

---

### 9.3 No JavaScript-rendered content blocking

**Check.** Disable JavaScript in your browser (DevTools → Settings → "Disable JavaScript") and reload the home page, the service page, and a VDP. Verify the key information (NAP, hours, brand portfolio, vehicle data) is still visible.

Alternative check:
```
curl -sL https://[domain]/ | grep -i -E "address|phone|hours|brand"
```

**Pass.** Key information renders in raw HTML.

**Partial.** Some information renders, some requires JS.

**Fail.** Page is blank or skeleton without JS.

---

## Dimension 10. Technical AEO foundation

### 10.1 Sitemap.xml accessible and current

**Check.**
```
curl -sIL https://[domain]/sitemap.xml | head -5
```

Then:
```
curl -sL https://[domain]/sitemap.xml | head -50
```

Verify the most recent `<lastmod>` is within the last 7 days, and that the file references real current URLs.

Also confirm submission in Google Search Console (sitemap should be listed and last fetched recently).

**Pass.** Returns 200, current, submitted in GSC, last fetched within the last 7 days.

**Partial.** Returns 200 but stale (last modified older than 30 days) or not submitted in GSC.

**Fail.** 404 or returns errors.

---

### 10.2 Pages return 200, no slow-loading interstitials

**Check.** Sample three pages (home, an SRP, a VDP):
```
curl -sI -o /dev/null -w "%{http_code} %{time_total}s\n" https://[domain]/[page]
```

Open each in a browser. Check for:
- HTTP 200
- Time to first byte under 1 second
- No cookie banner that blocks scrolling
- No "please verify you are human" Cloudflare/Sucuri challenge for normal users

**Pass.** All three return 200 fast with no blocking interstitials.

**Partial.** One page slow or has minor banners.

**Fail.** Pages slow (over 3 seconds), 4xx/5xx errors, or hard interstitials.

---

# Quick AEO query bank

For dealers running the audit themselves, copy these queries directly. Replace `[brand]`, `[city]`, `[zip]`, `[model]` with the dealer's specifics.

**Visibility queries:**
1. `"best [brand] dealer near [city]"`
2. `"where to buy a [model] in [city]"`
3. `"where to get my [brand] serviced in [zip]"`
4. `"most reputable [brand] dealer in [metro]"`
5. `"who has the best [brand] inventory near me" (geo-tagged)`

**Accuracy queries:**
6. `"tell me about [dealership name]"`
7. `"hours for [dealership name]"`
8. `"phone number for [dealership name]"`
9. `"who is the GM of [dealership name]"`
10. `"what brands does [dealership name] sell"`

Run all ten across ChatGPT, Perplexity, and Gemini at minimum. Repeat monthly to track improvement after fixes ship.
