# Dealer AI Skills

**AI agent skills for franchise and independent car dealers.** Diagnostics, AEO, BDC operations, F&I compliance, fixed ops, equity mining, and growth engineering. Works with Claude Code, Codex, Cursor, and Gemini CLI.

By **Ariel Coro**. Published on [Dealer AI Guy](https://www.dealeraiguy.com). Marketplace at [dealeraiskills.com](https://dealeraiskills.com).

---

## What this is

A growing collection of installable AI agent skills designed specifically for car dealer retail operations. Each skill encapsulates a workflow that dealers, agencies serving dealers, or technical buyers at dealer groups need to run repeatedly.

Skills here are vendor-neutral. They name the operational problem and the steps to solve it. They do not promote a specific DMS, CRM, ad platform, or AI vendor.

Skills are MIT-licensed and free to install. They link back to free Dealer AI Guy tools at [dealeraiguy.com/tools](https://www.dealeraiguy.com/tools/) and the paid Dealer Growth Hackers consulting practice at [dealeraiguy.com/consulting](https://www.dealeraiguy.com/consulting/).

## Who this is for

- **Dealer principals and GMs** who want to evaluate AI readiness or score a vendor proposal honestly before signing.
- **Marketing directors, fixed ops directors, and CIOs** at franchise and large independent dealers building their AI roadmap.
- **Agencies and consultants serving auto retail** who want to run rigorous diagnostics on client stores.
- **Technical buyers at dealer groups and OEMs** evaluating AI investment portfolios.

## Available skills

### dealer-ai-readiness-audit

Run the 75-point Dealer AI Readiness Audit on a franchise or independent car dealership. Walks the user through 17 sections, scores each item Green / Yellow / Red, computes a total out of 150, places the store in one of four bands (AI-ready, Pilot-ready, Foundation first, Rebuild), and produces a sequenced 30/60/90 day remediation roadmap.

Best used before buying or expanding any AI deployment, when diagnosing why an existing AI tool is underperforming, or when building an AI strategy memo for a dealer principal or board.

[Skill source](./skills/dealer-ai-readiness-audit/SKILL.md) · [Framework reference](./skills/dealer-ai-readiness-audit/REFERENCE.md)

### More skills coming

The roadmap includes additional skills in the categories below. Star this repo to be notified as they ship.

- AEO audit for car dealers
- Dealer call transcript classifier with strict sales/non-sales rules
- llms.txt generator for dealer sites
- VDP merchandising review
- Equity mining campaign builder
- F&I compliance checker
- Service drive declined-recovery designer
- Dealer GBP audit

## Install

### Option 1. Claude Code plugin marketplace (recommended)

Inside Claude Code, run:

```
/plugin marketplace add arielcoro/dealer-ai-skills
/plugin install dealer-ai-readiness-audit@dealer-ai-skills
```

The skill activates automatically when relevant phrases come up in conversation.

### Option 2. Direct skill copy

Clone the repo and copy the skill folder into your local Claude skills directory.

```
git clone https://github.com/arielcoro/dealer-ai-skills.git
cp -r dealer-ai-skills/skills/dealer-ai-readiness-audit ~/.claude/skills/
```

### Option 3. Other coding agents

Skills here follow the standard SKILL.md format (YAML frontmatter plus Markdown body) and are designed to work with any agent that loads agent-skill files: Cursor, Codex, Gemini CLI, and others. Drop the skill folder into the agent's skills directory.

## How to use the audit

Once installed, ask Claude any of these:

- "Run the Dealer AI Readiness Audit on my store."
- "Score my Buick GMC dealership on AI readiness."
- "Is my dealership ready to buy an AI BDC?"
- "Do an AI strategy audit of our store before we commit to the vendor."

The skill will ask whether to run in Guided mode (full 75-item walkthrough, 30 to 60 minutes) or Fast-track mode (one diagnostic question per section, about 10 minutes), confirm a short dealership profile, score every section, and produce a final report with band, top-five gaps, and a 30/60/90 day remediation roadmap.

## Why this exists

There is a reason most dealer AI projects underperform. It is not the AI. It is the dealership. A store with a messy CRM, a slow website, no governance, and a BDC running on hope cannot install a chatbot and suddenly become a tech company. The AI exposes the cracks faster.

This marketplace exists to make rigorous, vendor-neutral diagnostics installable inside the agent the dealer already uses. The audit framework is the same one Ariel Coro runs on prospect and client stores at Dealer Growth Hackers before any AI engagement.

## About the author

Ariel Coro is the founder of Dealer Growth Hackers and the publisher of [Dealer AI Guy](https://www.dealeraiguy.com). He keynotes on AI, innovation, and immigrant entrepreneurship under "Innovating with an Accent." His agency's work has taken a top-five national GMC store from 2,955 deliveries in 2023 to 3,955 in 2025, a 34% unit-sales increase across that window. He is a former recurring tech expert on Univision's Despierta America and the author of "El Salto" (Random House) and "The Answer Engine."

## License

MIT. See [LICENSE](./LICENSE).

## Contributing

This is a single-author marketplace at present. Issues and structured feedback welcome via GitHub Issues. Pull requests are reviewed but not all will be merged; the marketplace is curated rather than community-edited.

## Disclaimer

Skills in this marketplace produce directional guidance, not legal or financial advice. Items referencing the FTC Safeguards Rule, OFAC, state AI laws (Colorado AI Act, etc.), adverse action requirements, and consumer protection statutes are operational checklists, not compliance opinions. Consult your compliance officer and legal counsel before acting on regulatory findings.
