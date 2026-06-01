# Dealer AI Sentiment Monitor — Per-Engine Procedures

How to run the prompt set against each AI engine, capture responses, and classify outputs.

---

## Engine access

### ChatGPT

- URL: https://chat.openai.com (signed-in account recommended for full features)
- Model: GPT-4 or GPT-4o for the audit (consistent behavior); document the model used.
- Browse mode: enabled (so the engine can search the web in real time).
- Per prompt: paste the prompt, capture the full response, note any source citations.

### Perplexity

- URL: https://www.perplexity.ai
- Model: default (Pro plan for Sonar Large is preferred for consistency; document the model).
- Per prompt: paste the prompt, capture the full response, capture the list of cited sources.

### Google Gemini

- URL: https://gemini.google.com
- Model: Gemini 1.5 Pro or current default.
- Per prompt: paste the prompt, capture the full response.

### Google AI Mode (AI Overviews in Search)

- Search directly at https://www.google.com with the prompt as a query.
- AI Overviews appears at the top of the SERP for some queries.
- Capture the AI Overview text and the cited sources.
- Note: AI Overviews appears more for buying-intent queries than direct-name queries; design Category B and C prompts to surface it.

### Claude

- URL: https://claude.ai
- Model: Claude 3.5 Sonnet or current default.
- Per prompt: paste the prompt, capture the full response.

### Microsoft Copilot

- URL: https://copilot.microsoft.com
- Model: default GPT-4 backed.
- Per prompt: paste the prompt, capture the full response.

### Grok (xAI) — optional

- URL: https://grok.com (signed-in X account required)
- Per prompt: paste the prompt, capture the full response.

---

## Capturing responses

Maintain a structured log:

```
Prompt ID: A1
Prompt text: "Tell me about [dealership name] in [city], [state]."
Engine: ChatGPT
Model: GPT-4o
Run number: 1
Date/time: 2026-05-30 14:32 UTC
Response:
[full response text]
Citations:
- [source 1]
- [source 2]
Notes:
- [any hallucinations, factual errors, sentiment cues, competitive framings]
```

For a full audit (25 prompts x 3 runs x 5 engines = 375 entries), use a spreadsheet or CSV. For a fast first-pass, focus on Category E (factual, 7 prompts) and Category D (competitive, 3 prompts) — 10 prompts x 3 runs x 5 engines = 150 entries, completable in 90 minutes.

---

## Classification per dimension

### Tone classification (Dimension 1)

For each response, classify tone using these markers:

**Positive tone markers:**
- "Well-regarded," "highly rated," "trusted," "customer-favored," "reputable," "established"
- "Customers consistently praise..."
- "Known for..."
- "Often recommended for..."

**Mixed tone markers:**
- "Has mixed reviews"
- "Some customers praise... others note..."
- "Overall positive with some concerns about..."

**Cautionary tone markers:**
- "You may want to check reviews"
- "Be sure to compare"
- "There are mixed reports"
- "Consider alternatives"

**Negative tone markers:**
- "Complaints about..."
- "Issues with..."
- "Customers report problems with..."
- "Not recommended"

Score per the 1.1 rubric in REFERENCE.md.

### Factual accuracy classification (Dimension 2)

For each factual prompt (E1-E7), compare the engine's response to the canonical fact (which the auditor verifies from the dealer's own website and verified GBP):

| Prompt | Canonical fact source | What to verify |
|---|---|---|
| E1 hours | GBP, website contact page, website footer | Sales hours, service hours, parts hours, day-by-day |
| E2 brands | GBP, website header, OEM directory | All OEM brands sold; flag missing or fabricated |
| E3 address | GBP, website footer | Street, suite, city, state, ZIP |
| E4 ownership | Public records, website About page | Owner name if public; flag fabrications |
| E5 used cars | GBP services, website inventory | Yes/no on used inventory |
| E6 service dept | GBP services, website service page | Yes/no on service; service capabilities |
| E7 phone | GBP, website footer | Local number; flag if engine returns a tracking number, defunct number, or competitor number |

Score per the Dimension 2 sub-rubrics in REFERENCE.md.

### Hallucination detection (Dimension 6)

Any factual claim the engine produces that contradicts a canonical source is a hallucination. Document:

- The exact claim
- The canonical fact
- The severity (Critical, High, Medium, Low)

Common dealer-specific hallucination patterns:

