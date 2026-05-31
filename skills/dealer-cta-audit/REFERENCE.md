# Dealer CTA Audit — Reference Framework

The 6-dimension framework, scoring methodology, and dealer-specific CTA patterns by page type. SKILL.md references this file. Read it before auditing any CTA.

Maximum score: 100 points across 6 dimensions, weighted by impact on conversion.

---

## Dimension weights

| # | Dimension | Weight |
| --- | --- | --- |
| 1 | Visibility and prominence | 25 |
| 2 | Hierarchy (primary vs secondary) | 20 |
| 3 | Mobile UX | 20 |
| 4 | Copy quality | 15 |
| 5 | Page-type fit | 10 |
| 6 | Tracking and measurement | 10 |
| | **Total** | **100** |

Visibility is weighted highest because a CTA the customer doesn't see produces zero conversions regardless of how good the copy or hierarchy is. Mobile UX is weighted heavily because 70%+ of dealer traffic is mobile.

---

## Bands

**90 to 100. A.** Excellent. CTAs drive conversion effectively. Focus on A/B testing for incremental lift.

**80 to 89. B.** Good. Solid CTA architecture with addressable gaps. Quick wins available.

**70 to 79. C.** Average. Most dealer sites land here. Multiple operational gaps suppressing conversion.

**60 to 69. D.** Below average. Significant CTA hierarchy or mobile UX issues. Customers don't know what to do.

**Below 60. F.** Critical. CTAs are systematically failing. Likely vendor template issues. Major rebuild required.

---

## Dimension 1. Visibility and prominence (25 points)

The dimension that gates every other one.

### 1.1 Primary CTA above the fold (10 pts)

On mobile, the page's primary CTA must be visible without scrolling.

- Primary CTA visible above the fold on mobile (375px width): **10 pts**
- Primary CTA visible above the fold on desktop only, below on mobile: **3 pts**
- Primary CTA below the fold on both: **0 pts**

### 1.2 Color/contrast hierarchy (5 pts)

Primary CTA should have visual prominence: distinct color, larger size, or stronger contrast than secondary CTAs.

- Primary CTA visually distinct from secondaries: **5 pts**
- All CTAs styled similarly (visual hierarchy missing): **2 pts**
- Primary CTA blends with body content: **0 pts**

### 1.3 Sticky mobile CTA (7 pts)

Critical for long pages (VDPs, service pages, finance pages). Sticky CTA bar persists at top or bottom of mobile viewport throughout scroll.

- Sticky CTA present on long pages on mobile: **7 pts**
- Sticky CTA on home but not on inventory or service pages: **3 pts**
- No sticky CTA: **0 pts**

### 1.4 No CTA overload (3 pts)

Too many CTAs is as bad as none. Mobile users overwhelmed by 5+ buttons competing for attention.

- 1 primary + 2-4 secondaries per visible viewport: **3 pts**
- 5-6 CTAs (cluttered but readable): **1 pt**
- 7+ CTAs per viewport: **0 pts**

---

## Dimension 2. Hierarchy (primary vs secondary) (20 points)

The page should have a clear most-important action, with secondaries serving it.

### 2.1 Single primary CTA per page (8 pts)

The page tells the customer what to do first. Not 4 competing primaries.

- One clear primary CTA: **8 pts**
- Two competing primaries: **3 pts**
- Three or more competing primaries: **0 pts**

The home page is the most common offender. Many dealer home pages have "Shop New Vehicles" + "Shop Used" + "Schedule Service" + "Apply for Financing" + "Get Pre-Approved" + "Trade Your Car" all styled identically as primary. Customer paralyzed.

### 2.2 Secondary CTAs support, not compete (4 pts)

Secondary CTAs should be visually subordinate (smaller, lower contrast, different color) and support the primary action.

- Clear visual hierarchy: **4 pts**
- Secondaries compete visually: **2 pts**
- No distinction: **0 pts**

### 2.3 No primary CTA conflict with header CTAs (4 pts)

Many dealer sites have a "Schedule Test Drive" CTA in the header that persists on every page, plus a different primary CTA on the page itself. Customer confused.

- Header CTAs subordinate to page-level primary OR contextually consistent: **4 pts**
- Header CTAs and page CTAs compete: **2 pts**
- Multiple conflicting persistent CTAs: **0 pts**

### 2.4 Progressive disclosure on long pages (4 pts)

Long pages (model overviews, service guides, finance guides) should re-present the primary CTA at logical breakpoints (after spec section, after pricing section, after testimonials).

- Primary CTA re-appears at sections: **4 pts**
- Primary CTA only at top and bottom: **2 pts**
- Primary CTA only once at top: **0 pts**

---

## Dimension 3. Mobile UX (20 points)

### 3.1 Touch target size (5 pts)

Buttons and tap targets at least 48x48 px with adequate spacing (8 px minimum between targets).

- All CTAs meet 48x48 px standard: **5 pts**
- Some undersized: **2 pts**
- Many undersized: **0 pts**

### 3.2 Click-to-call functional (8 pts)

