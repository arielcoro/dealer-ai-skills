#!/bin/bash
# Reconstruct dealer-ai-skills version history
# Creates 9 commits + 9 tagged releases (v1.1.0 through v1.9.0)
# Each version's marketplace.json snapshot reflects only the skills shipped by that version
# Landing page lands in final state at v1.9.0
#
# Run from inside the dealer-ai-skills directory.
# Requires: git, jq, gh CLI authenticated as arielcoro

set -e

REPO_DIR="$HOME/DealerAIGuy/dealer-ai-skills"
cd "$REPO_DIR"

# Sanity checks
[ -f ".claude-plugin/marketplace.json" ] || { echo "marketplace.json not found. Are you in the repo?"; exit 1; }
[ -f "skills/dealer-email-flows/SKILL.md" ] || { echo "skill #15 not found. Did the last batch build?"; exit 1; }

# Verify git identity is arielcoro
GH_USER=$(gh api user --jq .login 2>/dev/null || echo "")
if [ "$GH_USER" != "arielcoro" ]; then
  echo "WARNING: gh CLI is authenticated as '$GH_USER' (expected: arielcoro)"
  echo "Run: gh auth switch --user arielcoro"
  echo "Press Ctrl+C to abort, or Enter to continue anyway..."
  read
fi

# Save the final marketplace.json — we'll filter it for each version
cp .claude-plugin/marketplace.json /tmp/marketplace-final.json

# Function: filter marketplace.json to only include named skills
filter_marketplace() {
  local skills_json="$1"
  jq --argjson skills "$skills_json" \
    '.plugins |= map(select(.name as $n | $skills | index($n)))' \
    /tmp/marketplace-final.json
}

# Function: create version, commit, tag, release
ship_version() {
  local version="$1"
  local marketplace_skills="$2"
  local add_paths="$3"
  local commit_msg="$4"
  local release_title="$5"
  local release_notes="$6"

  echo ""
  echo "=== Shipping $version ==="

  # Write version-specific marketplace.json
  filter_marketplace "$marketplace_skills" > .claude-plugin/marketplace.json

  # Stage paths for this version
  for path in $add_paths; do
    git add "$path"
  done
  git add .claude-plugin/marketplace.json

  # Commit
  git commit -m "$commit_msg"

  # Tag
  git tag "$version"

  # Push commit + tag
  git push
  git push origin "$version"

  # Create GitHub release
  gh release create "$version" \
    --title "$release_title" \
    --notes "$release_notes"

  echo "$version shipped"
}

# ============================================================
# v1.1.0 — dealer-aeo-audit
# ============================================================
V11_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit"]'
ship_version "v1.1.0" \
  "$V11_SKILLS" \
  "skills/dealer-aeo-audit/" \
  "Add dealer-aeo-audit (v1.1.0): 30-check AEO audit for car dealers" \
  "v1.1.0 — Dealer AEO Audit" \
  "Adds dealer-aeo-audit, a 30-check, 10-dimension AEO audit for franchise and independent car dealers. Covers AI crawler access, llms.txt, schema markup, entity reinforcement, conversational content, third-party citations, reviews, live AI engine spot-checks, and technical foundation."

# ============================================================
# v1.2.0 — dealer-llms-txt-generator + privacy/terms
# ============================================================
V12_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator"]'
ship_version "v1.2.0" \
  "$V12_SKILLS" \
  "skills/dealer-llms-txt-generator/ landing/privacy.html landing/terms.html" \
  "Add dealer-llms-txt-generator (v1.2.0): paste-ready llms.txt for car dealers; add privacy + terms pages" \
  "v1.2.0 — Dealer llms.txt Generator" \
  "Adds dealer-llms-txt-generator, a curated llms.txt builder for franchise and independent car dealers. Pairs with dealer-aeo-audit: the audit finds the gap, this skill closes it. Strict no-URL-fabrication rule. Supports single rooftops, dealer groups, and bilingual dealers. Also adds privacy policy and terms of use pages."

