# Dealer VDP Merchandising Review — Reference Framework

The 10-dimension framework, scoring rubric, and brand-neutral checks. SKILL.md references this file. Read it before auditing any VDP.

Maximum score: 100 points across 10 dimensions. When the user audits a subset of dimensions, the max scales accordingly.

---

## Dimension weights (at a glance)

| # | Dimension | Weight |
| --- | --- | --- |
| 1 | Photo coverage and quality | 18 |
| 2 | Description quality and uniqueness | 12 |
| 3 | Pricing transparency | 12 |
| 4 | Vehicle data completeness | 10 |
| 5 | Schema markup | 10 |
| 6 | Calls to action (CTAs) | 8 |
| 7 | Trust signals | 10 |
| 8 | Cross-sell elements | 6 |
| 9 | Mobile UX | 8 |
| 10 | OEM compliance | 6 |
| | **Total** | **100** |

Photo coverage carries the highest weight because photos drive VDP click-through and conversion more than any other element. Description quality and pricing transparency are tied for second because their absence kills trust at a stage where trust is everything.

---

## Bands

**90 to 100. A.** Excellent. Top decile of dealer VDPs. Strong conversion potential.

**80 to 89. B.** Good. Solid foundation with manageable gaps.

**70 to 79. C.** Average. Most dealer VDPs land here. Real opportunities to improve.

**60 to 69. D.** Below average. Conversion is being suppressed. Vendor escalation likely.

**Below 60. F.** Critical. Fundamental issues blocking conversion. VDP looks abandoned.

---

## Dimension 1. Photo coverage and quality (18 points)

The single biggest VDP driver. Industry data shows VDPs with 24+ photos sell roughly 30% faster than VDPs with under 12.

### 1.1 Photo count (8 pts)

- 24 or more photos: **8 pts**
- 18 to 23: **6 pts**
- 12 to 17: **3 pts**
- Under 12: **0 pts**

### 1.2 Required angles covered (5 pts)

A complete photo set includes: front 3/4, rear 3/4, both side profiles, front straight-on, rear straight-on, dashboard, driver seat, passenger seat, rear seats, cargo area, odometer, key fobs.

- All 12 angles present: **5 pts**
- 9 to 11 angles: **3 pts**
- 6 to 8 angles: **1 pt**
- Under 6: **0 pts**

### 1.3 Photo quality (3 pts)

Lighting, sharpness, framing. No washed-out exposure. No blurry shots. No fingers in frame. No competitor dealer signage visible.

- Consistent quality across all photos: **3 pts**
- Some quality issues: **1 pt**
- Multiple low-quality photos: **0 pts**

### 1.4 Damage and condition disclosure (used vehicles only, 2 pts)

For used VDPs, photos that disclose visible wear, scratches, or condition issues. This builds trust on used inventory.

- Condition photos present and labeled: **2 pts**
- Condition photos present without labels: **1 pt**
- No condition disclosure photos: **0 pts**

For new VDPs, this check awards 2 points by default (not applicable).

---

## Dimension 2. Description quality and uniqueness (12 points)

### 2.1 Description length (3 pts)

- 200 to 600 words: **3 pts**
- 100 to 199 or 601 to 1,000 words: **2 pts**
- Under 100 or over 1,000 words: **0 pts**

Long descriptions hurt VDP performance as much as short ones. The sweet spot is buyer-relevant detail without padding.

### 2.2 Vehicle-specific content (3 pts)

Description names this specific vehicle's actual features, trim, options, and condition. Not boilerplate.

- Specific to this vehicle: **3 pts**
- Generic for this make/model but no specifics: **1 pt**
- Pure boilerplate: **0 pts**

Test: would the description still make sense if the make and model were replaced with another? If yes, it is boilerplate.

### 2.3 Plain language, not marketing copy (3 pts)

Conversational. Factual. No slogans like "stunning beauty", "must see to believe", "won't last".

- Plain language throughout: **3 pts**
- Mixed: **1 pt**
- Mostly marketing copy: **0 pts**

### 2.4 Uniqueness across inventory (3 pts)

When auditing a sample, descriptions across vehicles should be distinct. Identical or near-identical descriptions across multiple vehicles signal feed-generated copy.

For a single-VDP audit, this check is N/A and awards 3 pts by default. For sample audits, check 3 random pairs.

- All sampled VDPs have distinct descriptions: **3 pts**
- Some shared phrasing across VDPs but core content is distinct: **2 pts**
- Most VDPs share substantial text: **0 pts**

---

## Dimension 3. Pricing transparency (12 points)

### 3.1 Price visible above the fold (4 pts)

- Price is the first or second most prominent element on mobile: **4 pts**
- Price visible but buried below other elements: **2 pts**
- No price shown ("Call for price"): **0 pts**

"Call for price" is a major conversion killer. AI engines and buyers both penalize hidden pricing.

