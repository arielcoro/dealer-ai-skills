# Dealer GBP Audit — Technical Checks

Specific tools, URLs, and verification procedures per dimension. SKILL.md and REFERENCE.md reference this file.

Replace `[business name]`, `[city]`, `[state]`, `[oem]`, and `[phone]` with the dealer's actual values.

---

## General access setup

**Mode A (Guided with manager access):**
- Open https://business.google.com/
- Select the dealer location
- Have the Info, Photos, Posts, Reviews, Q&A, Insights tabs ready

**Mode B (Public-search audit):**
- Open Google Search in an incognito window
- Set search location to the dealer's city/state explicitly (search "[oem] dealer [city] [state]" with location set)
- The right-side panel (Knowledge Panel) will show: primary category, NAP, hours, photos, reviews, posts, Q&A
- Then open Google Maps and search the business name to view the full profile

---

## Dimension 1. Primary category

### 1.1 View primary category

**Manager:** GBP manager → Info → Business category. The primary category is at the top.

**Public:** Google Search for the exact business name with location intent. Look at the Knowledge Panel. The text directly below the business name (e.g., "Buick dealer") is the primary category.

### 1.2 Check for keyword stuffing in business name

**Manager:** Info → Business name.

**Public:** Knowledge Panel header text. Compare to legal entity. Look for appended terms like "Dealer," "[OEM] Dealership," "#1," "Best," "of [City]," or any descriptor beyond the legal name.

### 1.3 Cross-check against OEM dealer directory

Open the OEM's dealer locator:
- GM: https://www.gm.com/dealer-locator (or brand-specific: buick.com/dealers, gmc.com/dealers, chevrolet.com/dealers, cadillac.com/dealers)
- Ford: https://www.ford.com/dealerships/
- Stellantis: https://www.chrysler.com/dealer-locator.html (or brand-specific)
- Toyota: https://www.toyota.com/dealers/
- Honda: https://automobiles.honda.com/tools/dealership-locator
- Hyundai: https://www.hyundaiusa.com/us/en/dealer-locator
- Kia: https://www.kia.com/us/en/dealer-locator
- Subaru: https://www.subaru.com/find-a-dealer.html
- Volkswagen: https://www.vw.com/en/dealer-search.html
- Mazda: https://www.mazdausa.com/dealer-locator

Compare the dealer listing on OEM directory to GBP primary category. Look for OEM/category mismatch.

---

## Dimension 2. Secondary categories

**Manager:** Info → Business category → Additional categories list.

**Public (limited):** GMB Everywhere browser extension (Chrome) reveals additional categories on the public listing. Install from Chrome Web Store, navigate to the GBP, click the extension icon.

Verify these categories present per dealer offering:
- Auto repair shop
- Car repair and maintenance
- Oil change service
- Tire shop
- Brake shop
- Auto parts store
- Used car dealer
- Truck dealer (if applicable)
- Auto body shop (if applicable)
- Car finance and loan company (rare but applicable for some F&I-heavy dealers)

---

## Dimension 3. NAP consistency

### 3.1 Business name

