# Dealer CTA Audit — Technical Checks

Specific tools, commands, and verification steps for each dimension. SKILL.md and REFERENCE.md reference this file.

Replace `[domain]` with the dealer's primary domain and `[page-url]` with the specific page being audited.

---

## Dimension 1. Visibility and prominence

### 1.1 Primary CTA above the fold

**Manual check.** Open the page in a browser at mobile width (375px). Without scrolling, is the primary CTA visible?

**Automated assist:**
```bash
# Get viewport meta tag (verify mobile rendering)
curl -sL https://[domain]/[page-url] | grep -i "viewport"
```

**Tool:** Chrome DevTools → Device toolbar → iPhone SE (375x667). Load the page. Take a screenshot of the initial fold. Verify the primary CTA is visible.

### 1.2 Color/contrast hierarchy

**Manual check.** View the page on desktop and mobile. Identify all visible CTAs. Are the primary CTAs visually distinct from secondaries?

Check:
- Background color contrast
- Button size (primary larger than secondary)
- Visual weight (primary heavier or accented)

### 1.3 Sticky mobile CTA

**Manual check.** Load the page on mobile. Scroll. Does a CTA bar persist at top or bottom of viewport throughout scroll?

**DevTools check:**
- Open DevTools → Elements
- Look for elements with CSS `position: fixed` or `position: sticky`
- Verify they contain a CTA (not just ads or navigation)

### 1.4 No CTA overload

**Count visible CTAs in the initial viewport on mobile.** Above-the-fold CTA count = clickable elements that are clearly CTAs (excluding navigation menu items, social icons, language toggle).

Threshold:
- 1 primary + 2-4 secondaries: clean
- 5-6 CTAs: cluttered
- 7+: overload

---

## Dimension 2. Hierarchy

### 2.1 Single primary CTA per page

**Manual check.** Look at the page. Identify what the customer is supposed to do first. Count the number of visually-equally-weighted CTAs competing for that role.

Indicators of multiple primaries:
- Same color, size, prominence on 3+ buttons
- All buttons saying "shop", "schedule", "apply", "get" with similar styling
- No clear visual hierarchy

### 2.2 Secondary CTAs support, not compete

Visual review. Secondary CTAs should be:
- Smaller font or button size
- Lower contrast or outlined-only style
- Subordinate position (below or beside primary, not surrounding it)

### 2.3 Header CTA conflict

**Check the header.** Many dealer themes have a persistent "Schedule Test Drive" or "Get Pre-Approved" CTA in the header. Compare to page-level primary CTAs.

If they're different (header says "Schedule Test Drive", page says "Get ePrice"), they're competing.

### 2.4 Progressive disclosure on long pages

**Scroll the page.** As you scroll past content sections, does the primary CTA reappear or stay accessible (via sticky bar)?

Long pages (1500+ words or 5+ scroll-screens of content) should have the primary CTA at the top, after major sections, and at the bottom.

---

## Dimension 3. Mobile UX

### 3.1 Touch target size

**Tool:** Chrome Lighthouse → Mobile audit → "Tap targets are sized appropriately" check.

```bash
# Or via PSI: https://pagespeed.web.dev
# Enter URL, run mobile audit, check "Tap targets are sized appropriately"
```

Threshold: 48x48 pixels per Lighthouse. Spacing 8 pixels minimum between targets.

### 3.2 Click-to-call functional

**Check for tel: links:**

```bash
curl -sL https://[domain]/[page-url] | grep -oE 'tel:[^"]+'
```

Expected output: `tel:+15551234567` or `tel:555-123-4567` format.

If output is empty but the page shows a phone number, the phone number is plain text (not clickable). Critical issue.

**Functional test:** Open the page on actual mobile (iPhone and Android Chrome). Tap the phone number. Verify the dial dialog appears with the number pre-filled.

### 3.3 Form usability on mobile

**Manual test.** Load form pages on mobile (375x667). Tap each form field:
- Email field → email keyboard appears (with @ key)
- Phone field → numeric keyboard appears
- State dropdown → native picker appears (not custom-styled and broken)
- Date field → native date picker (where appropriate)

Check submit button:
- Reachable without scrolling (or via sticky form section)
- Tap target adequate

### 3.4 No mobile-specific bugs

Test on:
- iPhone Safari (iOS 17+ at 375px width)
- Android Chrome (at 360px width — Galaxy S8 typical)

Look for:
- Horizontal scroll triggered by CTAs
- CTAs overlapping body content
- Sticky CTAs blocking content
- CTAs cut off at viewport edges

---

## Dimension 4. Copy quality

### 4.1 Specific action verbs

**Extract all CTA copy:**

```bash
curl -sL https://[domain]/[page-url] | grep -oE '<button[^>]*>[^<]*</button>'
curl -sL https://[domain]/[page-url] | grep -oE '<a[^>]*class="[^"]*btn[^"]*"[^>]*>[^<]*</a>'
```

Review the extracted CTA text. Flag:
- "Click Here"
- "Learn More"
- "More Info"
- "Submit"
- "Continue"
- "Go"

Compare to dealer-specific better examples in REFERENCE.md.

### 4.2 Customer outcome framing

Read each CTA. Does it emphasize what the customer gets, or what the dealer does?