### 3.2 Monthly payment estimate shown (3 pts)

- Estimated monthly payment with clear assumptions (down, term, APR): **3 pts**
- Payment shown without assumptions: **1 pt**
- No payment shown: **0 pts**

### 3.3 Pricing fields completeness (3 pts)

- MSRP, sale price, and savings clearly shown (new vehicles): **3 pts**
- Internet price and savings (used vehicles): **3 pts**
- Partial: **1 pt**
- Missing: **0 pts**

### 3.4 Incentive disclosure (2 pts)

- Current OEM incentives, lease specials, or cash-back listed: **2 pts**
- Generic "Ask about specials" without specifics: **1 pt**
- No incentive disclosure: **0 pts**

---

## Dimension 4. Vehicle data completeness (10 points)

### 4.1 Core specs present (4 pts)

VIN, mileage (used), color (exterior + interior), engine, transmission, drivetrain, MPG, body style.

- All 8 fields populated: **4 pts**
- 5 to 7: **2 pts**
- Under 5: **0 pts**

### 4.2 Trim and packages (2 pts)

- Trim level explicitly named, included packages listed: **2 pts**
- Trim only: **1 pt**
- Trim missing or unclear: **0 pts**

### 4.3 Options and features list (2 pts)

- Full options list (10+ specific features named): **2 pts**
- Partial (5 to 9 features): **1 pt**
- Under 5 features named: **0 pts**

### 4.4 Warranty information (2 pts)

- Warranty (factory remaining, CPO warranty, or extended) clearly shown: **2 pts**
- Mentioned but vague: **1 pt**
- Missing: **0 pts**

---

## Dimension 5. Schema markup (10 points)

### 5.1 Vehicle schema present (4 pts)

- Valid Vehicle schema with VIN, brand, model, modelDate, mileageFromOdometer, fuelType: **4 pts**
- Present but missing required fields: **2 pts**
- Missing: **0 pts**

Verify with Google Rich Results Test.

### 5.2 Product wrapper with offer (3 pts)

- Product schema with offers including price, priceCurrency, availability, itemCondition: **3 pts**
- Partial: **1 pt**
- Missing: **0 pts**

### 5.3 Image schema (2 pts)

- Images included as schema array with at least 5 image URLs: **2 pts**
- Images present but not in schema: **1 pt**
- Missing entirely: **0 pts**

### 5.4 No schema errors (1 pt)

- Rich Results Test shows zero errors: **1 pt**
- Warnings or errors: **0 pts**

---

## Dimension 6. Calls to action (8 points)

### 6.1 Primary CTA above the fold (3 pts)

- Clear primary CTA (Schedule Test Drive, Get ePrice, Apply for Financing) visible without scrolling on mobile: **3 pts**
- CTA exists but below the fold or competing with other elements: **1 pt**
- No clear primary CTA: **0 pts**

### 6.2 Secondary CTAs present (2 pts)

- Trade-in tool, financing application, chat link all accessible: **2 pts**
- Some secondaries: **1 pt**
- None: **0 pts**

### 6.3 Sticky CTA on mobile (2 pts)

- Sticky CTA bar at top or bottom of mobile viewport throughout scroll: **2 pts**
- No sticky CTA: **0 pts**

### 6.4 Click-to-call functional (1 pt)

- Phone number is a `tel:` link, dials directly on mobile: **1 pt**
- Plain text phone number only: **0 pts**

---

## Dimension 7. Trust signals (10 points)

### 7.1 Vehicle history report (CarFax or AutoCheck, used only) (4 pts)

- Embedded full report or one-click access to full report: **4 pts**
- Link to report but requires lead capture first: **2 pts**
- No history report: **0 pts**

For new vehicles, this check awards 4 pts by default (not applicable).

### 7.2 Inspection or certification badge (used only) (2 pts)

- Multi-point inspection or CPO badge clearly displayed: **2 pts**
- Mention without visual badge: **1 pt**
- No inspection signal: **0 pts**

For new vehicles, this check awards 2 pts by default.

### 7.3 Dealer reputation indicators (2 pts)

- Star rating or review excerpts visible on VDP: **2 pts**
- Generic "5-star dealer" without source: **1 pt**
- No reputation signals: **0 pts**

### 7.4 Guarantees and policies (2 pts)

- Return policy, satisfaction guarantee, or similar trust language visible: **2 pts**
- Generic mention: **1 pt**
- Missing: **0 pts**

---

## Dimension 8. Cross-sell elements (6 points)

### 8.1 Similar vehicles widget (2 pts)

- Similar VDPs surfaced (same model different trim, same body style different brand, etc.): **2 pts**
- Generic "recommended" without relevance: **1 pt**
- Missing: **0 pts**

### 8.2 Financing calculator (2 pts)

