# Dealer Call Tracking Audit — Technical Checks

Specific platform paths, verification commands, and procedures per dimension.

Replace `[domain]` with the dealer's primary domain.

---

## Access setup

**CallRail:** https://app.callrail.com/ -> select account.

**Invoca:** https://app.invoca.com/ -> select network.

**Marchex:** https://www.marchex.com/customer-portal/ -> select account.

**Google Ads:** https://ads.google.com -> select account.

**GA4:** https://analytics.google.com -> select property.

**GTM:** https://tagmanager.google.com -> select container.

**Site:** Open in Chrome incognito.

---

## Dimension 1. Platform deployment

### 1.1 Tag deployed via GTM or native

**GTM check:**
- Open GTM admin -> Tags.
- Search for "CallRail," "Invoca," "Marchex," or generic "DNI."
- Verify the tag exists, is named clearly, and has a trigger of "All Pages" (or equivalent broad trigger).

**Site source check:**
- View page source on the dealer homepage.
- Search for: `cdn.callrail.com`, `solutions.invocacdn.com`, or Marchex equivalent.
- Confirm the script tag is present in `<head>` or `<body>`.

**Platform-native check:**
- Dealer.com: Site Settings -> Marketing -> Call Tracking module. Check if CallRail or Invoca integration is enabled.
- DealerOn: Admin -> Tracking. Check call tracking config.
- DealerInspire: SiteSettings -> Tracking. Check.

### 1.2 Script loads on every page

Visit each page type and confirm the platform script loads:
- Home: https://[domain]/
- SRP: https://[domain]/new-vehicles/ or equivalent
- VDP: https://[domain]/vdp/[example-vehicle]
- Service: https://[domain]/service/
- Finance: https://[domain]/finance/
- Contact: https://[domain]/contact/
- Location: https://[domain]/locations/ or equivalent

Open DevTools -> Network -> filter `callrail|invoca|marchex` (regex). Confirm the script loads on each page.

### 1.3 No errors

DevTools -> Console. Look for errors mentioning the platform domain or "DNI" or "tracking number."

---

## Dimension 2. Number pool sizing

### 2.1 Pool size

**CallRail:** Dashboard -> Numbers -> Pools. Each pool shows the number count.

**Invoca:** Numbers -> Pools.

**Marchex:** similar pool view in dashboard.

Compute the rule-of-thumb for the dealer's traffic:
- Pull monthly unique visitors from GA4 -> Reports -> Acquisition.
- Approximate concurrent visitors: monthly unique * average session minutes / (30 days * 1440 minutes/day).
- Add 50% safety buffer.
- Compare to current pool size.

### 2.2 Per-source separation

**CallRail:** Dashboard -> Numbers. Each number or pool shows the "Source" it's assigned to.

**Invoca:** Numbers -> filter by Source.

Verify each major source has its own number or pool.

### 2.3 Recycling at peak

**CallRail:** Account Settings -> Notifications. Look for "Pool exhausted" alerts in the past 30 days.

**Invoca:** Reports -> Pool Utilization. Look for periods at 100% utilization.

---

## Dimension 3. Dynamic Number Insertion

### 3.1 DNI swaps numbers

Test procedure:
1. Open `https://[domain]` in incognito Chrome with no referrer. Note the phone numbers shown in header, footer, body content.
2. Close. Open https://www.google.com. Search the dealer name. Click the organic result. Note the phone numbers shown.
3. Close. Open Google. Search the dealer name. If a Google Ads ad appears, click it. Note the phone numbers shown.
4. Close. Open https://www.facebook.com. Navigate to the dealer's page if it exists. Click through to the website. Note the phone numbers.

Compare. The numbers should differ per source.

### 3.2 All instances swapped

For one source (e.g., Google paid), inspect every phone number on every page:
- Home header, body, footer
- SRP header, body, footer
- VDP header, body, footer
- Service page (sales line, service line)
- Contact page (every department)
- Location page

All sales-floor numbers should be the same DNI-swapped number on a given source visit. Service numbers might differ if a separate service pool is in use.

### 3.3 Department-aware

Verify the sales phone number on the home page differs from the service phone number on the service page. They should be two different tracking numbers from two different pools, both possibly DNI-swapped per source.

### 3.4 Render timing

Open the home page. Watch the phone number display as the page loads. If the original (non-swapped) number is visible for more than 500ms before swapping, flag for fix.

Configuration: ensure the DNI script runs in the `<head>` or very early in `<body>`, not deferred.

---

## Dimension 4. Source mapping and attribution

### 4.1 Major sources mapped

**CallRail:** Dashboard -> Numbers. Each pool has a "Source" field. List all configured sources. Verify Google Paid, Google Organic, Bing Paid, Bing Organic, Facebook Paid, Facebook Organic, Direct, Referral, Email, third-party inventory are all represented.

