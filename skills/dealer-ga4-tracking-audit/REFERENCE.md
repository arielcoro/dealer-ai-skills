# Dealer GA4 + Conversion Tracking Audit — Framework Reference

10 dimensions. 100 points total. Per-dimension sub-scoring. Letter grade bands. Dealer-specific failure patterns.

Authoritative scoring framework. SKILL.md and CHECKS.md reference this file.

---

## Dimension 1. GA4 property configuration — 10 pts

### 1.1 Property exists and is the primary tracking property (3 pts)
- 3: GA4 property is set up, receiving real-time traffic, and is the canonical tracking property (no parallel Universal Analytics or duplicate GA4 properties).
- 1: GA4 exists but duplicate or shadow properties also exist.
- 0: No GA4, OR GA4 is set up but no data flowing.

### 1.2 Data streams configured correctly (2 pts)
- 2: Web data stream points to the primary domain. Enhanced measurement enabled. Internal traffic filter configured (dealership IPs and BDC office IPs excluded).
- 1: Data stream present but enhanced measurement off, OR internal traffic not filtered.
- 0: Data stream misconfigured (wrong domain, no enhanced measurement, no filters).

### 1.3 Reporting time zone and currency (1 pt)
- 1: Time zone matches the dealership's local time. Currency is USD.
- 0: Time zone is wrong (default UTC) or currency mismatched.

### 1.4 Data retention configured (2 pts)
- 2: User and event data retention set to 14 months (the maximum for the standard GA4 plan). Reset on new activity enabled.
- 1: Retention at default 2 months.
- 0: Retention misconfigured.

### 1.5 Cross-account linking (2 pts)
- 2: GA4 linked to Google Ads, Google Search Console, BigQuery (if available), and Merchant Center (if VLA used).
- 1: Some links missing.
- 0: No links configured.

---

## Dimension 2. Event taxonomy and key events — 12 pts

### 2.1 Core dealer events configured (5 pts)
- 5: All core dealer events present and firing: form_submit (with form type), generate_lead, click_to_call, sms_click, schedule_service, view_vdp, view_srp, get_directions, finance_application_start, finance_application_submit.
- 3: Most core events present.
- 1: Some core events present.
- 0: Only default Enhanced Measurement events (page_view, scroll, click) present.

### 2.2 Key events marked (4 pts)
- 4: All conversion-eligible events marked as Key Events in GA4 (formerly "conversions"): generate_lead, click_to_call, schedule_service, finance_application_submit, get_directions to physical location.
- 2: Some events marked.
- 0: No events marked as key events.

### 2.3 Event parameters configured (2 pts)
- 2: Custom event parameters configured to differentiate event sources: form_type, vehicle_vin, vehicle_make, vehicle_model, vehicle_year, page_type (home, srp, vdp, service, finance). Parameters registered as custom dimensions.
- 1: Some parameters but inconsistent.
- 0: Events fire without distinguishing parameters.

### 2.4 No event spam (1 pt)
- 1: Event count is reasonable for the traffic volume. No tags firing event_name on every scroll or every micro-interaction.
- 0: Event count is inflated by spam (tens of thousands of meaningless events per day).

---

## Dimension 3. GA4 audiences — 8 pts

### 3.1 Core dealer audiences configured (4 pts)
- 4: Audiences configured for: VDP viewers (last 7, 30 days), SRP-only browsers (high intent but no VDP), finance application starters who did not finish, service scheduler abandoners, returning visitors.
- 2: Some audiences configured.
- 0: Only default GA4 audiences (All Users).

### 3.2 Audiences linked to Google Ads for remarketing (3 pts)
- 3: Audiences imported into Google Ads for remarketing campaigns. Customer Match audience also imported if dealer has uploaded a customer list.
- 1: Some audiences imported.
- 0: No audiences imported, OR Google Ads not linked.

