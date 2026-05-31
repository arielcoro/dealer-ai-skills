# Dealer GA4 + Conversion Tracking Audit — Technical Checks

Specific paths, screens, and verification procedures per dimension.

Replace `[domain]` with the dealer's primary domain.

---

## Access setup

**GA4:** https://analytics.google.com -> select the property.

**Google Ads:** https://ads.google.com -> select the account. Verify access level (admin or standard).

**GTM:** https://tagmanager.google.com -> select the container.

**Site:** Open `https://[domain]` in Chrome incognito.
- Open DevTools (Cmd+Opt+I on Mac, F12 on Windows).
- Network tab, filter to "collect" (GA4) and "google" (Google Ads).
- Console tab to inspect dataLayer pushes.

**Chrome extensions to install:**
- Google Tag Assistant Companion
- GA Debugger (for legacy compatibility checks)
- GTM/GA Debug

---

## Dimension 1. GA4 property configuration

### 1.1 Property exists and is canonical

- GA4 admin -> Property -> Property details. Note the property ID (G-XXXXXXXXXX).
- Open the website in incognito.
- DevTools -> Network -> filter "collect."
- Click around the site.
- Confirm requests to `https://www.google-analytics.com/g/collect` or `https://analytics.google.com/g/collect`.
- Each request's URL contains `tid=G-XXXXXXXXXX`. Confirm matches the canonical property ID.
- Run the site through Tag Assistant and confirm only one GA4 property is firing.

### 1.2 Data streams

- GA4 admin -> Data Streams. Click the web stream.
- Verify domain matches the dealer's primary domain.
- Enhanced measurement section: confirm Page views, Scrolls, Outbound clicks, Site search, Video engagement, File downloads, Form interactions are enabled.
- Click "Configure tag settings" -> "Define internal traffic." Confirm internal IPs (dealership office, BDC office, agency office if applicable) are defined and the rule "traffic_type = internal" is created.
- GA4 admin -> Data Settings -> Data Filters: confirm a filter excluding internal traffic is in TESTING or ACTIVE state.

### 1.3 Time zone and currency

- GA4 admin -> Property Settings -> Property details.
- Time zone: should match dealership local time.
- Currency: USD.

### 1.4 Data retention

- GA4 admin -> Data Settings -> Data Retention.
- Event data retention: 14 months.
- Reset user data on new activity: on.

### 1.5 Cross-account linking

- GA4 admin -> Product Links.
- Verify Google Ads link is present and active.
- Verify Search Console link is present.
- Verify BigQuery link if dealer has BigQuery enabled.
- Verify Merchant Center link if dealer runs VLA.

---

## Dimension 2. Event taxonomy and key events

### 2.1 Core dealer events

- GA4 admin -> Events. View the full list of events in the last 30 days.
- Look for: form_submit, generate_lead, click_to_call, sms_click, schedule_service, view_vdp, view_srp, get_directions, finance_application_start, finance_application_submit.

If missing, check GTM (Section 9) for tags that should fire these events.

To live-verify, open GA4 DebugView (Admin -> DebugView). Open the website with `?debug_mode=1` appended. Trigger each action (click phone, click directions, submit form, view a VDP). Confirm the event appears in DebugView.

### 2.2 Key events

- GA4 admin -> Events.
- For each conversion-eligible event, confirm the "Mark as Key Event" toggle is on.
- Standard key events: generate_lead, click_to_call, schedule_service, finance_application_submit, get_directions.
- Verify in Google Ads: Tools -> Conversions. The GA4 imported events should appear here.

### 2.3 Event parameters

- GA4 admin -> Custom definitions -> Custom dimensions.
- Confirm dimensions registered: form_type, vehicle_vin, vehicle_make, vehicle_model, vehicle_year, page_type.
- DebugView: trigger a VDP view. Confirm the event includes the vehicle parameters.

### 2.4 No event spam

- GA4 Reports -> Engagement -> Events. Sort by event count.
- Look for any single event with an obviously inflated count (more than the page view count, or events generated per scroll/hover).
- If found, locate the corresponding GTM tag and disable.

---

## Dimension 3. GA4 audiences

### 3.1 Audiences defined

- GA4 admin -> Audiences.
- Verify presence of: VDP viewers (event = view_vdp, last 30 days), SRP-only browsers (event = view_srp AND NOT view_vdp), finance abandoners (event = finance_application_start AND NOT finance_application_submit), service scheduler abandoners, returning visitors.

