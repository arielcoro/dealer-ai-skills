# Dealer Search Strategy — 90-Day Roadmap Template

The template structure for the integrated 90-day roadmap that appears in section 5 of every strategy doc. SKILL.md references this file.

The roadmap sequences actions across all four pillars in a calendar view. Foundation work runs first because it cascades. AEO/GEO infrastructure comes early because it produces visible results in 1 to 3 months. SEO content production runs throughout. Cross-channel reputation work starts immediately because it is mostly free and high-leverage.

---

## The integrated 90-day calendar

Below is the template structure. Customize the specific actions per dealer based on their current state and audit findings.

### Week 1

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Run dealer-site-score (technical baseline) | 1 | Marketing Dir | Score documented; top 5 gaps identified |
| Run dealer-aeo-audit (AEO baseline) | 3 | Marketing Dir | Band documented; top 5 gaps identified |
| Verify GPTBot, ClaudeBot, PerplexityBot, Google-Extended allowed in robots.txt | 1 | IT or Marketing | Confirmed via curl; vendor ticket if blocked |
| Publish llms.txt using dealer-llms-txt-generator | 1 | Marketing Dir | File live at root; verified with curl |
| Run dealer-customer-sentiment-analyzer on last 90 days of reviews | 4 | Marketing Dir | Sentiment baseline established; operational signals identified |

### Week 2

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Open vendor tickets for any platform-side schema, Core Web Vitals, or crawler issues from dealer-site-score | 1 | Marketing Dir | Tickets filed; vendor SLA confirmed |
| GBP audit: verify hours, brand portfolio, services, photos. Post at least 1 post | 2 | Marketing Dir or BDC | GBP complete; post live |
| NAP audit across top 10 directories | 2 + 3 | Marketing Dir | Discrepancies documented; fixes planned |
| Identify top 10 SEO query opportunities and 10 AEO query opportunities | 2 + 3 | Marketing Dir | Lists documented for content planning |
| Establish review request workflow at sales delivery and service checkout | 4 | GM | SOP documented and rolled out |

### Week 3

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Vendor implements schema fixes (if applicable) | 1 | Vendor | Verified via Rich Results Test |
| Generate content briefs using dealer-aeo-content-brief for top 4 AEO/SEO opportunities | 2 + 3 | Marketing Dir | 4 briefs delivered |
| Begin NAP cleanup on long-tail directories (BBB, Yelp, Apple Maps, OEM locator) | 2 + 3 + 4 | Marketing Dir | First batch corrected |
| Start brand monitoring (Google Alerts at minimum) | 4 | Marketing Dir | Alerts live |

### Week 4

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Content production: 2 to 4 new or rewritten pages from the briefs | 2 + 3 | Content writer | Pages drafted, in review |
| First batch of review responses (catch up if backlog exists) | 4 | Marketing Dir | All reviews older than 30 days responded to |
| Run first live AI engine test on 10-query bank | 3 | Marketing Dir | Baseline citation accuracy documented |

### Week 5-6 (Days 30-45)

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Vendor completes Core Web Vitals fixes | 1 | Vendor | Re-tested; verified improvement |
| 2 to 4 more pages produced and published | 2 + 3 | Content writer | Pages live |
| First citation outreach campaign: 5 to 10 local press / OEM / trade outreach attempts | 3 | Marketing Dir or PR | Outreach log documented |
| Continue NAP cleanup | 2 + 3 + 4 | Marketing Dir | Long-tail directories addressed |
| Continue review request cadence (target: 5+ per week) | 4 | BDC + Service | Review velocity on target |

### Week 7-8 (Days 45-60)

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Re-run dealer-site-score (measure delta from baseline) | 1 | Marketing Dir | Score improved; new gaps documented |
| Re-run dealer-aeo-audit (measure delta) | 3 | Marketing Dir | Band improved; remaining gaps documented |
| Run dealer-vdp-merchandising-review on a sample of VDPs | 1 + 2 | Marketing Dir | VDP gaps documented |
| 2 to 4 more pages produced | 2 + 3 | Content writer | Pages live |
| Second live AI engine test (measure delta) | 3 | Marketing Dir | Improvement documented |