### 3.3 Audiences used in active campaigns (1 pt)
- 1: At least one active Google Ads campaign uses a remarketing audience or Customer Match. (Verifiable in Google Ads campaign settings.)
- 0: Audiences sit unused in Google Ads.

---

## Dimension 4. Google Ads conversion tracking configuration — 12 pts

### 4.1 Conversion actions defined (4 pts)
- 4: Conversion actions defined per source: lead form submit, phone call (from website), phone call (from call tracking), finance application, service appointment, store visit (if applicable). Each has a value assigned (lead value, not just count).
- 2: Conversion actions defined but no values.
- 1: Only one or two conversion actions defined.
- 0: No conversion tracking, OR all defined as "Other" with default values.

### 4.2 Conversion category and counting (3 pts)
- 3: Each conversion action set to the correct category (Lead, Phone Call, Sign-up, Submit Lead Form) and the correct counting method (One per click for primary, Every for value-aggregating).
- 1: Categories present but counting method default ("One") for all.
- 0: Wrong categories or wrong counting.

### 4.3 Attribution model (2 pts)
- 2: Data-driven attribution selected (the GA4 default and current Google recommendation). All conversion actions use data-driven.
- 1: Last-click attribution still in use on some actions.
- 0: Wrong model, OR multiple actions on conflicting models.

### 4.4 Primary and secondary conversion goals (3 pts)
- 3: Primary conversions (used for bidding) are limited to high-quality, high-intent actions only (form submits, finance app submits, phone calls of qualifying duration). Lower-intent actions (page views, scroll milestones) are secondary (tracked but not used for bidding).
- 1: Mix of high and low intent in primary.
- 0: Everything is primary, OR everything is secondary, OR none are primary.

---

## Dimension 5. GA4-to-Google-Ads conversion import — 8 pts

### 5.1 GA4 key events imported as conversions in Google Ads (4 pts)
- 4: Key events from GA4 are imported into Google Ads as conversion actions. Bidding uses the imported actions where appropriate.
- 2: Imported but not actively used in bidding.
- 0: GA4 events not imported into Google Ads; Google Ads conversion tracking is parallel (and likely conflicting).

### 5.2 No double-counting (2 pts)
- 2: If both GA4-imported events and Google Ads native conversion tags fire on the same action (e.g., form submit), only one is set as primary to avoid double-counting.
- 0: Both fire and both are primary; reported conversions are inflated 2x.

### 5.3 Cross-account view aligned (2 pts)
- 2: Reported conversions in Google Ads UI align with Key Events in GA4 within an expected delta (within 5 to 10%). Differences explained (attribution model, time window, audience).
- 0: Gap exceeds 20% and is unexplained.

---

## Dimension 6. Enhanced Conversions configuration — 10 pts

Enhanced Conversions sends hashed first-party PII (email, phone) to Google to improve attribution in a privacy-respecting way. Critical for dealer sites where users complete forms.

### 6.1 Enhanced Conversions enabled (4 pts)
- 4: Enhanced Conversions enabled for web on all relevant conversion actions. Either Google Tag (gtag) automatic enhanced conversions or manual configuration via GTM with the right variables.
- 2: Enabled on some actions, not others.
- 0: Not enabled, OR enabled but no data flowing (verify via Google Ads diagnostics).

### 6.2 Enhanced Conversions for Leads (3 pts)
- 3: Enhanced Conversions for Leads configured for offline conversion import from CRM. Phone and email captured at lead form and hashed for upload to Google Ads.
- 1: Partial configuration.
- 0: Not configured (the dealer is not getting CRM-confirmed conversions into Google Ads).

### 6.3 Data fields hashed correctly (3 pts)
- 3: PII fields (email, phone, first name, last name, address) are SHA-256 hashed before sending. No raw PII in network requests.
- 0: Raw PII visible in network requests (privacy violation; immediate fix required).

---

## Dimension 7. Offline conversion import from CRM — 10 pts

