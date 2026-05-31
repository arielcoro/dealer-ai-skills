# Dealer Call Tracking Audit — Framework Reference

10 dimensions. 100 points total. Per-dimension sub-scoring. Letter grade bands. Platform-specific overlays for CallRail, Invoca, Marchex.

Authoritative scoring framework. SKILL.md and CHECKS.md reference this file.

---

## Dimension 1. Platform deployment — 8 pts

### 1.1 Platform tag deployed via GTM or platform-native (3 pts)
- 3: Call tracking platform script deployed via GTM with a clear tag name and trigger. OR deployed via the dealer platform's native integration (Dealer.com, DealerOn, DealerInspire call tracking integrations).
- 1: Deployed but inline in page source with no documentation.
- 0: Not deployed, OR deployed but script errors visible in browser console.

### 1.2 Script loads on every page (3 pts)
- 3: Verified the platform script fires on home, SRP, VDP, service, finance, contact, location, and about pages. (DNI requires the script to be present on every page where a phone number may appear.)
- 1: Loads on some pages, missing on others.
- 0: Inconsistent or only on a few pages.

### 1.3 No script errors or page-load impact (2 pts)
- 2: Script loads cleanly, no console errors, no measurable page-load impact (< 50ms add).
- 1: Script loads but minor errors.
- 0: Significant errors or page-load regression caused by the script.

---

## Dimension 2. Number pool sizing — 10 pts

### 2.1 Pool size adequate for traffic (5 pts)

Pool sizing rule: at minimum, one number per concurrent visitor + buffer. Concurrent visitors approximated as monthly unique visitors / (30 * 1440 / average session minutes).

Practical rule for typical dealer traffic:
- Under 10,000 monthly visitors: 6 to 10 numbers per source.
- 10,000 to 30,000: 12 to 20 numbers per source.
- 30,000+: 20+ numbers per source, or upgrade to a larger pool tier.

- 5: Pool is sized at or above the rule-of-thumb for the dealer's traffic volume per source.
- 3: Pool is undersized by 25 to 50%.
- 1: Pool is undersized by more than 50%.
- 0: Single number used for all sources (no pool); attribution is meaningless.

### 2.2 Per-source pool separation (3 pts)
- 3: Each major source (Google Organic, Google Paid, Bing, Facebook, Direct, Referral) has its own number pool.
- 1: Some sources share pools.
- 0: All sources share a single pool; attribution is degraded.

### 2.3 No visible number recycling at peak (2 pts)
- 2: No reports of duplicate or recycled numbers shown to different visitors simultaneously. Verify by checking the platform dashboard for "number exhausted" warnings in the past 30 days.
- 0: Platform warnings of exhausted pools, OR anecdotal reports of two visitors seeing the same number.

---

## Dimension 3. Dynamic Number Insertion (DNI) — 12 pts

DNI is the magic that lets each visitor see a different tracking number based on their source. Misconfiguration breaks attribution silently.

### 3.1 DNI swaps numbers on every visit (4 pts)

Open the site in incognito Chrome. Note the phone number displayed in the header, footer, and content. Refresh. Open in a different incognito window with a different referrer (e.g., directly vs from a Google search). Note the new number.

- 4: Different sources produce different numbers (Google paid -> number A, Google organic -> number B, direct -> number C, Facebook referral -> number D).
- 2: Some swapping but inconsistent.
- 0: Same number shown regardless of source; DNI broken.

### 3.2 DNI works on all phone number instances (3 pts)

Many dealer sites display phone numbers in the header (sales line), footer (service line), VDP page (sales), service page (service), contact page (multiple departments). DNI should swap ALL of these.

- 3: Every phone number instance on the site is swapped.
- 1: Header swapped but footer or department-specific numbers not swapped.
- 0: Only one or two instances swapped; the rest are static and break attribution.

### 3.3 DNI respects department (3 pts)

The sales department phone number should swap with sales tracking numbers. The service department should swap with service tracking numbers (different pool, different routing).

