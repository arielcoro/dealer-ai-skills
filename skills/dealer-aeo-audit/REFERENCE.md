# Dealer AEO Audit — Reference Framework

The full 30-check, 10-dimension framework. This is the authoritative source for the audit content. SKILL.md references this file. Read the relevant section and use the language directly when running the audit.

Total possible score: 60 points (30 checks × 2 points each).

---

## How scoring works on every check

**Pass (2 points).** Verified working. Tested today. Evidence available.

**Partial (1 point).** Working but incomplete, inconsistent, or stale. Partial implementation. Some pages but not all. Some directories but not all. Working in one engine but not others.

**Fail (0 points).** Not in place, broken, blocking, or unverifiable. When the user cannot produce evidence, score Fail.

The honest rule, baked into every check: if evidence is missing, score Fail. The audit is only useful when it is honest.

---

## Why AEO is not SEO

Before scoring, set the user's mental model.

Google's web search index returns a list of links and lets the user pick. The ranking signals are well understood: backlinks, content depth, freshness, on-page optimization, Core Web Vitals.

AI engines do not return a list. They assemble an answer from a small set of trusted entities and citations. Wikipedia, Reddit, established editorial publications, and a curated authority graph carry disproportionate weight. The engines look for entities they can trust to be accurate, not just relevant.

For a dealership, this means three things matter more than they used to:

1. **Entity reinforcement.** The same NAP and brand portfolio across many trusted sources.
2. **Conversational content.** Pages that answer real customer questions in plain language.
3. **Citation breadth.** Mentions in places AI engines trust (local press, OEM, industry trades).

And one thing matters that was barely on the radar before:

4. **AI crawler access.** Robots.txt and platform defaults that do or do not allow GPTBot, ClaudeBot, PerplexityBot, and Google-Extended to read the site.

---

## Dimension 1. AI crawler access (6 pts)

If the AI crawlers cannot read the site, nothing else matters. This is the antenna.