Closing the loop. Lead-to-sale conversion data flows from the CRM back to Google Ads so the bidding algorithm optimizes for actual buyers, not just form submitters.

### 7.1 Offline conversion mechanism in place (4 pts)
- 4: A mechanism exists to push offline conversions from the CRM back to Google Ads. Options:
  - Direct Google Ads upload API integration (technical; requires development)
  - Zapier or Make automation pulling from CRM and pushing to Google Ads
  - CRM-side native integration (DriveCentric -> Google Ads, Tekion -> Google Ads, Fullpath -> Google Ads where supported)
  - BigQuery export from GA4 + Cloud Function or pipeline pushing back to Google Ads
- 2: Manual upload happening (CSV upload to Google Ads weekly or monthly).
- 0: No offline conversion data flowing from CRM to Google Ads.

### 7.2 GCLID captured and stored in CRM (3 pts)
- 3: GCLID (Google Click ID) is captured on every lead form, stored in the CRM, and retrieved on lead-to-sale conversion for upload to Google Ads.
- 1: GCLID captured but not consistently stored.
- 0: GCLID not captured.

### 7.3 Sale data quality (3 pts)
- 3: Offline conversion uploads include the actual deal value (front-end gross or total deal value), not just a lead-stage flag. Conversion value drives the bidding algorithm.
- 1: Sale data uploaded but value is generic.
- 0: No sale-stage data; only "lead" stage uploaded.

---

## Dimension 8. Cross-domain tracking — 8 pts

Dealer journeys often cross domains: dealersite.com -> finance app on cudl.com or routeone.com, dealersite.com -> third-party VDP on cars.com (for some leads), dealersite.com -> service scheduler on a separate domain, dealersite.com -> review portal.

### 8.1 Cross-domain configured in GA4 admin (3 pts)
- 3: All relevant domains listed in GA4 admin -> Data Streams -> Configure tag settings -> Configure your domains. Linker parameter passing between domains verified.
- 1: Some domains configured.
- 0: No cross-domain configuration; sessions break at the domain boundary, attribution is lost.

### 8.2 GTM or gtag implementation on cross-domain pages (3 pts)
- 3: The third-party finance app, service scheduler, or other cross-domain pages have GA4 tracking (either GTM container or gtag direct) so the session can continue.
- 1: Some pages tracked.
- 0: Cross-domain pages untracked; the lead-to-conversion flow has dark zones.

### 8.3 No URL parameter loss (2 pts)
- 2: GCLID, UTM parameters, and Linker parameters survive the cross-domain hop. (Verify by clicking a Google Ads link, navigating through the site to a cross-domain page, and inspecting the URL.)
- 0: Parameters dropped at the cross-domain hop.

---

## Dimension 9. GTM container hygiene — 10 pts

### 9.1 Container present and version-controlled (2 pts)
- 2: GTM container exists, deployed on the site, recent publishes documented in version notes.
- 1: Container exists but no version notes or unclear deployment status.
- 0: No GTM; all tagging via inline gtag (much harder to manage).

### 9.2 Tag inventory clean (3 pts)
- 3: Container has fewer than 30 active tags. Each tag has a clear purpose. No orphan tags from old vendors.
- 1: 30 to 75 tags, mix of active and dead.
- 0: 75+ tags, many dead, multiple competing analytics platforms, bloat is hurting page load.

### 9.3 No tag conflicts (2 pts)
- 2: No two tags fire the same conversion event. No multiple GA4 measurement IDs. No Universal Analytics tags still firing alongside GA4.
- 1: Some conflicts (e.g., UA still firing).
- 0: Multiple GA4 properties, duplicate conversion tags, Universal Analytics still active.

### 9.4 Trigger discipline (2 pts)
- 2: Triggers are specific (CSS selectors that match exactly, custom events fired from the dataLayer). No "fire on all clicks" tags inflating data.
- 1: Some triggers are loose.
- 0: Triggers are wildly loose; events fire indiscriminately.