- 3: Department-specific DNI configured. Sales numbers swap for sales sources; service numbers swap independently.
- 1: All numbers swap from a single pool regardless of department.
- 0: No department awareness.

### 3.4 DNI loads before page render or progressively enhances (2 pts)
- 2: DNI swaps numbers before the page is fully rendered, OR uses a flash-of-original-number that resolves cleanly within < 500ms.
- 1: Visible delay where the original number appears for 1 to 2 seconds before swapping.
- 0: Flash of original number lasts long enough that a visitor could call the original (defeats the purpose of DNI).

---

## Dimension 4. Source mapping and attribution — 14 pts

The largest dimension. Source mapping determines which marketing source gets credit for each call.

### 4.1 Major sources have unique mappings (5 pts)
- 5: Google Paid (separate from Google Organic), Google Organic, Bing Paid, Bing Organic, Facebook Paid, Facebook Organic, Direct, Referral, Email, third-party inventory (Cars.com, AutoTrader), and any other significant source have unique tracking number pools and source labels in the platform.
- 3: Most major sources mapped but some lumped together.
- 1: Only Google Paid vs everything else.
- 0: No source mapping; everything is "Direct" or "Website."

### 4.2 Google Ads campaigns mapped at campaign level (3 pts)
- 3: Each major Google Ads campaign type (Search, Performance Max, VLA, Display) has a unique source identifier so calls can be attributed to the campaign type.
- 1: All Google Ads lumped into one "Google Paid" bucket.
- 0: No Google Ads campaign-level mapping.

### 4.3 UTM parameters captured at call moment (3 pts)
- 3: When a visitor calls the tracking number, the platform captures the UTM parameters of the source page (utm_source, utm_medium, utm_campaign, utm_content, utm_term) and stores them on the call record.
- 1: Some UTM captured but inconsistently.
- 0: No UTM capture on calls.

### 4.4 GCLID captured at call moment (3 pts)
- 3: GCLID is captured when a Google Ads visitor calls. The call record stores the GCLID for later offline upload to Google Ads as a CRM-confirmed conversion.
- 1: GCLID captured but not consistently stored.
- 0: GCLID not captured.

---

## Dimension 5. Conversation intelligence configuration — 10 pts

### 5.1 Call categorization rules defined (4 pts)
- 4: Platform AI rules defined to categorize calls into Sales, Service, Parts, Spam, Existing Customer, F&I Question, Other. Rules trained on the dealer's actual call patterns.
- 2: Default rules used, not customized to dealer.
- 1: Some categorization but unreliable.
- 0: No categorization rules; every call is "Untagged."

### 5.2 Keyword spotting configured (3 pts)
- 3: Keyword detection rules in place for high-intent terms (specific vehicle models, "test drive," "purchase," "buy," "financing," "lease") and negative terms ("rental," "wrong number," "telemarketer").
- 1: Some keywords configured.
- 0: No keyword spotting.

### 5.3 Call scoring active (3 pts)
- 3: Calls are scored (lead quality 1 to 5 or A/B/C/D/F) based on conversation analysis. Score visible in the dashboard and synced to CRM.
- 1: Scoring partially configured.
- 0: No scoring.

---

## Dimension 6. Google Ads conversion sync — 12 pts

### 6.1 Phone conversion action defined in Google Ads (3 pts)
- 3: A dedicated conversion action exists in Google Ads for tracked phone calls. Category: Phone Call Lead. Value assigned.
- 1: Phone conversion exists but no value.
- 0: No phone conversion action in Google Ads.

### 6.2 Call tracking platform sync to Google Ads active (4 pts)
- 4: The call tracking platform integration with Google Ads is configured and pushing call conversions on a near-real-time or daily basis. Verified by comparing the platform dashboard call count to the Google Ads phone-conversion count for the past 30 days; numbers align within 5%.
- 2: Sync configured but lagging or partial.
- 0: No sync, OR sync configured but no data flowing for 30+ days.