### Week 9-10 (Days 60-75)

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| VDP improvements rolled out (from merchandising review) | 1 + 2 | Marketing Dir + Vendor | Sample VDPs retest passing |
| Continue content production: 2 to 4 more pages | 2 + 3 | Content writer | Pages live |
| Continue citation outreach: 5 to 10 more attempts | 3 | Marketing Dir or PR | Outreach log updated |
| If equity mining is in scope, design first campaign using dealer-equity-mining-campaign-builder | 4 | Marketing Dir | Campaign blueprint and messaging ready |

### Week 11-12 (Days 75-90)

| Action | Pillar | Owner | Success metric |
| --- | --- | --- | --- |
| Final round of content production: 2 to 4 more pages | 2 + 3 | Content writer | Pages live |
| Re-run dealer-customer-sentiment-analyzer (measure trend) | 4 | Marketing Dir | Trend documented; staff praise surfaced |
| Third live AI engine test | 3 | Marketing Dir | Final citation accuracy measured |
| Re-run dealer-site-score and dealer-aeo-audit for end-of-quarter measurement | 1 + 3 | Marketing Dir | Final scores documented |
| Strategy review meeting: assess progress, plan next 90 days | All | GM + Marketing Dir | Quarterly review document produced |

---

## Customization rules

The template above is the starting point. Adjust per dealer based on:

### State of Pillar 1 at audit

- **Strong technical foundation (dealer-site-score above 85):** Skip the foundation-heavy actions in weeks 1-2. Move directly into content and AEO/GEO work in week 1.
- **Mixed (60-85):** Run the template as-is.
- **Weak (below 60):** Add an extra 4 weeks at the start for foundation rebuild. The full 90-day strategy starts in week 5.

### Strategic priority signal

- **SEO-priority dealer:** Increase content production cadence (3 to 5 pages per week instead of 2 to 4). Shift backlink and PR work earlier.
- **AEO/GEO-priority dealer:** Increase citation outreach cadence. Add more live AI engine testing. Increase third-party citation work.
- **Balanced:** Run the template as-is.

### Budget signal

- **Lean ($1K to $3K/month):** Reduce content production by 50%. Skip PR firm; use in-house outreach. Skip equity mining campaign in week 9-10 unless dealer already has the infrastructure.
- **Mid ($3K to $10K/month):** Run the template as-is.
- **High ($10K+/month):** Add specialist hires or agency relationships. Add an audit re-run cadence (monthly instead of every 60 days). Add international or Spanish-language work where applicable.

### Vendor relationship

- **Cooperative platform vendor:** Weeks 1-4 foundation work moves faster.
- **Slow or restrictive vendor:** Weeks 1-4 extended; some actions move to weeks 5-8.
- **Custom site or independent platform:** All technical work is in-house; timeline depends on engineering capacity.

---

## Quarter 2 onwards (after day 90)

The 90-day roadmap is the foundation. After day 90, the dealer transitions into a sustained operating cadence:

- **Monthly:** Live AI engine testing on the 10-query bank. Review velocity check. NAP spot-check on 3 directories. Content production: 2 to 4 pages.
- **Quarterly:** Re-run dealer-site-score, dealer-aeo-audit, dealer-customer-sentiment-analyzer. Re-generate llms.txt. VDP merchandising review on a fresh sample. Re-set the next-quarter roadmap.
- **Annually:** Full strategy review. Reassess priorities, budget, vendor relationships. Decide whether to maintain, expand, or restructure the program.

The skill flags this in the output: the 90-day plan is the start, not the end. Search investment compounds over years, not months.

---

## How to render the roadmap in the strategy doc

In the strategy doc output (Section 5: The integrated 90-day roadmap), the skill renders the customized version of the table above. Key rules:

- **Be specific.** Replace template placeholders with dealer-specific actions ("publish llms.txt at howardbentleybuickgmc.com using the dealer-llms-txt-generator skill" not "publish llms.txt").
- **Name the skills.** Every recommended action that maps to a marketplace skill names the skill. This drives skill discovery from the strategy doc.
- **Name the owner role.** Marketing Director, BDC Manager, GM, Vendor, Content Writer. Even if the dealer is small enough that one person wears all hats, the role designation matters for the SOP.
- **Specify the success metric.** "Score improved" is weak. "dealer-site-score improved from 64 to 75+" is strong.
- **Estimate effort.** Hours or dollar ranges where reasonable. Helps the GM understand the budget impact.

The roadmap is the most actionable part of the strategy doc. Spend time getting it right.
