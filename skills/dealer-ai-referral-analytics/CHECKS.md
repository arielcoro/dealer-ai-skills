# Dealer AI Referral Analytics — Technical Checks

Specific GA4, GSC, Cloudflare, GTM, and server-log procedures per dimension.

Replace `[domain]` with the dealer's primary domain.

---

## Access setup

**GA4:** https://analytics.google.com -> select the property.

**GSC:** https://search.google.com/search-console -> select the property.

**Cloudflare:** https://dash.cloudflare.com -> select the account -> select the site.

**GTM:** https://tagmanager.google.com -> select the container.

**Server logs:** access depends on hosting. Common paths:
- WordPress on managed hosting: hosting dashboard -> access logs
- Dealer.com / DealerOn / DealerInspire: typically not directly accessible; request via vendor or rely on Cloudflare
- Self-hosted: SSH access to web server, parse `/var/log/nginx/access.log` or equivalent

---

## Dimension 1. AI referrer detection in GA4

### 1.1 Custom channel group setup

GA4 Admin -> Data Settings -> Channel Groups -> Custom Channel Group.

Create or edit a custom channel group with a channel "AI Search Referrals":

**Rules (paste into the channel definition):**

Channel: AI Search Referrals
Source matches regex: `chat\.openai\.com|chatgpt\.com|perplexity\.ai|gemini\.google\.com|copilot\.microsoft\.com|claude\.ai|grok\.com|you\.com|phind\.com|poe\.com|meta\.ai|chat\.deepseek\.com|chat\.mistral\.ai|huggingface\.co|kagi\.com|andisearch\.com|arc\.net`

(Note: when adding new engines, append their referrer domains to the regex.)

Save and publish. The channel will populate going forward; retroactive recategorization is limited in GA4.

**Verify:**
- GA4 Reports -> Acquisition -> Traffic Acquisition.
- In the dimension selector, choose "Session default channel group" (or your custom group).
- Confirm "AI Search Referrals" appears as a row with traffic.

### 1.2 Custom dimension

GA4 Admin -> Custom Definitions -> Custom Dimensions -> Create.

- Dimension name: `ai_referrer_engine`
- Scope: Event
- Description: AI engine origin for AI-referrer sessions
- Event parameter: `ai_referrer_engine`

### 1.3 GTM tag to populate the dimension

GTM -> Tags -> New -> Google Analytics: GA4 Event.

Tag type: GA4 Event
Configuration tag: your GA4 tag
Event name: `ai_referral_visit`
Event parameters:
- `ai_referrer_engine` = `{{AI Engine Detector}}`

GTM -> Variables -> New -> User-Defined Variable.

Variable name: AI Engine Detector
Type: Custom JavaScript

```javascript
function() {
  var ref = document.referrer.toLowerCase();
  if (!ref) return null;
  if (ref.indexOf('chat.openai.com') > -1 || ref.indexOf('chatgpt.com') > -1) return 'chatgpt';
  if (ref.indexOf('perplexity.ai') > -1) return 'perplexity';
  if (ref.indexOf('gemini.google.com') > -1) return 'gemini';
  if (ref.indexOf('copilot.microsoft.com') > -1) return 'copilot';
  if (ref.indexOf('claude.ai') > -1) return 'claude';
  if (ref.indexOf('grok.com') > -1) return 'grok';
  if (ref.indexOf('you.com') > -1) return 'you';
  if (ref.indexOf('phind.com') > -1) return 'phind';
  if (ref.indexOf('poe.com') > -1) return 'poe';
  if (ref.indexOf('meta.ai') > -1) return 'meta_ai';
  if (ref.indexOf('deepseek.com') > -1) return 'deepseek';
  if (ref.indexOf('mistral.ai') > -1) return 'mistral';
  if (ref.indexOf('huggingface.co/chat') > -1) return 'huggingface';
  if (ref.indexOf('kagi.com') > -1) return 'kagi';
  if (ref.indexOf('andisearch.com') > -1) return 'andi';
  if (ref.indexOf('arc.net') > -1) return 'arc';
  return null;
}
```

Trigger: All Pages, with the condition that AI Engine Detector is not null.

Publish.

### 1.4 Audience

GA4 Admin -> Audiences -> New Audience.

- Name: AI Search Visitors
- Membership duration: 30 days
- Conditions: event `ai_referral_visit` count >= 1 OR session source matches the AI referrer regex.

### 1.5 Google Ads import

Google Ads -> Tools -> Audience manager -> Custom segments -> import GA4 audience "AI Search Visitors."

---

