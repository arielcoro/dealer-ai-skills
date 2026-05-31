# Scoring rubric for the Dealer AI Readiness Audit

This file describes how Claude should assign Green, Yellow, or Red to each item during an audit. Follow these rules strictly. The audit is only useful if it is honest, and the bias is deliberate: when in doubt, score Red.

---

## The three states

### Green (2 points)

True today. Verified. Documented. Someone owns it.

Green requires four things to be present at once:

1. **True today.** Not "true two years ago" or "true in our parent company." True at this rooftop, this quarter.
2. **Verified.** Someone can produce evidence on request. A screenshot, a report, a contract, a measurable number.
3. **Documented.** The standard, the workflow, or the configuration is in writing somewhere a new hire can find it.
4. **Owned.** A named human is accountable. Not a department. Not a vendor. A person with a name and a title.

If any one of those four is missing, the item is at most Yellow.

### Yellow (1 point)

Partly true. The intent is right, the practice is inconsistent, or the standard depends on a single person who could leave tomorrow.

Yellow is the most common honest score in a typical audit. Most dealerships have many things "working" that fail one or two of the Green tests. That is Yellow.

Examples of legitimate Yellow:
- The store does this thing, but only one person knows how. (Owned but undocumented.)
- The store has a written SOP, but adherence varies. (Documented but inconsistent.)
- The store does it for new vehicles but not used. (True, but not universally.)
- The store does it but cannot produce a screenshot or report on demand. (True but unverifiable.)

### Red (0 points)

Not true. Unknown. Or assumed to be true with no proof.

Red is the right score when:
- The store does not do this at all.
- The store thinks it does this but cannot produce evidence.
- The store says "we have something like that" but cannot describe it specifically.
- The user does not know the answer.
- The answer depends on a system the user has not checked.

**Never reduce Red to Yellow because the user feels bad.** The audit exists to surface gaps. A diplomatic Red is a wasted Red.

---

## How to ask scoring questions

For each item, do three things in this order.

### 1. Restate the item in plain language.

Translate the audit item into a question the user can answer without re-reading the framework. Lead with the simplest possible version of the question. Do not paraphrase from memory; the language in REFERENCE.md is calibrated. Use it.

Good: "Has anyone run a duplicate-record check on your CRM in the last ninety days?"

Bad: "How is your data quality?" (Too vague. Invites hopeful answers.)

### 2. Probe for evidence.

Once the user answers, ask for the evidence behind the answer. Frame this as "to score Green I need to confirm what you have." Not as an accusation.

Good: "Got it. Who ran that check, and is there a report I would be able to see?"

Bad: "Prove it." (Adversarial. Loses cooperation.)

### 3. Assign the score and state it back.

Tell the user the score and why. Move on. Do not relitigate unless the user pushes back with new information.

Good: "Scoring this Yellow. The check happened, but only your IT vendor has the report and your team cannot see it. To move this to Green, you would want the report copied into a shared drive your CRM admin can see anytime."

Bad: "Hmm, hard to say, somewhere between yellow and green. Let's call it green." (Inflation.)

---

## Scoring traps to avoid

### The "we have something like that" trap.

The user is describing a half-formed version of the practice and asking you to recognize it. The answer is Yellow at best, often Red. Ask which specific items are in writing.

### The "the vendor handles that" trap.

The user is offloading responsibility to a vendor. The vendor handling something is not the same as the store knowing the vendor handles it correctly. Ask whether the store can audit the vendor's work and whether the vendor produces a report the store can see. If no, the item is at most Yellow regardless of how much the vendor charges.

### The "we used to do that" trap.

The user describes a practice in past tense. Past tense is Red. The audit measures present-day state.

### The "I'm sure we do that" trap.

The user is confident but not specific. Confident-but-vague is Red. Ask for one concrete example. If no example is forthcoming in thirty seconds, it is Red.

### The "everyone knows that" trap.

The user explains that the practice is cultural rather than documented. Culture without documentation is Yellow at best. Cultures change when people leave. Documentation persists.

### The "if you saw the metrics you would see" trap.

The user asks you to believe an outcome metric implies the practice exists. Outcomes are not practices. A store can hit numbers despite bad practice, and a bad-practice score still flags real risk. Score the practice itself.

---

## Bilingual scoring

If the audit is conducted in Spanish, the rubric applies identically. Translation does not change the standard for Green. Do not soften the standard because conversational Spanish reads warmer than English. The bias toward Red holds in any language.

Preserve the English technical terms in the Spanish version of the audit: DMS, CRM, BDC, F&I, MPI, VDP, SRP, OFAC, FTC, OEM, NAP, ACV, SMS, API. These are the working vocabulary at dealerships even in Spanish-speaking environments.

---

## Edge cases

### Independent dealers (non-franchise).

The audit was designed for franchise dealers, but it applies to large independent dealers with one modification: items that reference OEM-specific systems (recall feeds, OEM rebate tracking, OEM locator presence) can be skipped or scored Not Applicable. Independent-specific items (auction sourcing automation, certified pre-owned compliance with the independent's brand standards) are not in the audit; do not invent them.

### Single rooftop versus dealer group.

The audit can be run at the rooftop level or aggregated at the group level. When run at the group level, an item scores Green only if true at every rooftop. If true at some rooftops and not others, it scores Yellow. The user should specify their scope at the start of the audit.

### Recent change in ownership or platform.

If the dealership has changed DMS, CRM, or website platform in the last six months, treat that change like fresh paint over old structure. Score based on present-day reality. Note in the report that several items may improve naturally as the new platform matures, with a recommended re-score at the 6-month mark.

---

## What scores tell you in aggregate

The grand total places the dealership in a band. But the section scores are where the recommendations live. A store can have a healthy total and still have one Red section that disqualifies a specific AI deployment.

Always show the user the section breakdown alongside the total. Section weakness is more diagnostic than total score for any specific AI decision.

See REMEDIATION.md for the band-specific recommendations and the section-weakness rules.