# ============================================================
# v1.3.0 — dealer-site-score
# ============================================================
V13_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator","dealer-site-score"]'
ship_version "v1.3.0" \
  "$V13_SKILLS" \
  "skills/dealer-site-score/" \
  "Add dealer-site-score (v1.3.0): the dealer website grader, 100-point evaluation" \
  "v1.3.0 — Dealer Site Score" \
  "Adds dealer-site-score, the dealer website grader. 100-point evaluation across 10 dimensions: performance (Core Web Vitals), hosting, crawlability, security, schema, mobile, accessibility, third-party tag bloat, conversion elements, and dealer-specific signals. Produces a letter grade and prioritized fix list. The agent-installable version of dealersitescore.com."

# ============================================================
# v1.4.0 — dealer-aeo-content-brief
# ============================================================
V14_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator","dealer-site-score","dealer-aeo-content-brief"]'
ship_version "v1.4.0" \
  "$V14_SKILLS" \
  "skills/dealer-aeo-content-brief/" \
  "Add dealer-aeo-content-brief (v1.4.0): AEO content briefs with 7 dealer page patterns" \
  "v1.4.0 — Dealer AEO Content Brief" \
  "Adds dealer-aeo-content-brief, a generator for Answer Engine Optimization content briefs. Outputs paste-ready briefs with target query, page type, opening 100 words verbatim, section outline, required Q&A with AI extraction sentences, schema spec, and image specs. Pairs with dealer-aeo-audit. Includes seven dealer-specific page patterns."

# ============================================================
# v1.5.0 — call-transcript-classifier + equity-mining-campaign-builder + vdp-merchandising-review
# ============================================================
V15_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator","dealer-site-score","dealer-aeo-content-brief","dealer-call-transcript-classifier","dealer-equity-mining-campaign-builder","dealer-vdp-merchandising-review"]'
ship_version "v1.5.0" \
  "$V15_SKILLS" \
  "skills/dealer-call-transcript-classifier/ skills/dealer-equity-mining-campaign-builder/ skills/dealer-vdp-merchandising-review/" \
  "Add 3 new skills (v1.5.0): call transcript classifier, equity mining campaign builder, VDP merchandising review" \
  "v1.5.0 — Three new skills" \
  "Adds three skills to the dealer-ai-skills marketplace. dealer-call-transcript-classifier classifies dealer calls into Sales / Service / Parts / Finance / Other with a strict honesty rule. dealer-equity-mining-campaign-builder builds complete equity mining campaigns across SMS, email, and ringless voicemail with six personas. dealer-vdp-merchandising-review audits VDPs across 10 dimensions with OEM-specific brand awareness."

# ============================================================
# v1.6.0 — dealer-customer-sentiment-analyzer
# ============================================================
V16_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator","dealer-site-score","dealer-aeo-content-brief","dealer-call-transcript-classifier","dealer-equity-mining-campaign-builder","dealer-vdp-merchandising-review","dealer-customer-sentiment-analyzer"]'
ship_version "v1.6.0" \
  "$V16_SKILLS" \
  "skills/dealer-customer-sentiment-analyzer/" \
  "Add dealer-customer-sentiment-analyzer (v1.6.0): honest review analysis" \
  "v1.6.0 — Dealer Customer Sentiment Analyzer" \
  "Analyzes dealer reviews honestly. Reads the text, not just the star rating. Department breakdown, top themes with quoted evidence, named-staff mentions, trend analysis, and response priority list."