## Dimension 2. AI engine traffic volume and trend

### 2.1 Past-30-day count

GA4 -> Reports -> Acquisition -> Traffic Acquisition.

Filter "Session default channel group" = "AI Search Referrals."

Date range: past 30 days. Note the total sessions.

For per-engine breakdown, use Explorations:
- GA4 -> Explore -> Free form.
- Rows: `ai_referrer_engine` (custom dimension).
- Values: Sessions, Engaged sessions, Key events.
- Filter: Channel = AI Search Referrals.

### 2.2 90-day trend

In the same exploration, change the date range to past 90 days and segment by week. Note the week-over-week direction.

### 2.3 AI share of total organic-adjacent

Compute: AI Search Referrals sessions / (Organic Search sessions + AI Search Referrals sessions + Direct sessions) * 100.

This is the AI penetration metric. Track monthly.

### 2.4 Engine mix

Same exploration as 2.1. The breakdown by `ai_referrer_engine` reveals engine mix.

---

## Dimension 3. Landing page distribution

GA4 -> Explore -> Free form.

- Rows: Landing page + query string.
- Values: Sessions.
- Filter: Channel = AI Search Referrals.
- Sort: Sessions descending.

Top 10 landing pages reveal where AI engines are sending traffic. Often surprising.

For page-type distribution, add a custom dimension `page_type` (or derive from URL patterns) and segment.

---

## Dimension 4. Engagement quality

GA4 -> Explore -> Free form.

- Rows: Session default channel group.
- Values: Average engagement time per session, Engaged sessions per user, Bounce rate, Pages and screens per session, Returning users.

Compare AI Search Referrals row vs Organic Search row vs Direct row.

---

## Dimension 5. Conversion

### 5.1 Key event rate

GA4 -> Explore -> Free form.

- Rows: Channel.
- Values: Sessions, Key events, Key event rate (Key events / Sessions * 100).

Compare AI Search Referrals key event rate vs Organic Search and Direct.

### 5.2 Per engine

Same exploration, swap Rows to `ai_referrer_engine`.

### 5.3 Lead-to-sale

This requires CRM-side tracking. The AI-referrer session must propagate session source to the lead form, which propagates to the CRM, which captures whether the lead closes.

Procedure:
1. On the lead form, capture session source via dataLayer or hidden form field.
2. CRM stores session source on the lead record.
3. When the lead closes (in DriveCentric, Tekion, etc.), tag the deal with the original session source.
4. Report: AI-referral leads -> close rate by engine.

If the dealer's CRM integration doesn't support this natively, a Zap or Make automation can sync the session source from form submit to CRM lead record.

### 5.4 ROI on AEO

ROI = (AI-referral closed deal value past 12 months - AEO investment cost past 12 months) / AEO investment cost.

AEO investment includes: dealer-aeo-content-brief output execution cost, dealer-llms-txt-generator output deployment, schema implementation cost, ongoing content production for AEO. If using Ariel's consulting, that's the line item. If in-house, the marketing team's allocated hours.

---

## Dimension 6. GSC AI Mode detection

### 6.1 CTR drift detection

GSC -> Performance -> Search results.

- Date range: past 28 days.
- Compare: past 28 days to previous 28 days.
- Sort by Impression delta or CTR delta.

Queries where:
- Impressions are flat or growing
- Position is stable in top 3
- CTR has dropped 20%+ vs previous period

are likely AI Overview cannibalization candidates.

### 6.2 Per-query analysis

For each suspect query, open it and check the SERP. If an AI Overview appears at the top, the dealer's organic listing is now below the AI summary. CTR drop confirmed.

### 6.3 GSC AI experience filter (when available)

GSC -> Search Appearance filter -> "AI overview" or "AI experience" (Google has been gradually rolling out this filter as of 2026). Use when available.

### 6.4 Long-term trend

GSC -> Performance -> Search results.

- Date range: past 16 months.
- Note overall impression trend, click trend, CTR trend.

Many dealers see impressions flat or growing while clicks decline. That gap is AI Overview growth.

---

## Dimension 7. AI bot crawl traffic

### 7.1 Bot identification source

**Cloudflare bot analytics:**
- Cloudflare -> Analytics & Logs -> Security Events.
- Filter by Bot Action.
- Verify "AI Bots" managed challenge or allow rule.

For per-bot identification:
- Cloudflare -> Analytics -> Bots.
- "Verified bots" section lists named bots that have visited.

**Server logs (if accessible):**
- Connect via SSH to web server.
- Parse access logs for AI bot user-agents.

