# Contributing to Dealer AI Skills

Thanks for considering a contribution. This marketplace exists because dealer operators, agency professionals, and developers in the auto retail industry share the same goal: making AI tools actually work on the dealer floor. Every good contribution helps the entire industry get sharper.

This guide explains how to contribute, what we accept, what we do not accept, and how the review process works.

---

## Who can contribute

Anyone. You do not need to be a developer. You do not need to know how to write a SKILL.md file. You do not need GitHub experience.

- **Dealer principals, GMs, BDC managers, fixed ops directors:** suggest a skill based on a real operational problem you face.
- **Agency operators and consultants:** propose audit dimensions, scoring rubrics, content briefs, or workflow improvements based on your client work.
- **OEM marketing leaders and trainers:** share platform-specific or brand-specific knowledge.
- **Developers:** submit pull requests with new skills, improvements, or bug fixes.
- **Researchers and academics:** propose evidence-based dimensions or methodology refinements.
- **Anyone with relevant industry experience:** flag a gap, submit a typo fix, suggest a clarification.

---

## How to contribute

Three paths, ordered by friction.

### Path 1: Suggest a skill or idea (no GitHub required)

Email [ariel@tutecnologia.com](mailto:ariel@tutecnologia.com) with:

- The dealer operational problem you want a skill to solve
- Why it matters (what is at stake if the dealer does not solve it)
- An outline of what the skill would do (audit dimensions, output structure, or example workflow)
- Your background relevant to the area

If your suggestion fits the marketplace direction, we will open a GitHub issue for it and credit you in the skill design. If you prefer to remain anonymous, say so.

### Path 2: Open a GitHub issue (recommended)

