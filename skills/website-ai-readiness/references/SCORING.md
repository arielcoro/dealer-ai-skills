# Evidence-aware scoring

This is a publisher-defined diagnostic rubric, not an industry certification or provider ranking metric.

Assign each applicable check Pass = 1, Partial = 0.5, Fail = 0, or Unknown = untested/insufficient evidence. N/A requires a reason and removes the check from the applicable denominator. Unknown is not a failure and never becomes a pass through assumption.

For a category with weight W, A applicable checks and T tested checks:
- Confirmed earned points = W × sum(tested values) / A.
- Untested possible points = W × (A − T) / A.
- Coverage = T / A.

Add across categories to show an evidence-bounded range: earned points through earned + untested possible points, out of 100. Example: a 25-point category with 5 applicable checks, values 1, 0.5, 0 and 2 unknowns earns 7.5 points with 10 unknown points: range 7.5–17.5, coverage 60%. If all categories are tested, the range collapses to a single score. A wholly N/A category means no overall /100 score: show applicable-category results and explain why instead of silently redistributing weights.

At less than 80% weighted coverage, label the overall result provisional and avoid a readiness band. At 80% or greater, use a band only if the entire possible range fits one band; otherwise report the range without a band. Diagnostic bands: 85–100 strong foundation, 65–<85 improvements needed, 40–<65 significant gaps, <40 foundational blockers.

A critical observed blocker (for example the intended public product pages inaccessible, materially misleading price facts, or primary handoff unusable) must lead the verdict even when the numerical result is high. Do not imply a high score cancels a blocker. Missing optional llms.txt or MCP is not a blocker. Record confidence separately from severity and score.