Phone numbers wrapped in `tel:` links dial when tapped on mobile.

- All phone numbers are `tel:` links: **8 pts**
- Some phone numbers are tel:, others plain text: **3 pts**
- All phone numbers plain text: **0 pts**

This is one of the highest-impact issues on dealer sites. Mobile users tapping a plain-text phone number don't realize it should dial; conversion lost silently.

### 3.3 Form usability on mobile (4 pts)

Lead forms (contact, finance, trade-in) usable on mobile:
- Input fields sized appropriately
- Keyboard types correct (email keyboard for email field, number keyboard for phone, etc.)
- Submit button prominent and reachable without scroll

- All sampled forms usable on mobile: **4 pts**
- Some forms have UX issues: **2 pts**
- Forms broken on mobile: **0 pts**

### 3.4 No mobile-specific bugs (3 pts)

- No horizontal scroll caused by CTAs
- CTAs don't overlap content
- Sticky CTAs don't block content
- CTAs visible on iPhone Safari AND Android Chrome (both)

- Clean on both platforms: **3 pts**
- Issues on one platform: **1 pt**
- Broken on both: **0 pts**

---

## Dimension 4. Copy quality (15 points)

### 4.1 Specific action verb (5 pts)

CTA copy starts with a specific action verb. Not "Click Here" or "Learn More."

Good examples:
- "Schedule Test Drive"
- "Get My ePrice"
- "Apply for Financing"
- "See This Sierra"
- "Get My Trade Value"

Bad examples:
- "Click Here"
- "Learn More"
- "Submit"
- "Continue"
- "More Info"

Scoring:
- All primary CTAs use specific action verbs: **5 pts**
- Mixed: **2 pts**
- Generic copy site-wide: **0 pts**

### 4.2 Customer outcome over dealer process (5 pts)

CTAs that emphasize what the customer gets convert better than CTAs that emphasize what the dealer does.

Better: "Get My Trade Value" (customer outcome)
Worse: "Submit Trade Information" (dealer process)

Better: "See My Payment Options" (customer outcome)
Worse: "Pre-Qualify" (dealer process — though acceptable)

Better: "Schedule My Test Drive" (customer outcome with possessive)
Worse: "Schedule Appointment" (generic dealer process)

Scoring:
- Customer-outcome framing: **5 pts**
- Mixed: **2 pts**
- All dealer-process framing: **0 pts**

### 4.3 Length appropriate (3 pts)

CTA button copy is short (2 to 5 words ideal, up to 7 acceptable).

- All primary CTAs within length: **3 pts**
- Some long buttons: **1 pt**
- Buttons functioning as headlines (10+ words): **0 pts**

### 4.4 No false urgency (2 pts)

CTAs that use "Limited Time!" "Act Now!" "Don't Miss Out!" without actual scarcity erode trust.

- No false urgency: **2 pts**
- Some manufactured urgency: **1 pt**
- Aggressive false urgency throughout: **0 pts**

---

## Dimension 5. Page-type fit (10 points)

CTAs should match the page's purpose and the customer's likely intent at that page.

### 5.1 Home page (2 pts)

Home page CTA expectations:
- 1 clear primary CTA at hero (typically "Shop New Vehicles", "Schedule Test Drive", or "Get Pre-Approved" depending on dealer strategy)
- 2-4 secondaries (shop used, schedule service, contact, trade)
- Sticky mobile CTA

- Matches expectations: **2 pts**
- Partial: **1 pt**
- Mismatched: **0 pts**

### 5.2 SRP / inventory results page (1 pt)

SRP CTA expectations:
- No single page-level primary CTA (each vehicle card has its own CTAs)
- Filter controls prominent
- Per-vehicle "View Details" or "Get ePrice" CTAs
- Pagination or "Load More" usable on mobile

- Matches: **1 pt**
- Mismatched: **0 pts**

### 5.3 VDP / vehicle detail page (3 pts)

VDP CTA expectations:
- 3-5 CTAs with clear hierarchy: primary (test drive or ePrice), secondaries (financing, trade-in, chat), tertiary (compare, share)
- Sticky mobile CTA bar (essential)
- "Call Dealer" with tel: link
- "Schedule Service" if used vehicle (post-purchase service)

- Matches: **3 pts**
- Partial: **1 pt**
- Mismatched: **0 pts**

### 5.4 Service page (2 pts)

Service page CTA expectations:
- 1 clear primary: "Schedule Service" with online scheduler
- Click-to-call as prominent secondary
- Service department phone number prominent
- Loaner request, shuttle info, hours

- Matches: **2 pts**
- Partial: **1 pt**
- Mismatched: **0 pts**

### 5.5 Finance page (1 pt)

Finance page CTA expectations:
- 1 clear primary: "Apply for Financing" or "Get Pre-Qualified"
- Trade-in tool as secondary
- Finance manager direct contact as tertiary

- Matches: **1 pt**
- Mismatched: **0 pts**

### 5.6 Contact page (1 pt)

Contact page CTA expectations:
- Multiple equal-weight CTAs by department (sales, service, parts, finance)
- Click-to-call essential
- Hours and address prominent
- Form-fill as secondary