**1.1 GPTBot is not blocked.** Robots.txt does not disallow `GPTBot` (OpenAI's crawler used by ChatGPT). Verify by fetching `[domain]/robots.txt` and searching for "GPTBot."

**1.2 ClaudeBot, PerplexityBot, and Google-Extended are not blocked.** Same check for `ClaudeBot` (Anthropic), `PerplexityBot` (Perplexity), and `Google-Extended` (Google's AI training crawler, separate from Googlebot). Each engine uses its crawler differently; blocking any one removes the site from that engine's pool.

**1.3 No platform-level blocking.** Some dealer platforms (Dealer.com, DealerOn) have global defaults that block AI crawlers and require a vendor change request to lift. Verify the platform's current policy by checking the live robots.txt against the platform's documentation, or by contacting the platform.

Score: 2 pts each. Max 6.

---

## Dimension 2. llms.txt presence and quality (4 pts)

The llms.txt file is the curated map that tells AI engines which pages matter most.

**2.1 llms.txt exists at the root.** Fetch `[domain]/llms.txt`. If 404, score Fail.

**2.2 llms.txt is curated, not boilerplate.** The file should list the dealer's most important pages with short descriptions: home, inventory roots (new SRP, used SRP), service page, finance page, about page, key model pages. A generated file with everything dumped in is not curated; score Partial.

Score: 2 pts each. Max 4.

---

## Dimension 3. Schema markup (8 pts)

Structured data is how AI engines parse the site quickly and trust the entities they find.

**3.1 AutoDealer schema on the home page.** Fetch the home page source, search for `"@type":"AutoDealer"`. Verify the entity includes name, address, telephone, brand portfolio, and openingHours.

**3.2 Vehicle schema on every VDP.** Random-sample three VDPs. Each should include Vehicle schema with VIN, brand, model, modelDate, mileageFromOdometer, fuelType, and a Product wrapper with offers (price, priceCurrency, availability).

**3.3 LocalBusiness schema with consistent NAP.** The LocalBusiness or AutoDealer entity has the same name, address, and phone as the rest of the site, GBP, and primary directories.

**3.4 FAQPage schema on Q&A pages.** Service page, finance page, and any buying-help page that contains real Q&A should have FAQPage schema with question and answer pairs. Random-check three such pages.

Score: 2 pts each. Max 8.

---

## Dimension 4. Entity reinforcement across the web (6 pts)

AI engines triangulate. They trust facts that appear in many trustworthy places.

**4.1 Google Business Profile claimed and complete.** GBP exists, claimed by the dealer, includes hours, address, phone, website, photos, services, brand portfolio, and at least one post in the last 30 days.

**4.2 NAP consistent across top 10 directories.** Name, address, and phone are identical on the website, GBP, Apple Maps, Bing Places, Yelp, BBB, the OEM locator, Facebook, and at least two major auto directories (Cars.com, DealerRater). Any inconsistency scores Partial; multiple inconsistencies score Fail.

**4.3 OEM locator listing matches.** The dealership appears correctly on the OEM's dealer locator (gmc.com/find-a-dealer, ford.com/dealer-locator, etc.) with matching NAP, hours, and brand portfolio.

Score: 2 pts each. Max 6.

---

## Dimension 5. Conversational content on key pages (6 pts)

AI engines extract sentences and short answers. Marketing copy gives them nothing to extract.

**5.1 Service page answers real customer questions in plain language.** The service page contains direct answers to questions like "how long does an oil change take," "do you take walk-ins for service," "what is your service hours," "do you offer loaners," "what brands do you service." Score Pass if at least five such answers exist on the page or linked Q&A. Partial if one or two. Fail if the page is marketing-only copy.

**5.2 Buying-help page answers real customer questions.** A buying-help or "how to buy from us" page that addresses questions like "do you take trades with negative equity," "can I bring my own financing," "do you sell to out-of-state buyers," "what is your return policy," "do you ship vehicles." Same scoring rules as 5.1.

**5.3 Plain language, not marketing copy.** The site reads like a human salesperson explaining the dealership to a real customer, not like an advertising brochure. AI engines extract from prose; corporate marketing copy produces fewer extractions.

Score: 2 pts each. Max 6.

---

## Dimension 6. Third-party citations (6 pts)

AI engines weight mentions in trusted publications more than mentions on the dealer's own site.

**6.1 At least one local press mention in the last 12 months.** The dealer principal, the store, or an event at the store is referenced in the local newspaper, business journal, or local TV news website with an indexable URL.

**6.2 OEM press release or recognition.** The store has been recognized by the OEM (Buick Mark of Excellence, GMC Mark of Excellence, Ford President's Award, Chevrolet Dealer of the Year, etc.) with a press release or OEM-hosted page that names the dealership.

**6.3 Industry trade publication mention.** Auto News, Wards, Digital Dealer, Dealer Magazine, F&I Magazine, or similar has cited the store or the principal in the last 24 months.

Score: 2 pts each. Max 6.

---

## Dimension 7. Review velocity and breadth (6 pts)

Recent reviews on multiple platforms reinforce the entity to AI engines and signal active operation.

**7.1 Fresh Google reviews.** At least one new Google review in the last 30 days. Five or more in the last 90 days scores Pass. One or two scores Partial. None scores Fail.

**7.2 Cross-platform review presence.** The dealer has active recent reviews on Google, Yelp, DealerRater, and Cars.com. Active means at least one review in the last 90 days per platform.

**7.3 Review velocity is steady, not bursty.** Reviews land on a regular cadence, not in suspicious bursts followed by silence. AI engines (and Google) discount bursty patterns. Verify by scrolling the Google reviews timeline.

Score: 2 pts each. Max 6.

---

## Dimension 8. Live AI engine spot-check (8 pts)

The ground truth: ask AI engines about the dealership and see what they say.

**8.1 ChatGPT brand+city query.** Ask ChatGPT (with web browsing on): "best [brand] dealer near [city]." Score Pass if the dealership appears in the answer with accurate name, address, and hours. Partial if mentioned but with errors. Fail if missing.

**8.2 Perplexity targeted query.** Ask Perplexity: "where to buy a [popular model the store sells] in [metro area]." Score Pass if cited. Partial if mentioned. Fail if missing.

**8.3 Gemini service query.** Ask Gemini: "where to get my [brand model] serviced in [zip code or city]." Score Pass if the dealership appears with service info accurate. Partial if appears with errors. Fail if missing.

**8.4 Brand-name lookup accuracy.** Ask each of ChatGPT, Perplexity, and Gemini directly: "tell me about [dealership name]." Score Pass if all three return accurate hours, address, brand portfolio, and key staff. Partial if two of three are accurate. Fail if one or fewer are accurate.

Score: 2 pts each. Max 8.

---

## Dimension 9. Page-level AEO signals (6 pts)

How easily an AI engine can extract an answer from the page itself.

**9.1 Clear "who we are" answer in the first 100 words of the home page.** AI engines read top-of-page first. The home page should answer "who is this dealership" within the first paragraph with name, brand portfolio, location, and one differentiating fact.

**9.2 Q&A is in extractable HTML.** Questions and answers are in `h3` or `dt`/`dd` or schema-marked-up structures, not buried in marketing carousels, accordion widgets that hide content behind JavaScript, or PDF brochures.

**9.3 No JavaScript-rendered content blocking key info.** AI crawlers generally do not execute JavaScript. The key facts about the dealership (NAP, hours, brand portfolio, key services) must be in server-rendered HTML, not client-side React or Angular components.

Score: 2 pts each. Max 6.

---

## Dimension 10. Technical AEO foundation (4 pts)

The infrastructure underneath everything else.

**10.1 Sitemap.xml is accessible, current, and submitted to Google Search Console.** Fetch `[domain]/sitemap.xml`. Verify it returns 200, lists current pages (not pages from a year ago), and is submitted in GSC. AI engines often start from sitemap.xml when crawling.

**10.2 Pages return 200, no slow-loading interstitials.** Sample three key pages (home, an SRP, a VDP). Each should return HTTP 200 within one second, with no cookie banner or "please verify you are human" interstitial blocking content. AI crawlers fail on slow or gated pages.

Score: 2 pts each. Max 4.

---

# Dimension maximums (for reference)

| Dim | Title | Checks | Max |
| --- | --- | --- | --- |
| 1 | AI crawler access | 3 | 6 |
| 2 | llms.txt presence and quality | 2 | 4 |
| 3 | Schema markup | 4 | 8 |
| 4 | Entity reinforcement | 3 | 6 |
| 5 | Conversational content | 3 | 6 |
| 6 | Third-party citations | 3 | 6 |
| 7 | Review velocity and breadth | 3 | 6 |
| 8 | Live AI engine spot-check | 4 | 8 |
| 9 | Page-level AEO signals | 3 | 6 |
| 10 | Technical AEO foundation | 2 | 4 |
| **Total** | | **30** | **60** |

---

# Readiness bands

**50 to 60. AEO-ready.** Regularly cited by AI engines for relevant queries. Focus shifts from foundation to amplification: more third-party citations, deeper content, broader entity reinforcement.

**35 to 49. Partially visible.** Cited sometimes, missing key dimensions. Diagnose which dimensions are weak and fix in order of impact (typically crawler access, schema, and conversational content first).

**20 to 34. Foundation gaps.** Rarely cited. Structural issues blocking visibility. Most fixes are in Dimensions 1 through 4. Expect 60 to 90 days of work before AI engines re-evaluate the site as trustworthy.

**Below 20. Invisible.** Not cited. Full AEO overhaul required. Stop other digital marketing investments until foundation is fixed, because they amplify a site AI engines cannot trust.

---

# Prioritization guidance for the fix list

When generating the prioritized fix list at the end of the audit, sort fixes by leverage, not by dimension order. The general priority hierarchy:

1. **Crawler access first.** If GPTBot or ClaudeBot is blocked, every other fix is downstream of fixing this. Quick win, often a one-line robots.txt change.
2. **llms.txt second.** Cheap to publish, gives the dealer a curated map that AI engines lean on.
3. **Schema markup third.** Most platforms (DealerOn especially) bundle schema by default; fixes are usually a platform-side configuration, not a custom build.
4. **GBP and NAP consistency fourth.** Free, time-consuming, but high-leverage. Most stores have at least one inconsistency.
5. **Conversational content fifth.** Requires writing, but every page rewrite compounds for years.
6. **Third-party citations sixth.** Slow, requires PR effort, but irreplaceable. Should be ongoing, not a one-time push.
7. **Reviews seventh.** Process improvement, not a one-time fix. Build the request-for-review workflow into the customer experience.
8. **Live testing eighth.** Continuous. Re-test monthly to track movement.

See CHECKS.md for the specific commands and queries to run during each check.