Compare:
- GBP name (Manager: Info → Business name. Public: Knowledge Panel header.)
- Website footer (visit the dealer's homepage, scroll to footer)
- Website "About us" page
- OEM dealer directory listing
- Bing Places listing (https://www.bing.com/maps, search business name)
- Apple Maps listing (Maps app on Mac, search business name)
- Yelp listing
- BBB listing

Document any variations.

### 3.2 Address

Same sources as above. Check for:
- Suite/unit number consistency
- Street abbreviation consistency (e.g., "Hwy" vs "Highway," "Rd" vs "Road")
- ZIP+4 consistency
- City/state spelling consistency

### 3.3 Phone

Same sources. Plus:
- Run a reverse lookup on the GBP phone number at https://www.callerid.com/ or similar to verify the number is registered to the dealer.
- Verify if the GBP phone is a CallRail tracking number by checking the area code, comparing to known CallRail number patterns (the dealer's main analytics account would show this), or by calling the number and checking if it routes through tracking.

---

## Dimension 4. Hours of operation

**Manager:** Info → Hours.

**Public:** Knowledge Panel hours section. Click "More hours" to see department breakouts.

### 4.1 Verify current hours
Compare to website Contact page hours.

### 4.2 Verify holiday hours

Check Manager → Hours → Special hours. Look for entries in the past 6 months matching:
- New Year's Day
- Memorial Day
- July 4
- Labor Day
- Thanksgiving (and the day after)
- Christmas Eve and Christmas Day

Public: The Knowledge Panel will display "Hours may differ" warnings on holiday weeks if no special hours are set, which is a soft penalty.

### 4.3 Department breakouts

In the public listing, click "More hours" or "See more hours." If sales/service/parts are listed separately, the dealer has set department hours. If only one set of hours is shown, the breakout is missing.

---

## Dimension 5. Services list

**Manager:** Info → Services. The full list is visible. Add/edit/remove services here.

**Public:** Knowledge Panel "Services" tab or section. The full services list is visible.

Verify per category from REFERENCE.md. The completeness of this list directly affects query eligibility.

---

## Dimension 6. Attributes

**Manager:** Info → From the business (identity attributes) and Health & safety, Service options, Accessibility, Amenities, Crowd, Planning, Payments sections.

**Public:** Knowledge Panel → About → tabs labeled with attribute categories. Most public-facing attributes are visible.

---

## Dimension 7. Photos

### 7.1 Cover and profile

**Manager:** Photos → Cover and Profile tabs.

**Public:** Knowledge Panel header banner is the Cover. Logo at top-left is Profile.

### 7.2 Photo counts

**Manager:** Photos → By you tab shows dealer-uploaded count.

**Public:** Knowledge Panel → "See photos" button → opens Photos modal. The categories (Exterior, Interior, At work, Team, Identifies as) and "By owner" vs "By visitors" tabs show counts.

### 7.3 Vehicle inventory photos

In the Photos modal, scroll through "By owner" photos. Look for current model-year vehicles. Note dates if visible (some photos display upload date on hover/click).

### 7.4 Recency

In Photos modal, click any "By owner" photo. The date the photo was uploaded is shown. Find the most recent.

### 7.5 Customer-vs-owner ratio

Photos modal → switch between "By owner" and "By visitors" tabs. The counts are visible.

---

## Dimension 8. Posts

### 8.1 Post cadence

**Manager:** Posts tab → review chronological list.

**Public:** Knowledge Panel → Posts carousel (appears below header on dealers with active posts). Click to view all.

Count posts per 30-day window over the past 90 days.

### 8.2 Post type

Look at each post for Offer, Event, or Update designation (Manager shows the type when creating; Public displays the post format which makes type visible).

### 8.3 Post quality

Click each post. Verify:
- Image present and high-quality
- CTA button present (Learn more, Order, Buy, Sign up, Reserve)
- CTA URL goes to a dealer-owned landing page (not a generic OEM page)
- URL contains UTM parameters (utm_source=gbp, utm_medium=post, etc.) — visible in the URL after click

---

## Dimension 9. Q&A

**Manager:** No dedicated tab; questions appear in the public listing and notifications.

**Public:** Knowledge Panel → "Questions & answers" section. Click "See all questions" to view all.

### 9.1 Pre-seeded FAQ

Look for questions where the answer is from the dealer (showing "From the owner" or verified-owner badge). These are pre-seeded.

### 9.2 Response rate on customer questions

For each customer-asked question (no "From the owner" tag on the question itself), check if there is a dealer response. Compute the response rate.

### 9.3 Top-voted answers

For each question, the top-voted answer is displayed first. Click "More answers" to see others. Verify the top-voted answer is from the dealer (verified) or is factually correct. Flag any incorrect top answers from customers (e.g., wrong hours, "they don't accept trade-ins," etc.).

---

## Dimension 10. Reviews

### 10.1 Review count

**Public:** Knowledge Panel shows total review count next to the star rating.

Benchmark vs market: search for "[oem] dealer [city]" or look at competitor rooftops in the same metro to estimate median.

### 10.2 Review velocity

Click into the reviews. Sort by Newest. Count reviews per month for the past 6 months.

For a deeper read, paste the dealer's GBP URL into a free tool like LocalFalcon or BrightLocal review trend report (paid). Or manually tally.

### 10.3 Average rating

Visible on the Knowledge Panel header.

### 10.4 Response rate

Scroll through recent reviews (past 6 months). Count reviews with a dealer response (shown indented below the review with "Response from the owner" tag). Compute rate.

### 10.5 Response quality

Read the most recent 25 responses. Classify:
- Personalized: mentions customer name, vehicle, employee, or specific service
- Template: generic "Thank you for your business" with no specifics
- Defensive/argumentative: pushes back on customer claims, blames customer
- Unprofessional: any inappropriate tone

Compute the personalization percentage.

---

## Multi-rooftop group consistency overlay

For dealer groups, repeat the entire audit per rooftop, then assess group-level consistency:

### G1. Naming convention

List all rooftop names. Look for consistency: "[Owner Last Name] [OEM]" vs ad-hoc.

### G2. Primary category

List primary category per rooftop. Cross-check against the rooftop's primary OEM.

### G3. Hours format

Note whether department breakouts are used consistently.

### G4. Phone format

Note whether local vs tracking number is used consistently.

### G5. Review response standard

Compute response rate per rooftop. Note the spread.

### G6. Photo and post cadence

Note the latest dealer-uploaded photo and the latest post per rooftop.

### G7. Duplicate listings

Search Google Maps for the dealer's address and surrounding business names. Duplicate listings often appear with slightly different names (e.g., "Howard Bentley Buick GMC" and "Howard Bentley Buick" as separate listings). Also check OEM directory for the rooftop and compare to the GBP results.

To merge duplicates: Manager → Support → Suggest a merge, or file via the Business Profile Help Community.

---

## Sample audit pass (single rooftop)

A complete public-search audit for a single rooftop takes approximately 45 minutes. Order of operations:

1. Open incognito Chrome with location explicitly set to dealer city.
2. Search "[business name] [city]." Capture Knowledge Panel screenshots.
3. Click "Reviews" and sort by Newest. Capture review velocity, response rate, response quality on the most recent 25.
4. Click "Questions and answers" and capture all questions and answers.
5. Click "Posts" carousel (if present) and capture cadence and content.
6. Click "Photos" and capture counts, recency, ownership ratio.
7. Click "About" tab if present and capture attributes and services.
8. Open OEM dealer directory in a new tab and capture official dealer listing.
9. Open dealer website and capture footer NAP.
10. Open Bing Maps and Apple Maps and capture NAP on each.
11. Score all 10 dimensions using REFERENCE.md.
12. Write up the report using the SKILL.md output structure.

---

## Tooling reference

**Free:**
- Google Business Profile manager: https://business.google.com/
- Google Maps: https://maps.google.com/
- GMB Everywhere browser extension: surfaces additional categories
- Pleper free GBP tools: https://pleper.com/
- BrightLocal free local SEO scanner (limited)

**Paid (helpful for citation work and multi-location):**
- BrightLocal: citation finder, review monitoring, local search rank tracker
- Whitespark: citation builder, local citation finder
- Yext: directory management
- Birdeye, Podium, Reputation.com: review management platforms commonly used by dealer groups

**For dealer-specific competitive context:**
- Search "[oem] dealer near [zip]" in incognito with location set
- Note the top 3 in the local pack
- Audit each competitor GBP with the same framework
- The score delta reveals the competitive gap to close
