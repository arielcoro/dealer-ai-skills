# Dealer Page-Type Patterns

Seven canonical dealer content patterns. Each pattern includes a structural skeleton, typical word count, typical Q&A count, and the key entity reinforcement points. SKILL.md references this file. Match the brief's target query to the right pattern.

---

## How to pick the right pattern

The target query usually maps to one of these:

| Query feel | Pattern |
| --- | --- |
| "best X for Y" | Model guide or comparison |
| "X vs Y" | Comparison |
| "how do I X" | Service guide or buying help |
| "what is X" | Buying help / FAQ |
| "X near me" or "X in [city]" | Local landing page |
| "how much does X cost" | Financing guide or service guide |
| "do you offer X" | Service guide or buying help FAQ |
| "is X worth it" | Buying help / comparison |

If the query does not clearly map, use the buying help / FAQ pattern as a default. It is the most flexible.

---

## Pattern 1. Model guide

A page about a specific vehicle model, optionally with trim-level detail, for buyers in the research or comparison stage.

**Use when** the query targets a specific model: "GMC Sierra 1500 towing capacity", "2026 Buick Enclave Avenir review", "Ford F-150 Raptor at my dealer".

**Word count.** 1,800 to 2,800.

**Q&A count.** 8 to 12.

**Structure:**

```
# [Year] [Make] [Model] [Trim] at [Dealership Name] in [City]

[Opening 100 words: state the dealer's inventory of this model, the trim levels available, the price range, and the differentiator. Answer-first.]

## [Model] overview
[200-300 words on what this model is, who it is for, what makes it distinct.]

## Trim levels and pricing
[Table or structured list of trims with starting prices, key features, and what makes each trim distinct.]

## Performance specs
[Engine, horsepower, torque, towing, payload, MPG. Cite OEM page.]

## Features by trim
[Side-by-side feature comparison or trim feature list.]

## Common questions about the [Model] (Q&A — 8 to 12 items)
- "What is the towing capacity of the [Model]?"
- "What engines are available on the [Model]?"
- "Is the [Model] available with [feature]?"
- "What is the MPG of the [Model]?"
- "What is the warranty on the [Model]?"
- "How much does the [Model] cost at [Dealer]?"
- "Can I lease the [Model] at [Dealer]?"
- "Do you have the [Model] in stock at [Dealer]?"

## How the [Model] compares
[Brief comparison to the most common cross-shop, with a link to the comparison page if one exists.]

## See the [Model] at [Dealer]
[CTA section: link to inventory, link to schedule a test drive, dealer info.]
```

**Entity reinforcement.** Dealership name in H1, opening, every H2 introduction, conclusion. Model name in canonical OEM form. City and state in H1, opening, conclusion.

**External citations.** OEM model spec page (required). EPA fuel economy. NHTSA safety rating if relevant.

**Schema.** Article + Vehicle (with the specific model as the Vehicle entity).

**Image specs.** 3 to 5 images: hero exterior, interior, dashboard or feature close-up, towing or use-case shot, dealer-shot inventory photo. Alt text references model, trim, dealer, location.

---

## Pattern 2. Service guide

A page about a service or repair the dealer performs, for vehicle owners.

**Use when** the query targets a service: "how long does an oil change take", "brake job cost at GMC dealer", "transmission service near me".

**Word count.** 1,000 to 1,800.

**Q&A count.** 8 to 15.

**Structure:**

```
# [Service Type] at [Dealership Name] in [City]

[Opening 100 words: what the service is, how long it takes, how much it costs typically, who performs it, hours of operation. Answer-first.]

## When you need [service]
[200 words on signs and symptoms or schedule-based triggers. Plain language.]

## What [Dealer] does for a [service]
[Step-by-step or checklist of what is included.]

## Cost and time
[Specific price ranges or starting prices. Specific time estimates. Note any current specials.]

## Why [Dealer] for [service]
[3-4 specific differentiators: certifications, equipment, technician training, OEM parts. NO slogans.]

## Common questions (Q&A — 8 to 15 items)
- "How long does a [service] take?"
- "How much does a [service] cost at [Dealer]?"
- "Do I need an appointment?"
- "Do you offer loaners?"
- "Do you take walk-ins?"
- "What brands do you service?"
- "Do you use OEM or aftermarket parts?"
- "Is there a warranty on the service?"
- "Can I wait or do I need to drop off?"
- "Do you offer shuttle service?"

## Schedule your [service]
[CTA section: link to online scheduler, phone number, hours.]
```

**Entity reinforcement.** Dealership name in H1, opening, schedule section. Brands serviced named explicitly.

**External citations.** OEM maintenance schedule reference (if relevant). Manufacturer parts catalog reference.

**Schema.** Service + FAQPage. Service entity references the dealership as provider.

**Image specs.** 2 to 4 images: service bay, technician at work, equipment, dealer signage. Alt text references service type, dealer, location.