Open an issue at [github.com/arielcoro/dealer-ai-skills/issues](https://github.com/arielcoro/dealer-ai-skills/issues) using one of the templates:

- **Skill idea** — propose a new skill
- **Skill improvement** — propose an addition or change to an existing skill
- **Bug report** — flag something that does not work as documented

Discussion happens in the issue. If the idea moves forward, we either build it or invite you to submit a pull request.

### Path 3: Submit a pull request (for developers and operators with technical comfort)

If you want to ship a skill or fix directly:

1. **Fork** the repository at github.com/arielcoro/dealer-ai-skills.
2. **Create a branch** for your contribution: `git checkout -b skill/dealer-[name]` or `fix/[description]`.
3. **Build your contribution** following the structure of existing skills (SKILL.md + REFERENCE.md + supporting files + .claude-plugin/plugin.json).
4. **Test the skill** end-to-end in your AI agent of choice (Claude Code recommended).
5. **Open a pull request** describing the contribution, the problem it solves, and how you tested it.
6. **Respond to review comments.** Most PRs go through 1 to 3 rounds of revision before merge.

---

## What we accept

This marketplace covers dealer operational AI. We welcome contributions that:

- **Solve real dealer operational problems.** New skills grounded in actual dealer workflows: sales, service, parts, F&I (diagnostic only — see exclusions below), fixed ops, customer lifecycle, marketing measurement, AI search visibility, local presence.
- **Improve existing skills.** Add audit dimensions, refine scoring rubrics, expand prompt sets, add platform-specific guidance, fix factual errors, clarify ambiguous instructions, improve output structure.
- **Add platform-specific knowledge.** Dealer.com, DealerOn, DealerInspire, custom platforms. Vendor-neutral observations about what each platform supports, requires, or limits.
- **Add OEM-specific knowledge.** GM, Ford, Stellantis, Toyota, Honda, Hyundai, Kia, Subaru, Volkswagen, Audi, Mazda. Brand standards, OEM programs, compliance markings, dealer requirements.
- **Add Spanish-language content.** Translations, US Hispanic auto buyer behavior, OEM Spanish program guidance.
- **Fix bugs.** Broken links, factual errors, version drift, formatting issues, typos.
- **Improve documentation.** README, CONTRIBUTING, skill READMEs.

---

## What we do not accept

To preserve the marketplace's positioning and credibility, we decline contributions that:

- **Promote a specific vendor or product.** The marketplace is vendor-neutral by design. Skills describe operational categories and reference vendors factually, not promotionally. Contributions framed as "use [vendor X]" or "[product Y] is the best" will be rejected. Factual references to multiple vendors (or all major vendors) in a category are fine.
- **Reference specific dealer clients, customer data, or account configurations.** The marketplace contains no client-specific information. Contributions that mention specific dealer names, specific customer records, specific campaign data, specific account IDs, or other identifying information will be rejected or edited to remove the specifics.
- **Constitute legal, financial, accounting, tax, compliance, or fairness advice.** Skills are diagnostic frameworks, not professional advice. Contributions that purport to give regulatory determinations, legal opinions, or compliance certifications will be reframed as diagnostic guidance with appropriate disclaimers.
- **Cover paid media management.** Paid media management (Google Ads campaign structure, Facebook Ads execution, programmatic buying, etc.) is intentionally out of scope. The marketplace covers measurement and attribution audits for paid media, but not the management of the campaigns themselves.
- **Cover F&I compliance frameworks or workflows.** F&I compliance is regulated and varies by jurisdiction. The legal exposure of publishing an F&I compliance framework is too high. Diagnostic skills that touch F&I are acceptable; prescriptive F&I compliance skills are not.
- **Are derivative of paid third-party products.** Contributions cannot be lifted from paid vendor documentation, paid courses, or proprietary methodology that the contributor does not have the right to license under MIT.
- **Violate the Code of Conduct** (see CODE_OF_CONDUCT.md). Contributions from contributors engaged in harassment, abuse, or industry-norm-violating behavior will be declined.

---

## Skill structure

Every skill follows the same file structure:

```
skills/dealer-[skill-name]/
├── SKILL.md                          # The main skill definition (YAML frontmatter + body)
├── REFERENCE.md                      # The framework, dimensions, scoring rubric, decision trees
├── CHECKS.md or IMPLEMENTATION.md    # Tools, commands, procedures, platform specifics
└── .claude-plugin/
    └── plugin.json                   # Plugin metadata (name, version, author, keywords)
```

Optional supporting files (any markdown filename describing a specific reference like `HREFLANG.md`, `BRAND_STANDARDS.md`, `OEM_PROGRAMS.md`) are welcomed when content benefits from being split out.

Use existing skills as templates. The skills directory has 23 examples of how to structure a contribution.

### SKILL.md requirements

- YAML frontmatter with `name` and `description` fields. The description must be specific enough that an AI agent can activate the skill from natural-language input.
- A clear "What this audits" or "What this covers" section listing dimensions or workflows.
- A "When to invoke" and "When this skill should not fire" section.
- An "Operating sequence" or "How to run" section.
- An "Output structure" section if the skill produces a structured report.
- "Conduct rules" or honesty guardrails specific to the domain.
- "Pairing with other dealer-ai-skills" section noting interactions with related skills.

### REFERENCE.md requirements

- The full dimension framework with weights summing to 100 points (for audit skills) OR the full decision tree, prompt set, or methodology document (for other skill types).
- Letter grade bands (A, B, C, D, F) if scoring is point-based.
- House rules for scoring (when in doubt, score low; honest is more valuable than generous).

### CHECKS.md or IMPLEMENTATION.md requirements

- Specific tools, URLs, commands, screen paths, or procedures per dimension or workflow step.
- Tooling reference section with free and paid options.
- Honest "When to flag verification required" section when access is partial.

### plugin.json requirements

- `name` matches the directory name.
- `version` follows semver (1.0.0 for initial release).
- `description` is a single paragraph summary suitable for the marketplace.json listing.
- `author` is "Ariel Coro" with URL https://www.dealeraiguy.com for the primary author; additional contributors should be noted in CONTRIBUTORS.md.
- `homepage` is https://dealeraiskills.com.
- `repository` is https://github.com/arielcoro/dealer-ai-skills.
- `license` is "MIT".
- `keywords` should include "car-dealer", "automotive-retail", "dealership", "franchise-dealer", and category-specific keywords.

---

## Licensing your contribution

By submitting a pull request, opening an issue, or sending a contribution via email, you confirm that:

1. Your contribution is your original work, OR you have the right to license it under the MIT License.
2. Your contribution will be licensed under the MIT License (the marketplace license) once accepted.
3. You have not violated any confidentiality agreement, employment agreement, or other obligation in submitting the contribution.
4. The contribution does not contain information confidential to any third party (dealer client, employer, vendor, etc.).

If your employer or client has any claim on your work, get written permission before submitting. If you are unsure, do not submit.

---

## Review process

We aim to respond to every contribution within 7 days, though sometimes longer. The typical review flow:

1. **Initial review.** We confirm the contribution fits the marketplace scope and meets the basic acceptance criteria above. We respond with either "let us discuss further" or "we cannot accept this; here is why."
2. **Substantive review.** For accepted contributions, we review the content for accuracy, fit with existing skills, honest framing, and quality of writing. We comment on the PR with requested changes.
3. **Revision.** You make the requested changes. Most contributions go through 1 to 3 revision rounds.
4. **Merge.** Once we are aligned, we merge the PR and credit you in the commit history and (where substantial) in the skill metadata.
5. **Release.** Major contributions ship in a tagged release with notes naming the contributor.

Reviewers reserve the right to edit contributions for clarity, consistency with marketplace voice, accuracy, and licensing compliance before merging.

---

## Recognition

Contributors are credited:

- In the commit history (your authorship is preserved when we merge a PR).
- In CONTRIBUTORS.md (for substantial contributions; created when needed).
- In skill metadata when a contribution makes you a primary author of a skill or major component.
- In release notes when a release includes your work.
- In LinkedIn or Twitter posts when your contribution warrants public acknowledgment (with your permission).

We do not pay contributors. The marketplace is a free, MIT-licensed open-source project. Contributors who want a paid relationship with Dealer Growth Hackers should reach out separately at [dealergrowthhackers.com](https://dealergrowthhackers.com).

---

## Code of Conduct

All contributors must follow the [Code of Conduct](./CODE_OF_CONDUCT.md). Briefly: be respectful, be honest, do not harass, do not promote your own products under the guise of contribution, and disclose conflicts of interest.

---

## Questions

Open a [GitHub issue](https://github.com/arielcoro/dealer-ai-skills/issues) or email [ariel@tutecnologia.com](mailto:ariel@tutecnologia.com).

Thanks for helping make this marketplace better.