**Invoca:** Similar Source configuration view.

### 4.2 Google Ads campaign-level mapping

**CallRail:** Numbers -> Google Ads. The integration can map at account, campaign, ad group, or keyword level. Campaign level is the minimum for usable bidding data.

**Invoca:** Integrations -> Google Ads -> mapping granularity.

### 4.3 UTM capture

**CallRail:** Calls -> click any call. Verify the call record includes UTM source, medium, campaign.

**Invoca:** Calls -> click any call. Same check.

If UTMs are missing, the dealer's URLs are not being tagged consistently, OR the platform's URL-parsing is not configured to capture UTMs. Both fix paths.

### 4.4 GCLID capture

**CallRail:** Calls -> click any call. Verify "GCLID" field is populated for Google Ads-sourced calls.

If GCLID is captured at click (the visitor lands on the site with `gclid=` in URL) but not captured at call moment, the integration is incomplete. Fix: ensure the platform's JavaScript reads GCLID from the URL or cookie at call connect and stores it on the call record.

---

## Dimension 5. Conversation intelligence

### 5.1 Categorization rules

**CallRail:** Dashboard -> Conversation Intelligence -> Tags. View tags configured. Sales tag, Service tag, Parts tag, etc.

**Invoca:** Signals -> view configured Signals. Each signal categorizes calls based on AI analysis.

**Marchex:** Marketing Edge -> Conversation Categorization Rules.

Verify the rules are dealer-specific (not just generic templates).

### 5.2 Keyword spotting

**CallRail:** Conversation Intelligence -> Keyword Spotting. View configured keywords.

**Invoca:** Signal AI -> view trigger phrases.

Test by reviewing recent call transcripts manually to confirm keyword spotting fires correctly. Pull 10 recent calls. Check tags applied vs ground truth.

### 5.3 Call scoring

**CallRail:** Each call record shows "CallScore" if licensed.

**Invoca:** Each call record shows a quality score.

Audit calibration: pull 20 recent calls scored as high quality. Manually verify they are actually high quality (sales intent, good lead). If false positives are common, scoring rules need recalibration.

---

## Dimension 6. Google Ads conversion sync

### 6.1 Phone conversion action in Google Ads

- Google Ads -> Tools -> Conversions.
- Look for a Phone Call Lead category conversion.
- Open the conversion. Verify value is set, attribution is data-driven, counting is appropriate.

### 6.2 Platform sync active

**CallRail:** Integrations -> Google Ads. Verify integration status is "Active" or "Connected." View "Last sync" timestamp.

**Invoca:** Integrations -> Google Ads. Same check.

Reconcile: count calls in CallRail/Invoca past 30 days. Compare to Google Ads phone conversion count for the same period. Should be within 5%.

### 6.3 Filter for qualifying calls

**CallRail:** Integrations -> Google Ads -> Conversion settings. Verify the filter "Only sync calls > X seconds" is set (typically 60).

**Invoca:** Similar filter.

If all calls sync regardless of duration, bidding optimizes for noise (telemarketers, wrong numbers, abandoned dial).

### 6.4 GCLID-based closed-deal upload

This requires CRM integration plus the platform's offline upload capability. Verify:
- CRM stores GCLID and call ID on the lead record.
- When the lead closes as a deal, the CRM (or a Zap/integration) uploads a "Phone Call Closed Deal" conversion to Google Ads with the GCLID and deal value.

Verify by checking Google Ads -> Tools -> Conversions -> Uploads. Look for recent uploads from the call/CRM source.

---

## Dimension 7. GA4 event sync

### 7.1 Call events in GA4

**CallRail:** Integrations -> Google Analytics. Confirm GA4 property ID is configured. Confirm event name (e.g., `callrail_phone_call_completed`).

GA4 admin -> Events. Find the event. Confirm it fires.

GA4 admin -> Reports -> Engagement -> Events. View event count past 30 days.

### 7.2 GA4-to-Google-Ads import

Google Ads -> Tools -> Conversions. Look for the GA4 event imported as a conversion source.

### 7.3 Audience builder

GA4 admin -> Audiences. Look for an audience like "Recent phone callers" defined by the call event.

---

## Dimension 8. CRM integration

### 8.1 Calls push to CRM

**CallRail:** Integrations -> CRM. Common dealer CRMs supported: DriveCentric, Tekion, Fullpath, ELEAD, VinSolutions.

Verify integration status. Pull a sample of recent CRM leads and confirm they include call records from the past 7 days.

**Invoca:** Similar integration view.

### 8.2 Source attribution preserved