### 3.2 Audiences in Google Ads

- Google Ads -> Tools -> Audience manager -> Audience sources. Confirm GA4 audiences are imported.
- Audience manager -> Segments. Verify the GA4 audiences appear.

### 3.3 Audiences in active campaigns

- Google Ads -> Campaigns -> any active campaign -> Audiences tab.
- Verify at least one campaign targets or excludes one of the GA4 audiences.

---

## Dimension 4. Google Ads conversion tracking

### 4.1 Conversion actions

- Google Ads -> Tools -> Conversions.
- Inventory:
  - Lead Form Submit (or Submit Lead Form)
  - Phone Call (Click)
  - Phone Call (Call Tracking platform, e.g., CallRail)
  - Finance Application
  - Service Appointment
  - Store Visit (if applicable)
- Click each action. Verify "Value" is set (a dollar value per action). Default Google value is $0 — that is wrong.

### 4.2 Category and counting

- Same screen. Verify "Category" matches the action type.
- "Count" should be:
  - "One" for unique-customer-action items (form submits)
  - "Every" for items where each occurrence is valuable (phone calls might be Every if counted by call)

### 4.3 Attribution

- Same screen. "Attribution model" should be "Data-driven" for primary actions.

### 4.4 Primary and secondary

- Same screen. "Goals" column. Conversion actions used for bidding should be marked "Primary" (default action category). Lower-intent items should be "Secondary" or "Auxiliary."

---

## Dimension 5. GA4-to-Google-Ads import

### 5.1 GA4 events imported

- Google Ads -> Tools -> Conversions. Look for sources marked "Google Analytics 4 (GA4)."
- These should match the Key Events from GA4.

### 5.2 Double-counting

- For any event that also has a native Google Ads tag (e.g., form_submit fires both via GTM Google Ads conversion tag AND via GA4 import), only ONE should be marked Primary. Otherwise the action is double-counted.
- Verify by triggering the action and checking that only one conversion is reported in Google Ads within the next hour.

### 5.3 Cross-account view

- Google Ads -> Tools -> Conversions -> reported count for last 30 days.
- GA4 -> Reports -> Engagement -> Conversions -> same period.
- Compute the delta. Should be within 5 to 10% (some difference is expected due to attribution windows and modeled data).

---

## Dimension 6. Enhanced Conversions

### 6.1 Enhanced Conversions enabled

- Google Ads -> Tools -> Conversions -> click a conversion action -> "Enhanced conversions" section.
- Verify it is ON.
- Verify method: "Google Tag (gtag.js)" if site uses gtag directly, or "Google Tag Manager" if GTM is the implementation.
- For each implementation, the relevant variables (email, phone) must be configured.

To verify Enhanced Conversions is sending data:
- Open the site. Trigger a conversion (submit a test form with a fake but realistic email).
- DevTools Network -> filter "google."
- Look for the gtag/collect request that fires after submit.
- Check the request payload (URL params on GET, or body on POST). Look for parameters like `em` (hashed email), `ph` (hashed phone).
- Confirm the values are SHA-256 hashes (64-char hex strings), not raw values.

### 6.2 Enhanced Conversions for Leads

- Google Ads -> Tools -> Conversions -> the lead conversion action -> "Enhanced conversions for leads" setting.
- Verify the offline upload path is configured.

### 6.3 Hashing verification

- The Enhanced Conversions request body or URL parameters should contain only hashed values.
- Raw email or phone in the request is a privacy violation and must be fixed before another spend.

---

## Dimension 7. Offline conversion import from CRM

### 7.1 Mechanism

Determine which mechanism is in use:

**Option A. Direct API.** Verify a developer-built integration calls the Google Ads Offline Conversions API. Check Google Ads -> Tools -> Conversions -> "Source: Imports."

**Option B. Zapier / Make.** Open the Zap or scenario. Verify it triggers on CRM updates (e.g., DriveCentric lead status changes to "Sold"), pulls GCLID from the CRM lead record, and uploads to Google Ads Offline Conversions.

**Option C. CRM-native integration.** Verify DriveCentric, Tekion, Fullpath, or other CRM has an active Google Ads integration in its settings. Confirm conversions are flowing.

**Option D. BigQuery pipeline.** Verify a Cloud Function or scheduled query exports CRM data and uploads to Google Ads.

**Option E. Manual CSV upload.** Verify weekly or monthly CSV uploads in Google Ads -> Tools -> Conversions -> Uploads.