```bash
# Example: count AI bot requests in nginx logs past 30 days
grep -E "GPTBot|ChatGPT-User|PerplexityBot|ClaudeBot|Google-Extended|Applebot-Extended|Bytespider|CCBot|Meta-ExternalAgent|cohere-ai|Amazonbot|Mistralbot|DuckAssistBot" /var/log/nginx/access.log* | \
  awk '{print $(NF-2)}' | sort | uniq -c | sort -rn
```

(Adjust the field number based on the log format.)

**Hosting analytics (where Cloudflare and server logs are unavailable):**
- Dealer.com / DealerOn / DealerInspire vendor reports may include bot crawl summaries. Request from vendor.
- WordPress on managed hosting: hosting dashboard often includes bot analytics.

### 7.2 Per-bot volume and pages

In Cloudflare or server logs:
- Group by user-agent.
- Sub-group by URL.
- Report: per-bot total requests, unique URLs, top 10 URLs.

### 7.3 robots.txt documentation

Pull the current robots.txt:

```bash
curl -sL https://[domain]/robots.txt
```

For each AI bot in the inventory, verify the Allow/Disallow directive. Document the choice in the audit report.

Example:

```
User-agent: GPTBot
Disallow:

User-agent: Google-Extended
Disallow:

User-agent: PerplexityBot
Disallow:

User-agent: ClaudeBot
Disallow:

User-agent: Applebot-Extended
Disallow:
```

If a bot is disallowed, document the rationale (privacy preference, vendor policy, etc.).

### 7.4 Crawl-to-citation correlation

Cross-reference:
- Pages with high AI bot crawl volume (from Dimension 7.2).
- Pages cited by AI engines (from dealer-ai-visibility, dealer-ai-sentiment-monitor).
- AI referral landing pages (from Dimension 3).

A strong correlation across the three is the AEO success signal. Weak correlation flags pages that bots crawl but engines don't cite (low quality), or pages that engines cite but bots haven't crawled recently (stale citations).

---

## Dimension 8. Attribution and reporting cadence

### 8.1 Monthly report template

Build a monthly report in:
- Google Looker Studio connected to GA4 + GSC + Cloudflare
- BigQuery + scheduled query
- Or static Markdown / PDF generated by the dealer's marketing team

Cover:
- AI traffic total past 30 days
- Per engine breakdown
- Top 10 landing pages
- Engagement vs organic benchmark
- Conversion rate
- 90-day trend
- AI bot crawl summary
- GSC CTR drift highlights
- 1 to 3 recommendations

### 8.2 Stakeholder review

Share with the dealer principal and marketing director monthly. Track whether decisions reference the report.

---

## Setup mode (Mode B) quick-start

For dealers without any current AI tracking:

**Week 1:**
1. GA4 custom channel group: AI Search Referrals (Dimension 1.1).
2. GTM tag for `ai_referrer_engine` (Dimension 1.2 + 1.3).
3. GA4 audience: AI Search Visitors (Dimension 1.4).
4. Cloudflare bot analytics enabled (Dimension 7.1).

**Week 2:**
5. GA4 import audience to Google Ads (Dimension 1.5).
6. GSC weekly export setup (Dimension 6.1).
7. robots.txt documentation (Dimension 7.3).

**Week 3:**
8. CRM session source capture (Dimension 5.3).
9. Looker Studio report template (Dimension 8.1).

**Week 4:**
10. First monthly report. Share with stakeholders. Iterate.

After 30 days of data, run a full audit using Mode A.

---

## Tooling reference

**Required:**
- GA4 admin access
- GSC admin access
- GTM admin access
- Cloudflare admin access (if site is on Cloudflare)

**Helpful:**
- Looker Studio for reporting
- BigQuery for advanced log analysis
- Datadog or Splunk for enterprise log management
- Vendor reports for dealer-platform-specific bot data

**Emerging tools (track market):**
- Athena Intelligence
- Promptmonitor.ai
- Profound (Tryprofound.com)
- OnPrompt (DealerOn customers only)
- Otterly.ai
- ZipTie.ai

This skill ships the framework; the SaaS tools above automate the data capture. Both are valid paths; use the SaaS where budget permits and the framework where independent operator control matters.

---

## When to flag "verification required"

- GA4 admin access not provided -> Dimensions 1-5 partial.
- GSC admin access not provided -> Dimension 6 partial.
- No bot identification source available -> Dimension 7 deferred entirely.
- CRM session source not captured -> Dimension 5.3 deferred.

The audit reports honestly. Confidence is proportional to access.