Open the CRM. Find a recent call-sourced lead. Check the source field. Should show specific marketing source (Google Paid, Facebook Paid, etc.), not just "Phone" or "Inbound."

### 8.3 Deal close flow

This is a workflow audit:
- Lead enters CRM from phone call.
- BDC or sales follows up.
- Deal closes (or doesn't).
- Closed deal is marked in CRM.
- A trigger (CRM integration, Zap, or manual process) pushes the close + value back to Google Ads as an offline conversion.

Verify each link in the chain. Pull a sample of recent closed phone-source deals and trace back to the Google Ads offline upload.

---

## Dimension 9. Call routing and IVR

### 9.1 Routing audit

Call each major tracking number from a different phone (not from the dealer's office). Verify:
- Sales number connects to sales floor or sales BDC.
- Service number connects to service.
- Parts number connects to parts.

Note hold times, transfer count, and abandonment.

### 9.2 Backup routing

Call outside business hours. Verify what happens. Voicemail with prompt response process? After-hours BDC? Dropped call?

### 9.3 IVR audit

Listen to each greeting. Note:
- Identifies the dealership clearly
- Menu depth (1 level vs 5 levels)
- Time to reach a human

Excessive IVR (multi-level menus, long greetings) causes call abandonment, which depresses lead volume.

### 9.4 Spanish routing

Call the main tracking number. Listen for a Spanish-language option in the greeting. Press the option (if any). Verify routing to a bilingual agent.

If no Spanish option and the dealer serves a Hispanic market, flag for fix.

---

## Dimension 10. Recording and compliance

### 10.1 Disclosure

Call each tracking number. Listen for a recording disclosure at connect.

State-level requirements:
- Federal (one-party consent): disclosure recommended but not legally required in many cases.
- Two-party consent states (CA, FL, IL, MD, MA, MT, NV, NH, PA, WA): explicit consent required. Disclosure should be clear and the call should not record without it.

### 10.2 Transcripts

**CallRail:** Calls -> click any recent call. Verify transcript is present.

**Invoca:** Calls -> view transcript.

### 10.3 Retention

**CallRail:** Account Settings -> Data Retention. View policy.

**Invoca:** Network Settings -> Data Retention.

### 10.4 PII

Open 5 recent transcripts. Search for SSN patterns (XXX-XX-XXXX), credit card patterns. Verify redaction if applicable.

---

## The reconciliation analysis

The headline output for dealer principals.

### Procedure

1. **Call tracking platform total past 30 days.**
   - CallRail: Reports -> Calls -> filter past 30 days -> total count.
   - Invoca: Reports -> Call Activity -> past 30 days.

2. **CRM phone-source leads past 30 days.**
   - DriveCentric, Tekion, etc. -> filter leads where source contains "Phone" or "Call" or specific call tracking source labels -> past 30 days.

3. **Google Ads phone conversions past 30 days.**
   - Google Ads -> Conversions -> filter to phone call conversions -> past 30 days.

4. **Compute three-way gap.**
   - Platform total: X
   - CRM phone leads: Y
   - Google Ads phone conversions: Z
   - Expected: X >= Y >= Z (some calls are wrong number / spam and don't become CRM leads; some CRM leads aren't paid-source and don't appear in Google Ads).
   - Common issue: X >> Y (platform tracks calls but they don't push to CRM; integration broken).
   - Common issue: Y >> Z (CRM has phone leads but Google Ads sync is misconfigured; bidding is missing data).

5. **Map gaps to dimension findings.**
   - X >> Y means Dimension 8 (CRM integration) is broken.
   - Y >> Z means Dimension 6 (Google Ads conversion sync) is broken.
   - Source mismatches mean Dimension 4 (source mapping) is broken.

6. **Report the single highest-priority fix.**

---

## Tooling reference

**Platform admins:**
- CallRail: https://app.callrail.com
- Invoca: https://app.invoca.com
- Marchex: https://www.marchex.com/customer-portal

**Diagnostics:**
- Google Ads Tag Assistant
- GTM/GA Debug (Chrome extension)
- DevTools Network tab
- Real phone number for test calls (use a personal cell, not the dealer's office line)

**For deeper conversation analysis:**
- Pair this audit with dealer-call-transcript-classifier to verify call categorization accuracy against ground truth.

---

## When to flag "verification required"

- Platform admin access not provided -> Dimensions 1.1, 2, 3 partial.
- Google Ads admin access not provided -> Dimensions 6 partial.
- GA4 admin access not provided -> Dimension 7 partial.
- CRM access not provided -> Dimension 8 partial.
- Inability to make live test calls -> Dimensions 9, 10 partial.

The audit honestly reports what was verified and what was deferred. Confidence in the score is proportional to access.