### 6.3 Only qualifying calls sync (3 pts)
- 3: Only calls meeting a duration threshold (e.g., > 60 seconds) AND categorized as sales-eligible (not service, not spam) sync to Google Ads as conversions. Avoids polluting bidding data with non-sales calls.
- 1: All calls sync regardless of quality; bidding optimizes for noise.
- 0: No filtering; or every call regardless of duration.

### 6.4 GCLID-based offline conversion upload for closed deals (2 pts)
- 2: Calls that close as deals upload back to Google Ads with GCLID, deal value, and date for true ROAS optimization.
- 0: No closed-deal upload from phone leads.

---

## Dimension 7. GA4 event sync — 8 pts

### 7.1 Call events fire in GA4 (4 pts)
- 4: Calls trigger a GA4 event (e.g., `phone_call_completed`) with parameters: call_duration, call_source, call_category, call_score. Event marked as a Key Event.
- 2: Events fire but missing parameters.
- 0: No GA4 events for calls.

### 7.2 GA4-to-Google-Ads import of call events (2 pts)
- 2: The GA4 phone call key event is imported into Google Ads as a conversion (alternative or supplement to the direct call-tracking-platform sync).
- 0: Not imported.

### 7.3 Audience builder uses call data (2 pts)
- 2: GA4 audiences include callers vs non-callers, allowing remarketing to non-callers and exclusion of recent callers from acquisition campaigns.
- 0: Call data not used in audience building.

---

## Dimension 8. CRM integration — 10 pts

### 8.1 Calls push to CRM as leads (4 pts)
- 4: Every qualifying call creates a lead record in the CRM (DriveCentric, Tekion, CDK, Fullpath, Reynolds) with caller name (from caller ID), phone number, source, campaign, and call recording link.
- 2: Some calls push but inconsistent.
- 0: Calls not pushing to CRM at all.

### 8.2 Source attribution preserved (3 pts)
- 3: The CRM lead record shows the marketing source from the call tracking platform (not just "phone call" or "inbound"). Source attribution visible in the dealer's CRM dashboards.
- 1: Source partially preserved.
- 0: Source lost; CRM shows "phone" with no marketing attribution.

### 8.3 Deal close data flows back (3 pts)
- 3: When a phone-originated lead closes as a deal, the CRM marks it and the deal value is available for offline conversion upload to Google Ads and reporting.
- 1: Close data captured but not connected to original call source.
- 0: No close-loop reporting on phone leads.

---

## Dimension 9. Call routing and IVR — 8 pts

### 9.1 Routing matches department intent (3 pts)
- 3: Sales tracking numbers route to sales BDC or sales floor. Service tracking numbers route to service. Parts routes to parts. Numbers route to the correct department.
- 1: Some mis-routing (sales calls hitting service line, vice versa).
- 0: All calls route to a single number; no department routing.

### 9.2 Backup routing for after-hours and overflow (2 pts)
- 2: After-hours calls route to voicemail or after-hours BDC. Overflow routes to backup queue. No calls dropped.
- 1: Partial backup.
- 0: After-hours calls drop or hit a busy signal.

### 9.3 Greeting and IVR audited (2 pts)
- 2: Tracking-number greetings are professional, identify the dealership clearly, and route efficiently. No "Press 1 for sales, 2 for service, 3 for parts..." with 5 levels of menu.
- 1: Greeting present but verbose IVR creates abandonment.
- 0: No greeting, OR jarring multi-level IVR causes call abandonment.

### 9.4 Spanish-language routing (1 pt)
- 1: Spanish-language callers can reach a bilingual agent without an unreasonable wait. Either a separate Spanish-language tracking number or "para Español, oprima 2" in the IVR with routing to a bilingual BDC.
- 0: No Spanish routing despite serving Spanish-speaking market.

---

## Dimension 10. Recording, transcripts, and compliance — 8 pts