### 9.5 Variables hygiene (1 pt)
- 1: dataLayer variables and Built-in variables used appropriately. No hard-coded values where dynamic should be used.
- 0: Variables misused or hard-coded.

---

## Dimension 10. Server-side tagging and consent mode — 12 pts

### 10.1 Consent Mode v2 implemented (5 pts)
- 5: Consent Mode v2 implemented. Cookie consent banner sets ad_storage and analytics_storage signals. GA4 and Google Ads tags respect the consent state. Modeled conversions enabled in Google Ads to recover signal from unconsented traffic.
- 3: Consent banner present but Consent Mode v2 not fully implemented.
- 1: Consent banner but no integration with Google tags.
- 0: No consent management; potential regulatory exposure in CCPA / state-privacy-law markets.

### 10.2 Server-side tagging assessment (4 pts)
- 4: Server-side GTM is implemented for high-traffic dealer or for any dealer prioritizing first-party data control. OR server-side is reasonably deferred and the rationale is documented.
- 2: Server-side considered but no plan.
- 0: No awareness of server-side; in 2025+ this is increasingly suboptimal for measurement durability against browser tracking restrictions.

### 10.3 First-party data strategy (3 pts)
- 3: Dealer captures first-party data (email, phone) at multiple touchpoints, stores it in the CRM with consent, and uses it for Enhanced Conversions, Customer Match, and offline conversion import.
- 1: First-party data captured but not used in advertising.
- 0: No first-party data strategy.

---

## Letter grade bands

- 90 to 100: **A.** Top-decile dealer measurement stack. Reconciliation gap under 10%.
- 80 to 89: **B.** Strong setup with manageable gaps.
- 70 to 79: **C.** Average. Reconciliation gap typically 20 to 30%.
- 60 to 69: **D.** Below average. Reconciliation gap often above 30%. Material spend waste.
- Below 60: **F.** Critical. Measurement stack is unreliable; bidding algorithms are flying blind.

---

## Dealer-specific failure patterns to call out

### Pattern 1. Dealer.com / DealerOn-installed measurement vs custom GTM

Many dealer platforms install their own GA4 and Google Ads tags. Dealers who later layer a custom GTM often end up with parallel tracking and double-counting. The audit identifies which is canonical and recommends consolidation.

### Pattern 2. Third-party form vendors

DriveCentric, Fullpath, Conversations, Friendemic, and other tools embed forms or chat that fire their own events. These events sometimes do not propagate to GA4 or do propagate but duplicate the website's native form events.

### Pattern 3. Cars.com / AutoTrader / Costco Auto / TrueCar inventory tracking

Leads that originate on third-party inventory marketplaces but convert on the dealer site (or vice versa) often lose attribution. The audit identifies which leads are caught by the dealer's measurement and which are not.

### Pattern 4. CallRail / Invoca conversion sync

Call tracking platforms can push call conversions back to Google Ads. If the integration is broken, phone leads do not appear as Google Ads conversions. The audit identifies whether this sync is in place and accurate.

### Pattern 5. F&I and finance application off-site

CUDL, RouteOne, and OEM finance application providers run off the dealer's domain. The lead lifecycle is broken without cross-domain configuration.

### Pattern 6. CDK / Reynolds DMS-to-CRM-to-Ads pipeline

For dealers using CDK or Reynolds, the DMS contains the deal closure data. Whether that data flows to the CRM and then to Google Ads as a CRM-confirmed offline conversion is often the source of the largest measurement gaps.

---

## House rules

- Score the lower band when in doubt.
- A check that cannot be verified is Fail. Flag "verification required."
- Compute the total to a whole number.
- The reconciliation gap is the headline metric for dealer principals. Always compute and report it prominently when GA4 and CRM access are available.
- Do not include PII in the report.
- Always cite the specific UI location for a fix. Vague guidance is not actionable.