If none of A-E are in place, score 0 for 7.1.

### 7.2 GCLID capture and storage

Test the GCLID capture:
- Click a Google Ads ad to the site. Verify the URL contains `gclid=...`.
- Submit a lead form on the site.
- Open the CRM. Find the new lead. Check if a GCLID field is populated on the lead record.
- If GCLID is missing, the offline conversion upload cannot match back to the right click and is useless.

Verify the lead form passes GCLID to the CRM. Common methods:
- Hidden form field that captures URL parameter.
- GTM dataLayer push that stores GCLID and submits with form data.
- Cookie that holds GCLID for 90 days (Google's max click-to-conversion window).

### 7.3 Sale data quality

If offline conversions are uploading: pull a sample of recent uploaded conversions in Google Ads. Verify the conversion value is the actual sale value (front-end gross, total deal value, or whatever the dealer's chosen value definition is) rather than a flat lead value.

---

## Dimension 8. Cross-domain tracking

### 8.1 GA4 admin configuration

- GA4 admin -> Data Streams -> the web stream -> Configure tag settings -> Configure your domains.
- Verify all relevant domains are listed:
  - Primary dealer domain
  - Finance application domain (cudl.com, routeone.com, etc.) — if the dealer's app is hosted there
  - Service scheduler domain — if separate
  - Spanish version subdomain (if applicable)

### 8.2 GTM / gtag on cross-domain pages

For each cross-domain destination, open the page and check:
- DevTools Network -> filter "collect."
- Confirm GA4 tracking calls fire on the destination page.

### 8.3 Parameter survival

- Click a Google Ads ad to the dealer site. Note the GCLID in the URL.
- Navigate to a cross-domain page (e.g., click the "Apply for Financing" button that takes you to CUDL).
- Check the destination URL. Verify GCLID and UTM parameters are preserved (linker parameter `_gl=...` should be present).

If parameters are lost: configure the GA4 Linker in the GA4 tag settings and ensure both domains have GA4 tags.

---

## Dimension 9. GTM container hygiene

### 9.1 Container present

- View page source on the dealer homepage. Search for `googletagmanager.com/gtm.js?id=GTM-`.
- Confirm GTM container ID is present and matches the dealer's container.
- GTM admin -> Workspace -> recent versions. Verify version notes describe what was published.

### 9.2 Tag inventory

- GTM admin -> Tags.
- Sort by tag firing count (Versions -> Latest -> Tag firings in past 30 days).
- Count active tags. Identify tags that have not fired in the past 90 days as orphans.
- Identify tags with vendor names that no longer apply (former chat vendors, former pixel partners, former analytics platforms).

### 9.3 Tag conflicts

- Filter Tags by "Google Analytics 4." Confirm only ONE GA4 Configuration tag exists.
- Filter Tags by "Google Analytics: Universal Analytics." If any UA tags are present, they should be paused or removed. UA stopped processing data in July 2024.
- Search for duplicate conversion tags: filter Tags by "Google Ads Conversion Tracking" or "Google Ads Remarketing." Verify each conversion action has only one tag firing it.

### 9.4 Trigger discipline

- For each active tag, examine its triggers.
- Look for "All Click Links" or "All Click Elements" triggers that fire on every click. These usually inflate event counts and should be replaced with specific triggers.
- Look for triggers that fire on every page view but should be event-specific.

### 9.5 Variables

- GTM admin -> Variables.
- Built-in variables: Page URL, Click Element, Form ID, etc. should be enabled where used.
- User-Defined Variables: dataLayer variables, Custom JavaScript should map cleanly to event parameters.

---

## Dimension 10. Server-side tagging and consent mode

### 10.1 Consent Mode v2

View page source on the dealer homepage. Search for:
- A Consent Management Platform (CMP) script: OneTrust (cookielaw.org), Cookiebot (cookiebot.com), CookieYes, Iubenda, or custom.
- The Google Consent Mode initialization: `gtag('consent', 'default', ...)`.
- The consent banner that fires on first visit.

Open the site in incognito. Refuse the consent banner. Then:
- DevTools Network -> filter "collect."
- Confirm GA4 collect requests still fire but include `gcs=G100` or similar denying parameters.
- Confirm Google Ads conversion pixels do not fire (or fire with denied state).

If Consent Mode v2 is missing, in California, Virginia, Colorado, Connecticut, Utah, and an increasing list of states, there is regulatory exposure. The audit should flag this even if the dealer is not yet sued.

### 10.2 Server-side tagging

Check for server-side GTM. Look for a custom domain serving GTM (e.g., `gtm.dealersite.com` or `tags.dealersite.com`) in DevTools Network requests.

If server-side is not in use, evaluate whether it should be. Server-side is recommended for:
- Dealers spending more than $50K/month on paid media (measurement durability matters more)
- Dealers with strong first-party data strategies
- Dealers concerned about iOS Safari restrictions and ad blockers

If server-side is reasonably deferred (small dealer, sub-$10K/month spend), score 7.10 partial credit and document the deferred rationale.

### 10.3 First-party data strategy

- Examine the dealer's data capture: email and phone collected on form submits, finance app, service scheduling, newsletter signups.
- Examine the CRM: verify first-party data is stored with consent.
- Examine Google Ads -> Tools -> Audience manager -> Customer Lists. Verify a customer list (Customer Match) has been uploaded and is active.

---

## The reconciliation analysis

For dealer principals, the headline output is the reconciliation gap.

### Procedure

1. **Pull GA4 reported conversions, past 30 days.**
   - GA4 -> Reports -> Acquisition -> Traffic acquisition.
   - Set the date range to past 30 days.
   - Filter to Source/Medium = google / cpc.
   - Note the "Conversions" column total. This is what GA4 reports.

2. **Pull CRM lead count, past 30 days.**
   - In DriveCentric, Tekion, CDK, or Fullpath, filter leads by source = "Google Ads" or "Paid Search" or whatever source labeling the dealer uses.
   - Date range: past 30 days.
   - Note the lead count.

3. **Compute the gap.**
   - Gap % = (CRM leads - GA4 conversions) / CRM leads * 100
   - Positive gap: GA4 under-reports (common; could mean broken tracking on some forms, lost cross-domain attribution, calls not synced).
   - Negative gap: GA4 over-reports (uncommon; could mean double-counting, internal traffic not filtered, bot traffic).

4. **Identify the likely cause from the dimension findings.**
   - Large positive gap and no offline conversion import: Dimension 7 is the root cause.
   - Large positive gap and broken cross-domain: Dimension 8.
   - Large positive gap and missing call tracking integration: Dimension 4.1 / dealer-call-tracking-audit.
   - Negative gap and double-counting: Dimension 5.2.

5. **Report the single highest-priority fix to close the gap.**

This reconciliation is the part that turns the audit into a dealer-principal-relevant deliverable. Without it, the audit reads as technical noise.

---

## Tooling reference

**Free:**
- GA4 DebugView: https://analytics.google.com -> Admin -> DebugView
- Google Tag Assistant Companion (Chrome extension)
- GA Debugger (Chrome extension)
- GTM/GA Debug (Chrome extension)
- Chrome DevTools Network tab (filter "collect," "google")
- Google Ads Tag Assistant within Google Ads

**Paid (used by some dealers and agencies):**
- ObservePoint: automated tag auditing at scale
- Lunametrics / Bounteous tagging audits (consulting)
- Supermetrics for GA4 export to BigQuery and reconciliation reporting

**Sample reconciliation report query (BigQuery, requires GA4 export to BQ enabled):**

```sql
-- Compare GA4 conversions to CRM leads (if both are in BQ)
SELECT
  DATE_TRUNC(event_date, MONTH) AS month,
  COUNT(DISTINCT IF(event_name = 'generate_lead', user_pseudo_id, NULL)) AS ga4_leads,
  -- Join to CRM lead table here, e.g.:
  -- COUNT(DISTINCT crm.lead_id) AS crm_leads
FROM `[project].[dataset].events_*`
WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE('%Y%m%d', DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY))
                          AND FORMAT_DATE('%Y%m%d', CURRENT_DATE())
  AND traffic_source.source = 'google'
  AND traffic_source.medium = 'cpc'
GROUP BY month
ORDER BY month DESC;
```

---

## When to flag "verification required"

- GA4 admin access not provided -> Dimensions 1, 2, 3 partial.
- Google Ads admin access not provided -> Dimensions 4, 5, 6 partial.
- GTM access not provided -> Dimension 9 partial.
- CRM access not provided -> Dimension 7 partial.
- Inability to perform live test conversions -> Dimensions 2.1, 5.3, 6.1, 8 partial.

The audit honestly reports what was verified and what was deferred. Confidence in the score is proportional to access.