- Interactive payment calculator on the VDP: **2 pts**
- Static payment estimate only: **1 pt**
- Missing: **0 pts**

### 8.3 Trade-in widget (2 pts)

- Interactive trade-in tool linked from VDP: **2 pts**
- Static "trade your car" link: **1 pt**
- Missing: **0 pts**

---

## Dimension 9. Mobile UX (8 points)

### 9.1 Page load under 3 seconds (3 pts)

- VDP LCP under 3 seconds on mobile per PageSpeed Insights: **3 pts**
- 3 to 5 seconds: **1 pt**
- Over 5 seconds: **0 pts**

### 9.2 Photo gallery swipeable on mobile (2 pts)

- Touch swipe between photos works smoothly: **2 pts**
- Photo gallery requires tap-to-advance only: **1 pt**
- Photos cut off or broken on mobile: **0 pts**

### 9.3 Touch targets sized appropriately (2 pts)

- All buttons and links at least 48x48 px with adequate spacing: **2 pts**
- Some touch targets undersized: **1 pt**
- Multiple undersized: **0 pts**

### 9.4 No mobile-specific bugs (1 pt)

- No horizontal scroll, no text cut off, no broken images on mobile: **1 pt**
- One or more visible bugs: **0 pts**

---

## Dimension 10. OEM compliance (6 points)

For dealerships selling new vehicles. For used-only dealers, this dimension is N/A and awards 6 pts by default. See BRAND_STANDARDS.md for brand-specific check details.

### 10.1 Brand logo present and correct (2 pts)

OEM brand logo (GMC, Buick, Chevrolet, Ford, etc.) present in the standard location per brand standards.

- Present and correct: **2 pts**
- Present but wrong placement: **1 pt**
- Missing or wrong brand: **0 pts**

### 10.2 Required disclosures present (2 pts)

OEM-required pricing disclosures (e.g., "$X plus tax, title, tags, dealer fee", "lease excludes destination", "incentives subject to change") present.

- All applicable required disclosures present: **2 pts**
- Some present: **1 pt**
- Missing: **0 pts**

### 10.3 Brand-mandated content (2 pts)

Brand-mandated content varies by OEM. See BRAND_STANDARDS.md for the specific requirements per brand in the dealer's portfolio.

- All brand-mandated content present per BRAND_STANDARDS.md: **2 pts**
- Some present: **1 pt**
- Major elements missing: **0 pts**

---

## How to compute the final score

Sum every check across the selected dimensions. The maximum scales with the dimensions audited (default: 100; if user audits only photos, descriptions, and pricing, max is 42).

For per-VDP grades, apply the band thresholds proportionally to the audited max.

For sample-wide averages, compute the mean score across all audited VDPs.

---

## Customizable mode

The user can subset which dimensions to audit per run. Common subsets:

- **Photo-focused audit:** Dimensions 1 and 2 only. Max 30 pts.
- **Conversion-focused:** Dimensions 3, 6, 7, 8, 9. Max 44 pts.
- **OEM compliance check:** Dimensions 4, 5, 10. Max 26 pts.
- **Used-vehicle focus:** Dimensions 1, 2, 3, 4, 7. Max 62 pts.
- **Technical health:** Dimensions 5, 9. Max 18 pts.

When the user picks a subset, the report only shows those dimensions. The sample average reflects the subset max, not 100.

---

## Identifying systematic vs per-VDP issues

When the same dimension fails on every VDP in a sample, it is almost always one of these:

- **Platform issue.** The website vendor's template does not include the element. Fix: open a ticket with Dealer.com, DealerOn, DealerInspire, or whichever platform.
- **Feed issue.** The inventory feed does not populate the field. Fix: check the inventory management vendor (vAuto, DealerSocket, etc.).
- **Process issue.** The dealer's photographer, recon team, or BDC is not capturing the data. Fix: update the SOP.

The skill calls out the likely owner of the systematic issue in the report. This saves the dealer the diagnostic time.

---

## Common dealer VDP failure modes

These show up consistently. The skill should explicitly flag them when present.

1. **Under 12 photos on used VDPs.** Almost always a photographer or feed issue.
2. **"Call for price" on new vehicles.** Conversion killer. Usually a manager decision; the skill flags but does not push politically.
3. **Identical descriptions across multiple vehicles.** Feed-generated boilerplate. Common on used inventory pages.
4. **Missing Vehicle schema on used VDPs.** Platform default issue or used-vehicle feed integration issue.
5. **No CarFax or AutoCheck on used VDPs.** Usually a vendor integration that was never enabled or expired.
6. **Slow VDP load times.** Often heavy photo files served without optimization, or third-party chat widgets blocking LCP.
7. **No sticky mobile CTA.** Many dealer themes have it but it is disabled by default. Vendor fix.

See BRAND_STANDARDS.md for OEM-specific requirements layered on top of this brand-neutral framework.