- Matches: **1 pt**
- Mismatched: **0 pts**

---

## Dimension 6. Tracking and measurement (10 points)

CTAs you can't measure aren't really CTAs; they're hopes.

### 6.1 GA4 events on primary CTAs (4 pts)

Every primary CTA fires a GA4 event (or a Google Tag Manager-driven equivalent).

- All primary CTAs tracked: **4 pts**
- Some tracked: **2 pts**
- No tracking: **0 pts**

Verification requires GA4 access. When unavailable, flag as "verification required" and recommend the user confirm.

### 6.2 Google Ads conversion tracking on key CTAs (3 pts)

CTAs that map to ad campaigns (lead form submit, click-to-call, financing application) fire Google Ads conversion events.

- All key CTAs converting: **3 pts**
- Partial: **1 pt**
- No Ads conversion tracking: **0 pts**

### 6.3 CallRail or equivalent on click-to-call (2 pts)

Click-to-call from website attributed via CallRail (or competitive call tracking) back to source.

- CallRail integrated and attributed: **2 pts**
- Call tracking present but not attributed: **1 pt**
- No call tracking: **0 pts**

### 6.4 Form submission attribution (1 pt)

Form submissions tracked back to source (organic, paid, direct, referral, social).

- Yes: **1 pt**
- No: **0 pts**

---

## Dealer-specific CTA patterns by page type

A reference for what "right" looks like per page type. Use these when assessing page-type fit (Dimension 5).

### Home page

**Primary CTA options (pick one):**
- "Shop New [Brand] Inventory"
- "Schedule Test Drive"
- "Get Pre-Approved"

**Secondary CTAs (2-4):**
- "Shop Used Vehicles"
- "Schedule Service"
- "Value Your Trade"
- "Contact Us"

**Mobile sticky CTA:**
- "Schedule Test Drive" or "Call Now" (with tel: link)

### SRP (search results)

No single page-level primary; each vehicle card has:
- "View Details" or vehicle name as link
- "Get ePrice"
- Optional: "Schedule Test Drive" per vehicle

### VDP (vehicle detail)

**Primary:**
- "Schedule Test Drive" OR "Get ePrice"

**Secondaries:**
- "Apply for Financing"
- "Value Your Trade"
- "Chat with Us"

**Tertiary:**
- "Compare"
- "Save to Garage"
- "Share"

**Mobile sticky bar:**
- "Schedule Test Drive" + "Call" + "Get ePrice"

### Service page

**Primary:**
- "Schedule Service" (online scheduler link)

**Secondaries:**
- "Service Specials" (link to specials page)
- "Call Service Department" (tel: link)

**Tertiary:**
- "Order Parts"
- "Service Hours"
- "Loaner Request"

### Finance page

**Primary:**
- "Apply for Financing" (or "Get Pre-Qualified")

**Secondaries:**
- "Value Your Trade"
- "Payment Calculator"
- "Contact Finance Manager"

### Contact page

**Equal-weight CTAs:**
- "Call Sales" (tel: link)
- "Call Service" (tel: link)
- "Call Parts" (tel: link)
- "Email Us" (form)
- "Visit Us" (directions)

### Location pages (multi-rooftop dealers)

**Primary per location:**
- "Schedule Test Drive at [Location]" or "Schedule Service at [Location]" depending on page focus

**Secondaries:**
- "Get Directions"
- "Call [Location]"
- "[Location] Hours"

---

## Common dealer CTA failure patterns

After running this audit on enough dealer sites, certain patterns repeat. Flag these proactively when detected.

**Failure 1: 6 competing primary CTAs on the home page.** Customer paralyzed. Pick one. Demote the others.

**Failure 2: Plain text phone numbers (no tel: link).** Mobile users tap and nothing happens. Conversion lost silently. Quick fix.

**Failure 3: No sticky mobile CTA on VDPs.** Long page, scrolled past the CTA, customer reaches end with no action available. Vendor template fix typically.

**Failure 4: "Click Here" or "Learn More" on primary CTAs.** Generic copy converts dramatically worse than specific action verbs.

**Failure 5: Header "Schedule Test Drive" persistent on every page conflicting with page-level CTAs.** Choose: either header CTA is the universal primary, or page-level CTAs win. Don't run both.

**Failure 6: Service page primary CTA is "Contact Us" instead of "Schedule Service".** Service intent is specific; CTA should match.

**Failure 7: Lead forms with 8+ fields on mobile.** Customers bounce. Recommend 4-5 field max for initial capture; defer additional fields to follow-up.

**Failure 8: No GA4 events on primary CTAs.** Conversion can't be measured; marketing optimizations fly blind.

**Failure 9: Click-to-call without CallRail attribution.** Calls happen but the source isn't attributed back; paid media can't optimize.

**Failure 10: Generic stock photography on CTA buttons.** "Apply" with a generic woman-with-laptop image. Specific imagery (this dealer's finance manager, this dealer's lobby) outperforms.

See CHECKS.md for the technical verification commands per check.