### 10.1 Call recording disclosure (3 pts)
- 3: Every tracking number plays a federally-compliant call recording disclosure ("This call may be recorded for quality and training purposes") at call connect. For two-party-consent states (CA, FL, IL, MD, MA, MT, NV, NH, PA, WA), explicit consent is captured.
- 1: Disclosure on some numbers but not others.
- 0: No disclosure, OR disclosure does not meet two-party-consent state requirements where applicable.

### 10.2 Transcripts generated (2 pts)
- 2: Transcripts generated for all recorded calls. Searchable in platform. Accessible via API for downstream analysis.
- 1: Transcripts on some calls.
- 0: No transcripts.

### 10.3 Recording retention policy (2 pts)
- 2: Retention policy is set (typically 90 days to 1 year depending on regulatory and operational need). Old recordings purged. Retention is documented for compliance.
- 1: Recordings kept indefinitely with no policy.
- 0: No retention policy and no documentation.

### 10.4 PII handling in transcripts (1 pt)
- 1: Transcripts redact obvious PII (SSN, full credit card numbers) where the platform supports it.
- 0: Raw PII visible in transcripts where applicable.

---

## Letter grade bands

- 90 to 100: **A.** Top-decile dealer call tracking stack. Attribution accurate, bidding optimized.
- 80 to 89: **B.** Strong with manageable gaps.
- 70 to 79: **C.** Average. Material attribution leakage.
- 60 to 69: **D.** Below average. Significant call leads under-attributed.
- Below 60: **F.** Critical. Phone-lead attribution is unreliable; paid media optimization is impaired.

---

## Platform-specific overlays

### CallRail overlay

CallRail is the most common dealer call tracking platform. Strengths: integrations with Google Ads, GA4, GTM, and major dealer CRMs. Weaknesses: requires careful pool sizing on high-traffic dealer sites; native conversation intelligence is good but not best-in-class for dealer-specific patterns.

**Specific CallRail audit additions:**
- Verify the "Form Tracking" feature is enabled if the dealer uses CallRail to track form submits in addition to calls.
- Check "Source Tracking" rules in CallRail dashboard -> Numbers -> source-tracking-pool-name.
- Verify "Conversation Intelligence" (formerly "Conversation Analytics") is licensed and active.
- Check "CallScore" calibration.
- Verify "Google Ads" integration under Integrations -> Google Ads with the correct customer ID and conversion action mapping.

### Invoca overlay

Invoca is a premium call tracking and conversation intelligence platform. Stronger AI conversation analysis than CallRail; higher price point. Used by larger dealer groups and OEM marketing teams.

**Specific Invoca audit additions:**
- Verify "Signal AI" rules are configured for dealer-specific intents (test drive, financing, trade-in, service appointment, parts).
- Check "Marketo," "Salesforce," or "Adobe Experience Manager" integrations if the dealer group uses enterprise marketing stack.
- Verify "Tealium" or other CDP integrations if applicable.
- Audit conversation outcome scoring against the dealer's actual close-rate data.

### Marchex overlay

Marchex is enterprise-focused, common in OEM-tier marketing setups. Less common at individual dealer level.

**Specific Marchex audit additions:**
- Verify "Marchex Stream" call data feeds are configured.
- Audit "Marchex Marketing Edge" conversation rules.
- Check enterprise CRM integrations (Salesforce, Dynamics).

### Other platforms

DialogTech (now Invoca), 800response, Convirza, Wildjar, Ringostat. The 10-dimension framework applies. Note the platform-specific UI paths in CHECKS.md may not match.

---

## House rules

- Score the lower band when in doubt.
- Checks that cannot be verified are Fail. Flag "verification required."
- The call attribution gap is the dealer-principal-level headline. Always compute and report it prominently when access is available.
- Do not include PII or call recordings in the audit report.
- Always cite the specific platform UI location for fixes.
- TCPA and state-level call recording compliance is a regulatory matter; flag findings but do not provide legal advice.