---

## Pattern 3. Buying help / FAQ

A page that answers common buying questions, often a hub for related Q&A.

**Use when** the query is research-stage and not specific to a model: "do dealers take trades with negative equity", "can I bring my own financing", "what credit score do I need to buy a car".

**Word count.** 1,200 to 2,000.

**Q&A count.** 15 to 25 (this pattern is Q&A-dense by design).

**Structure:**

```
# [Topic] at [Dealership Name] in [City]

[Opening 100 words: state the dealer's policy or capability on this topic in plain language. Answer the primary query directly.]

## Quick answers (Q&A — 8 to 12 most common questions)
[Each Q&A is one question, one or two sentences answer. Optimized for extraction.]

## Detailed guidance
[300-500 words walking through the topic in depth. Plain language. Reinforces entity throughout.]

## Edge cases and exceptions
[100-300 words on situations that fall outside the main path. Examples: negative-equity trades, sub-prime credit, out-of-state buyers, military buyers, first-time buyers.]

## What to bring when you visit
[Checklist of documents, IDs, or information the customer should bring.]

## More questions answered (Q&A — 7 to 13 additional questions)
[Less common but still relevant questions.]

## Next steps
[CTA: schedule appointment, apply online, contact dealer, link to inventory.]
```

**Entity reinforcement.** Dealership name throughout, especially in Q&A answers. Department-specific (Sales, F&I, Service) named when relevant.

**External citations.** Government resources where applicable (CFPB, state DMV, IRS for trade-in tax credit), Consumer Reports for buying advice.

**Schema.** FAQPage with all Q&A. Optionally HowTo if the page walks through a process.

**Image specs.** 2 to 3 images: dealership exterior, staff at work, customer experience. Less product-heavy than model guides.

---

## Pattern 4. Comparison

A page comparing two or three vehicles or options, for buyers in the comparison stage.

**Use when** the query is "X vs Y", "X or Y", or "should I get X or Y".

**Word count.** 1,800 to 2,500.

**Q&A count.** 6 to 10.

**Structure:**

```
# [Option A] vs [Option B] [Optional: vs Option C] — Compared at [Dealership Name]

[Opening 100 words: state the recommendation. Do not balance. Pick the answer. Acknowledge edge cases briefly.]

## Quick answer
[2-3 sentences. The actual recommendation. Bold the recommendation. Buyers cite this.]

## Side-by-side at a glance
[Table comparing the options on 8-12 key dimensions: price, fuel economy, towing, payload, cargo, seating, drive type, safety, warranty, available trims.]

## When [Option A] wins
[200-300 words on the use cases where Option A is the right choice. Specific scenarios. Named edge cases.]

## When [Option B] wins
[200-300 words on the use cases where Option B is the right choice.]

## What makes the decision
[150-250 words on the decisive factors. Plain language.]

## Common questions (Q&A — 6 to 10)
- "Is the [Option A] or [Option B] better for towing?"
- "Which has better fuel economy?"
- "Which is cheaper to own over 5 years?"
- "Can I see both at [Dealer]?"
- "Are there current incentives on either?"
- "Which holds its value better?"

## See both at [Dealer]
[CTA: link to both inventory groups, schedule a back-to-back test drive.]
```

**Entity reinforcement.** Dealership name in opening, conclusion, CTA. Both vehicle names in OEM-canonical form throughout.

**External citations.** OEM spec pages for both models. EPA fuel economy. KBB total cost of ownership where available.

**Schema.** Article + Product (for each compared option).

**Image specs.** 3 to 5 images: side-by-side hero, each model independently, comparison detail shots.

---

## Pattern 5. Financing or lease guide

A page about a specific financing or lease topic.

**Use when** the query is about money: "best lease deals on [model]", "what's a good APR for a used car", "how much should I put down".

**Word count.** 1,000 to 1,600.

**Q&A count.** 8 to 12.

**Structure:**

```
# [Financing Topic] at [Dealership Name] in [City]

[Opening 100 words: state the current offer, the typical scenario, or the answer to the primary query. Specific numbers when possible.]

## Current offers
[Table of current incentives, lease deals, or APR ranges. Note "subject to change" and date.]

## How [topic] works at [Dealer]
[300-500 words walking through the process or topic. Plain language. Specific.]

## Eligibility
[Who qualifies. Credit score ranges. Income requirements. Documentation needed.]

## Common questions (Q&A — 8 to 12)
- "What credit score do I need?"
- "Can I apply online?"
- "How long does approval take?"
- "Do you work with [credit situation]?"
- "What's included in the lease payment?"
- "What happens at lease end?"
- "Can I bring my own financing?"
- "Do you have current incentives I can stack?"

## Calculator or example payments
[Worked example with real numbers. "On a $40,000 vehicle with $3,000 down at 6.9% APR for 60 months, the payment is $733/month." Specific.]

## Apply or schedule
[CTA: link to online application, finance manager contact, appointment scheduler.]
```