# ============================================================
# v1.7.0 — dealer-search-strategy + SEO/AEO/GEO terminology expansion
# ============================================================
V17_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator","dealer-site-score","dealer-aeo-content-brief","dealer-call-transcript-classifier","dealer-equity-mining-campaign-builder","dealer-vdp-merchandising-review","dealer-customer-sentiment-analyzer","dealer-search-strategy"]'
ship_version "v1.7.0" \
  "$V17_SKILLS" \
  "skills/dealer-search-strategy/ skills/dealer-aeo-audit/SKILL.md skills/dealer-llms-txt-generator/SKILL.md skills/dealer-aeo-content-brief/SKILL.md" \
  "Add dealer-search-strategy (v1.7.0) and expand SEO/AEO/GEO terminology across marketplace" \
  "v1.7.0 — Dealer Search Strategy (SEO + AEO + GEO unified)" \
  "Adds dealer-search-strategy, a comprehensive search strategy document generator covering SEO, AEO, and GEO. Clarifies the difference between the three. Produces a unified 4-pillar strategy with an integrated 90-day roadmap. Also expands SEO/AEO/GEO terminology across dealer-aeo-audit, dealer-llms-txt-generator, and dealer-aeo-content-brief activation triggers and keywords."

# ============================================================
# v1.8.0 — dealer-ai-visibility
# ============================================================
V18_SKILLS='["dealer-ai-readiness-audit","dealer-aeo-audit","dealer-llms-txt-generator","dealer-site-score","dealer-aeo-content-brief","dealer-call-transcript-classifier","dealer-equity-mining-campaign-builder","dealer-vdp-merchandising-review","dealer-customer-sentiment-analyzer","dealer-search-strategy","dealer-ai-visibility"]'
ship_version "v1.8.0" \
  "$V18_SKILLS" \
  "skills/dealer-ai-visibility/" \
  "Add dealer-ai-visibility (v1.8.0): AI citation tracker + competitor share matrix" \
  "v1.8.0 — Dealer AI Visibility" \
  "Adds dealer-ai-visibility, the AI citation tracker for car dealers. Monitors what ChatGPT, Perplexity, Gemini, Claude, and Google AI Mode are actually saying. 25-30 query taxonomy with bilingual variants. Seven-bucket citation source taxonomy with weighted scoring. Competitive citation share matrix vs named competitor rooftops. Branded at dealeraivisibility.com."

# ============================================================
# v1.9.0 — positioning + comparison + onboarding + email flows + LANDING PAGE FINAL STATE
# ============================================================
echo ""
echo "=== Shipping v1.9.0 (final, with landing page) ==="

# Restore the final marketplace.json (all 15 plugins)
cp /tmp/marketplace-final.json .claude-plugin/marketplace.json

# Stage all final files
git add skills/dealer-store-positioning/ \
        skills/dealer-comparison-page-builder/ \
        skills/dealer-new-customer-onboarding/ \
        skills/dealer-email-flows/ \
        .claude-plugin/marketplace.json \
        landing/index.html \
        reconstruct-history.sh

git commit -m "Add 4 new skills (v1.9.0): positioning, comparison page builder, onboarding, email flows; finalize landing page

Skills:
- dealer-store-positioning
- dealer-comparison-page-builder
- dealer-new-customer-onboarding
- dealer-email-flows

Plus comprehensive landing page redesign with SEO/AEO/GEO explainer, release banner, and final skill catalog."

git tag v1.9.0
git push
git push origin v1.9.0

gh release create v1.9.0 \
  --title "v1.9.0 — Four skills: Positioning, Comparison, Onboarding, Email Flows" \
  --notes "Adds four skills covering the post-positioning marketing loop.

**dealer-store-positioning** — Foundational positioning brief plus marketing-team-ready content kit. Used as input by every other marketing skill in the marketplace.

**dealer-comparison-page-builder** — One in-depth comparison page per run, with fair-play rules and a sales floor talk track.

**dealer-new-customer-onboarding** — 90-day multi-channel post-sale program built around the critical sales-to-service handoff.

**dealer-email-flows** — 17 dealer-specific lifecycle email flows (no abandoned-cart pattern), with TCPA compliance guardrails.

Marketplace now contains 15 skills total."

echo ""
echo "============================================"
echo "All 9 releases shipped. Verify at:"
echo "https://github.com/arielcoro/dealer-ai-skills/releases"
echo "============================================"