- **Fabricated employee names.** Engine names a "general manager John Smith" who does not work at the dealership.
- **Wrong brand mix.** Engine claims the dealership sells Toyota when it sells GM, or vice versa.
- **Fabricated awards.** Engine claims the dealership won an OEM award it did not.
- **Stale ownership.** Engine references the previous owner before a sale or merger.
- **Wrong sister stores.** Engine attributes sister stores in the dealer group incorrectly.
- **Fabricated specials or pricing.** Engine references lease or finance specials that do not exist.
- **Hallucinated reviews.** Engine paraphrases customer reviews with details that do not match real reviews on Google, DealerRater, or Cars.com.

---

## Competitive analysis procedure

For Category B (OEM-specific) and D (direct competitive) prompts:

1. Count how often the dealership appears in the recommendation set.
2. Count how often each competitor appears.
3. Note the framing: is the dealership recommended above competitors, alongside, or below?
4. For each "below" finding, identify the likely cause:
   - **Content gap.** The competitor's website has content addressing the use case the dealership does not. Remediation: dealer-aeo-content-brief.
   - **Schema gap.** The competitor has better-structured data. Remediation: dealer-aeo-audit + dealer-llms-txt-generator.
   - **GBP gap.** The competitor has better GBP signals (more reviews, more photos, more posts). Remediation: dealer-gbp-audit.
   - **Review velocity gap.** The competitor has stronger review velocity. Remediation: dealer-customer-sentiment-analyzer + dealer-email-flows for review request automation.
   - **Third-party coverage gap.** The competitor has stronger press, blog, or directory coverage. Remediation: a dedicated PR or earned-media push.

---

## Per-engine cadence recommendations

For ongoing monitoring:

| Engine | Cadence |
|---|---|
| ChatGPT | Monthly full prompt set; weekly Category E (factual) |
| Perplexity | Monthly full prompt set; weekly Category E + B (OEM-specific) |
| Google Gemini | Monthly full prompt set |
| Google AI Mode | Weekly Category B and C (Google AI Mode is most volatile) |
| Claude | Quarterly full prompt set (lowest volume of dealer queries) |
| Copilot | Quarterly full prompt set |
| Grok | Quarterly Category D (competitive) only |

---

## Spanish-language audit (when applicable)

Run the Category F prompt set against each engine. Capture, classify, and score using the same rubric. Score Spanish-language sentiment as a separate Per-Engine breakdown in the report (not blended with English) because the dealer may have strong English-language AI presence and weak Spanish, or vice versa.

Engines handle Spanish with varying quality. Document the language quality of the response in addition to the sentiment:
- **Native-quality Spanish:** the response reads as if written by a native Spanish speaker. ChatGPT and Claude tend to do well.
- **Machine-translated Spanish:** the response reads as English logic with Spanish vocabulary. Some engines default to this for niche local queries.

A high-quality Spanish AI sentiment audit is a competitive differentiator since most dealer agencies do not monitor it at all.

---

## Validation against canonical facts

Before running the audit, build a canonical facts sheet:

```
Dealership: [name]
URL: [primary URL]
Address: [exact, as on GBP and verified mail]
Phone: [primary, exact]
Hours: 
  Sales: [Mon-Sat hours]
  Service: [Mon-Sat hours]
  Parts: [Mon-Sat hours]
Brands sold: [list]
Used cars: [yes/no]
CPO: [yes/no]
Service department: [yes/no, capabilities]
Owner: [if public]
Year established: [if relevant]
Notable awards: [list]
Sister stores: [list, with brand]
Spanish-speaking staff: [yes/no, names if public]
```

Compare every engine response against this sheet. Any deviation is a finding.

---

## Tooling reference

**Required:**
- Browser with access to each AI engine
- Spreadsheet or CSV log for capturing responses
- Note-taking tool for classifications

**Recommended:**
- AI sentiment monitoring SaaS (Promptmonitor.ai, Athena Intelligence, OnPrompt, others) for ongoing tracking. This skill performs the work standalone; these tools automate the cadence.
- Scheduled tasks via the user's agent runtime to run the weekly Category E subset.

**For deeper diagnostics:**
- Pair with dealer-ai-visibility (citation presence tracking)
- Pair with dealer-aeo-audit (on-site cause analysis)
- Pair with dealer-aeo-content-brief (gap-closing content)

---

## When to flag "verification required"

- The auditor cannot access an AI engine (paid plan required, geo-restricted) -> mark that engine as skipped, document.
- The dealer's canonical facts cannot be verified (no GBP access, conflicting public data) -> flag the affected Dimension 2 sub-checks as "verification required."
- Spanish-language prompts return broken or unusably short responses on certain engines -> flag and exclude from scoring.

The audit honestly reports what was verified. Confidence is proportional to data quality.