- "Get My Trade Value" (customer outcome) — good
- "Submit Trade Information" (dealer process) — worse

- "See My Payment Options" (customer outcome) — good
- "Calculate Payment" (dealer process) — okay

### 4.3 Length

Count words per CTA button. 2 to 5 words ideal. 7 words is the upper bound.

### 4.4 No false urgency

Search page text for urgency claims:

```bash
curl -sL https://[domain]/[page-url] | grep -oE -i "limited time|act now|don't miss|hurry|today only"
```

If found, evaluate whether urgency is real (genuine deadline with date) or manufactured.

---

## Dimension 5. Page-type fit

Page-type detection from URL pattern or page content:

- Home: `/`
- SRP: `/new-vehicles/`, `/used-vehicles/`, `/inventory/`, `/?make=`
- VDP: `/vehicle-details/`, `/vdp/`, URL contains VIN
- Service: `/service/`, `/schedule-service/`
- Finance: `/finance/`, `/credit-application/`, `/lease/`
- Contact: `/contact/`, `/contact-us/`
- Location: `/locations/`, `/[city-name]/`

For each detected page type, apply the page-type-specific CTA expectations from REFERENCE.md and check alignment.

---

## Dimension 6. Tracking and measurement

### 6.1 GA4 events on primary CTAs

**Tool:** Google Tag Assistant browser extension (or GA4 DebugView)

Load the page in Chrome with Tag Assistant enabled. Click each primary CTA. Verify a GA4 event fires (with event name like `click_cta`, `lead_form_submit`, etc.).

Without GA4 access, flag as "verification required" in the report and recommend the user confirm with their analytics team.

### 6.2 Google Ads conversion tracking

**Tool:** Google Ads Tag Assistant

Verify conversion tracking codes fire on key CTAs:
- Lead form submit → Google Ads "Lead" conversion
- Phone click → Google Ads "Phone Call" conversion
- Financing application → Google Ads "Financing" conversion

Without Ads access, flag as "verification required."

### 6.3 CallRail or call tracking

**Manual check.** Click the phone number on the page from a different device. Does the call route through a tracking number, or directly to the dealer line?

Look in the page source for CallRail script:

```bash
curl -sL https://[domain]/[page-url] | grep -i "callrail\|invocacenter\|marchex"
```

CallRail integration is the most common dealer call tracking. Other call tracking platforms exist (Invoca, Marchex).

### 6.4 Form submission attribution

**Tool:** GA4 events, GTM dataLayer inspection.

Submit a test form. Check GA4 real-time events. Verify the event includes UTM source/medium attribution OR session source attribution.

---

## Sample audit command bundle

Fast first-pass for an automated CTA audit (some checks require browser/manual):

```bash
DOMAIN="[domain]"
PAGE="[page-url]"

echo "=== Viewport ==="
curl -sL https://$DOMAIN/$PAGE | grep -i "viewport"

echo "=== CTA buttons ==="
curl -sL https://$DOMAIN/$PAGE | grep -oE '<button[^>]*>[^<]*</button>' | head -20

echo "=== CTA links with btn class ==="
curl -sL https://$DOMAIN/$PAGE | grep -oE '<a[^>]*class="[^"]*btn[^"]*"[^>]*>[^<]*</a>' | head -20

echo "=== tel: links ==="
curl -sL https://$DOMAIN/$PAGE | grep -oE 'tel:[^"]+'

echo "=== CallRail / call tracking ==="
curl -sL https://$DOMAIN/$PAGE | grep -i "callrail\|invoca\|marchex" | head -3

echo "=== Sticky positioning (CSS hint) ==="
curl -sL https://$DOMAIN/$PAGE | grep -i "position:.*fixed\|position:.*sticky" | head -3

echo "=== Generic CTA copy patterns ==="
curl -sL https://$DOMAIN/$PAGE | grep -ioE "click here|learn more|more info|submit"

echo "=== Urgency language ==="
curl -sL https://$DOMAIN/$PAGE | grep -ioE "limited time|act now|don't miss|hurry"
```

---

## Tools recommended for full audit

**Free:**
- Google PageSpeed Insights / Lighthouse (tap target sizing, mobile UX scoring)
- Chrome DevTools (mobile emulation, sticky element detection, form testing)
- Google Tag Assistant (GA4 and Ads tag verification)

**Paid (when available):**
- Hotjar or Microsoft Clarity (heatmaps showing where customers actually click vs where CTAs are placed)
- CallRail dashboard (call source attribution)
- Crazy Egg (scroll maps and confetti reports)

**For competitive context:**
- Run the same audit on 2-3 competitor dealer sites in the same market
- Compare CTA hierarchies, mobile UX, and copy patterns
- Identify competitive gaps to exploit

---

## When to flag "verification required"

Some dimensions can't be fully audited without access:

- **GA4 / Ads access required:** Tracking and conversion verification
- **CallRail dashboard access required:** Call source attribution
- **Live device testing required:** Final mobile UX verification
- **CRM access required:** Lead routing and form-to-CRM integration

When the user doesn't provide these accesses, the relevant dimension is scored on what's verifiable from the public web, and the gaps are flagged as "verification required" in the report. The user can re-run the audit with deeper access for higher confidence.
