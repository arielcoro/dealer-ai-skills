# Dealer Customer Sentiment Analyzer — Reference Framework

The analysis dimensions, sentiment scoring methodology, and theme taxonomy. SKILL.md references this file. Read it before analyzing any review batch.

---

## Why text-based sentiment, not star ratings

Star ratings encode three things at once: overall satisfaction, willingness to recommend, and a vague "I rate this" gesture. They are useful as a directional signal but they do not capture the operational truth.

A few patterns that make star ratings unreliable for operational decision-making:

- **The "polite negative" 4-star review.** Customer is too kind to give 3 stars but the text says "everything was fine but it took 8 days and nobody called me." That is functionally negative. The 4-star rating masks an operational gap.
- **The "polite positive" 5-star.** Customer rates 5 stars but the text reads "good people, average experience, will probably come back." That is mixed at best.
- **The "single-issue 1-star."** Customer rates 1 star because of a single transactional issue (couldn't get a part, wait was long once) but the text is otherwise neutral or positive about staff. That is mixed.
- **The "anomaly 5-star."** Customer rates 5 stars with no text, or with text that has nothing to do with the dealership. Drops out of the sentiment analysis.

The skill reads the text. The star rating is captured as metadata but does not drive the sentiment classification.

---

## The four analysis dimensions

Every review gets analyzed across four dimensions.

### 1. Department classification

Which dealer department does the review primarily concern?

- **Sales.** Vehicle purchase, salesperson interaction, negotiation, delivery.
- **Service.** Service department, repair, maintenance, advisor interaction, technician work, loaner/shuttle.
- **F&I.** Finance and Insurance, paperwork, lender, products (warranty, GAP, etc.), pricing transparency at signing.
- **Parts.** Parts inquiry, ordering, availability.
- **Multiple.** Review covers two or more departments substantively.
- **General.** Review is about the dealership overall without department-specific content (e.g., "this place is great").

When a review spans departments, classify as Multiple and note which departments are covered.

### 2. Sentiment classification (text-based, not star-based)

- **Positive.** The text expresses satisfaction, gratitude, or recommendation. No substantive complaints. May reference specific praise (named staff, smooth experience, beat expectations).
- **Mixed.** The text expresses both positive and negative elements. Customer may overall recommend but flags one or more specific issues. Common pattern: "great people, but the wait was too long" or "everything was fine but I would not return because of [specific issue]."
- **Negative.** The text expresses dissatisfaction, complaints, or warnings. May include specific accusations (overcharged, lied to, ignored), unresolved issues, or refusal to return.

When the star rating and the text sentiment disagree, the text wins. Flag the disagreement in the report.

### 3. Themes identified

Match the review content to the recurring patterns in PATTERNS.md. A review may surface zero, one, or multiple themes. When multiple, list all applicable.

Themes have positive and negative variants:
- **Positive themes:** "named staff praise", "exceeded expectations", "fast resolution", "transparent pricing", "easy paperwork", etc.
- **Negative themes:** "long wait", "communication failure", "pricing surprise", "repeat repair", "broken promise", etc.

The full theme taxonomy is in PATTERNS.md.

### 4. Named-staff mentions

If the review names a specific employee (by first name, last name, or both), capture it. Include the role mentioned (Service Advisor Carla, salesperson Mike, finance manager Tom, etc.) and the sentiment context (positive, negative, neutral context).

A named-staff mention requires the customer to use a specific name. "The service advisor" alone does not count. "Carla in service" counts as a named mention.

Aggregate the named mentions into a table. Star performers (multiple positive mentions) and at-risk performers (multiple negative mentions) both appear. The skill reports neutrally.

---

## Sentiment scoring methodology

For each review, after reading in full, assign:

- A department classification (one of: Sales, Service, F&I, Parts, Multiple, General).
- A sentiment classification (one of: Positive, Mixed, Negative).
- A list of theme tags (zero or more from PATTERNS.md).
- A list of named-staff mentions (zero or more, each with role and sentiment context).
- A response priority recommendation (High, Medium, Low, None — see Response Priority below).

These five outputs per review feed the aggregate analysis.

---

## Response priority methodology

For each review, determine whether the dealer should respond, and at what priority. Use this rubric:

### High priority response (within 24 hours)

- Negative review with a specific accusation (overcharged, dishonest, broken promise, vehicle damaged in service).
- Negative review that names a specific employee negatively.
- Negative review on a high-visibility platform (Google with broad reach, DealerRater featured area).
- Negative review on a recent visit (within 30 days) where the relationship may still be recoverable.
- Negative review with regulatory implications (TCPA, ADA, discrimination claims).

### Medium priority response (within 7 days)

- Negative review where the issue is general (slow service, mild dissatisfaction) without specific accusation.
- Positive review that names a specific employee (thank the customer; reinforces the public win).
- Mixed review where the dealer can acknowledge the issue and surface the positive.
- Negative review older than 90 days (the customer is gone but the public record matters).

### Low priority response (when time allows)

- Positive review without specific content (a thank-you is nice but not essential).
- Negative review where the dealer is clearly not in the wrong and the customer's expectations were unreasonable (responding with care, but not urgent).

### No response recommended

- Reviews that are clearly fake or spam (refer to platform reporting instead).
- Reviews where the dealer's response would inflame rather than resolve.
- Reviews so old (over 12 months) that a response now looks performative.

The skill recommends; the dealer decides.

---

## Pattern detection across reviews

The point of analyzing a batch is to surface patterns that single-review analysis cannot. When the skill processes a batch:

### Frequency-based patterns

Count theme mentions across all reviews. Rank by frequency. Surface the top 5 to 10.

A theme with 1 to 2 mentions is an incident. 3 to 5 mentions is a signal worth watching. 6+ mentions is a systematic pattern requiring operational attention.

### Time-clustered patterns

When dates are available, identify themes that cluster in a specific time window. Example: 5 of 6 negative reviews about service wait times happened in the last 30 days. This often indicates a recent operational change (new advisor, staffing shortage, parts supply issue) and is worth flagging separately.

### Named-staff patterns

Sort named-staff mentions by frequency. A staff member named in 10+ positive reviews is a star performer. A staff member named in 2+ negative reviews (out of any number of mentions) deserves a conversation. The skill flags both.

### Department-skewed patterns

If sentiment by department diverges significantly (e.g., Service has 80% negative while Sales has 90% positive), surface this as a department-level signal. Operations may need to focus attention there.

### Cross-department patterns

If a theme appears across multiple departments, it may be a dealership-wide issue rather than a department issue. Example: "communication failure" appearing in Sales, Service, and F&I reviews suggests a process gap, not a department-specific one.

---

## What this skill does not do

- It does not assign blame. It reports what customers said.
- It does not draft responses. The dealer's voice drives those.
- It does not access private customer data. It works only with the review text and metadata provided.
- It does not fabricate themes or quotes. Every claim is tied to a real review in the input.
- It does not give legal advice on review responses (some negative reviews touch on potential litigation; the dealer's compliance officer or counsel handles those).
- It does not generate or facilitate fake reviews. Ever.

---

## Edge cases

### Reviews in mixed languages

A single review may switch between English and Spanish. Read both portions. Classify based on the dominant language and content. Quote the original language in the report with translation in parentheses.

### Reviews with no text (star-rating only)

Some platforms allow star-only reviews. Skip them in the sentiment analysis. Note the count of star-only reviews in the report ("12 reviews with no text were excluded").

### Reviews referencing a competitor

Some reviews compare the dealer to another. Note the comparison in the analysis but do not extract competitor sentiment as the primary signal.

### Reviews that may be fake

Generic 5-star reviews with no detail, identical phrasing across multiple reviewer accounts, or other indicators of inauthenticity. Flag suspicious reviews but do not remove them from the analysis unless the user asks. The platform decides; the skill reports.

### Reviews referencing a different dealership

Some reviews are clearly about a different rooftop in the same group, or a different dealer entirely. Note and exclude from the analysis with a flag.

### Anonymous or "Anonymous Customer" reviewer names

Use the name as provided. Do not infer a real name.

---

## How the report is shaped to the user's role

When generating the output, the skill weights different sections based on who is reading.

### Dealer principal

Lead with the summary headline. Surface the operational signals prominently. The named-staff table matters because the principal acts on it. Department breakdown matters less unless something is critically wrong.

### General manager

Lead with the department breakdown. Top themes matter. Named-staff table is critical. Response priority list is operational.

### Service manager (or department manager)

Lead with the department-filtered analysis. Themes within that department. Named-staff mentions for that department. Response priorities for that department.

### Marketing director or agency

Lead with the trend analysis (if dates available). Top themes for content planning. Operational signals for messaging. Response opportunities for review-management workflow.

If the user's role is not specified, default to the general manager view.

---

## Output frequency recommendation

The skill should be re-run on a cadence. Recommended cadences:

- **Monthly** for a high-volume dealer (50+ reviews per month).
- **Quarterly** for a mid-volume dealer.
- **Semi-annually** for low-volume dealers, or on demand.

When sentiment patterns shift (a theme appears that was not present in the previous run, a new staff name appears positively or negatively), the change is more valuable than the absolute numbers. The skill notes the changes when given period-over-period data.

See PATTERNS.md for the recurring theme taxonomy and what each pattern typically indicates operationally.