**Entity reinforcement.** Dealership name throughout. Finance manager named when appropriate. Lenders named when the dealer wants to.

**External citations.** CFPB resources, Federal Reserve rate data for context, OEM finance arm (GM Financial, Ford Credit) for OEM-specific programs.

**Schema.** FinancialProduct (with caution; many dealer finance offerings do not fit cleanly) + Article + FAQPage.

**Image specs.** 2 to 3 images: finance manager at desk, customer reviewing paperwork, dealer signage. Avoid stock money photos.

---

## Pattern 6. Local landing page

A page targeting a specific geographic area, used for SEO and AEO geo-queries.

**Use when** the query is geographic: "[brand] dealer in [city]", "where to buy a [brand] near [zip]", "[brand] service in [neighborhood]".

**Word count.** 1,000 to 1,500.

**Q&A count.** 6 to 10.

**Structure:**

```
# [Brand or service] in [City or Neighborhood] — [Dealership Name]

[Opening 100 words: state who the dealer is, what they offer, where they are relative to the targeted location, and the differentiator. Answer-first.]

## Why drive from [Targeted Area] to [Dealer]
[300-400 words on the value proposition. Specific differentiators. Drive time. Brand portfolio.]

## What [Targeted Area] customers buy at [Dealer]
[200 words on the most popular models or services for customers from this area. Use real data if available; placeholder `[CONFIRM]` if not.]

## Directions from [Targeted Area]
[Specific driving directions. Approximate drive time. Major routes.]

## Common questions from [Targeted Area] customers (Q&A — 6 to 10)
- "Do you deliver to [Targeted Area]?"
- "Do you sell used cars too?"
- "What brands do you carry?"
- "How long is the drive from [Targeted Area]?"
- "Do you serve customers from [neighboring towns]?"
- "Do you have Spanish-speaking staff?" (if relevant)

## Schedule a visit
[CTA: appointment scheduler, contact, address.]
```

**Entity reinforcement.** Dealership name, brand portfolio, and city named throughout. Targeted area named in H1, opening, and conclusion.

**External citations.** Google Maps embed (link, not iframe). Local landmark references for orientation.

**Schema.** AutoDealer + LocalBusiness + Place (for the targeted area).

**Image specs.** 2 to 4 images: dealership exterior, local landmark for visual association, staff or service in action.

---

## Pattern 7. General blog post

A topical post that does not fit the other patterns. Often used for seasonal content, model launches, dealer events, or general buyer education.

**Use when** the query is current, topical, or news-driven.

**Word count.** 800 to 1,500.

**Q&A count.** 3 to 6.

**Structure:**

```
# [Headline]

[Opening 100 words: state the news, the answer, or the topic in plain language. Specific.]

## [First H2: the main subject]
[400-600 words on the topic. Plain language. Specific facts.]

## [Second H2: related angle]
[300-400 words on a related dimension.]

## Quick FAQ (Q&A — 3 to 6)
[Short Q&A relevant to the post topic.]

## How this applies at [Dealer]
[150-250 words tying the topic back to the dealership. Entity reinforcement.]

## [CTA]
[Action: inventory, appointment, contact, or just "stay tuned for updates."]
```

**Entity reinforcement.** Dealership name in opening, the "how this applies" section, and CTA. Brand portfolio reinforced where relevant.

**External citations.** Topic-dependent. Cite the OEM, trade publications, or government sources when relevant.

**Schema.** Article + Author + Publisher.

**Image specs.** Topic-dependent. Hero image relevant to the headline.

---

# Pattern selection cheat sheet

If unsure which pattern applies, use this decision flow:

1. Is the query about a specific model? → Model guide.
2. Is the query a comparison? → Comparison.
3. Is the query about service or repair? → Service guide.
4. Is the query geographic? → Local landing page.
5. Is the query about money? → Financing or lease guide.
6. Is the query a general buying question? → Buying help / FAQ.
7. Is the query current or topical? → General blog post.

When the query spans two patterns, default to the more specific one. A query like "GMC Sierra Denali lease deals in [target city]" maps best to Financing or Lease Guide (the most specific intent), with model-guide-style sections for the vehicle context.

---

# When to break the pattern

Patterns are starting points. Break them when:

- The dealer has a unique angle on the topic (a famous specialty, an unusual program, a celebrity endorsement). Build the page around the differentiator.
- The query has a strong existing answer in market that the dealer must respond to. Address the existing answer head-on early in the page.
- The brief is for a Spanish-language audience. Adjust tone, length, and cultural references accordingly.
- Multiple briefs are part of a campaign and benefit from a consistent custom structure across the set.

When breaking the pattern, the answer-first rule and the entity reinforcement requirement still apply. Everything else is negotiable.
