# Abstract: Revision To-Do

Scope: `paper.tex`, `\begin{abstract} ... \end{abstract}` (currently lines 57-81).

Latest state of the abstract evaluated: May 16, 2026 (third pass).

## Reviewer context used

- Associate Editor: do not use references in the abstract, use bold sparingly, highlight the introductory/tutorial nature of the work targeted at industry practitioners, give clear problem definitions early (e.g., independent ad selection vs joint ad + organic ranking).
- Reviewer 1: limited discussion of joint optimization, evaluation underdeveloped, citation alignment concerns (including a flagged claim about ads underperforming relative to organic content), novelty marked Fair partly because contribution beyond prior surveys is implicit.
- Reviewer 2: emphasis on ad-policies is insufficient, RL methods coverage should be tighter.

## Current overall assessment

The abstract is now substantively reviewer-aligned. Estimated reviewer-aligned score: **9 / 10**, up from 8 / 10 at the previous pass and 6.5 / 10 at the start of this revision cycle.

What works now:

- No references, no bold, no `[Test]` placeholder.
- The ads-vs-organic motivation is framed as a structural trade-off between monetization and engagement objectives, not as an unsupported empirical claim.
- "Traditional methods" replaced by "Many production systems" (less time-loaded, less value-loaded against SL).
- Several overclaim phrases removed: "well-known", "more principled", "open research challenge", "robust".
- MDP framing is explicit and clean: "formulates the MDP (state, action, reward) and learns its policy".
- The survey contribution is stated: "contributes...distilling design choices, trade-offs, and evaluation practices through a unifying taxonomy".
- Offline/counterfactual RL value is now named explicitly as a capability ("enable policy learning from logged interaction data") rather than just a method name.
- Practitioner framing is now explicit: "This survey, aimed at industry practitioners, ..." (addresses AE explicit ask).
- Evaluation is now named as a survey axis: "distilling design choices, trade-offs, and evaluation practices" (addresses AE + both reviewers).

What still falls short of reviewer asks:

- "Fully online RL is theoretically appealing" still reads as a broad RL framing (P3 polish).
- The RL-framework paragraph (line 67) sits alone between the methods gap and the synthesis; merging it into the synthesis would tighten the abstract (P2 structure).
- Two minor redundancy and whitespace items in the opening paragraph (P3 cleanup).

## Legend

Priority and status are color-coded using inline HTML. Colors render in Cursor / VS Code markdown preview and most rich markdown viewers; on GitHub the text labels remain readable even if colors are stripped.

**Priority:**
<span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> critical / cannot ship
&nbsp;
<span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> blocker / must-fix
&nbsp;
<span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> should-fix
&nbsp;
<span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> nice-to-have

**Status:**
<span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> not started
&nbsp;
<span style="background:#0d6efd;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">IN PROGRESS</span> being edited
&nbsp;
<span style="background:#ffc107;color:black;padding:2px 8px;border-radius:4px;font-weight:bold">PENDING REVIEW</span> awaiting user sign-off
&nbsp;
<span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> applied and committed

## Pending items

### Structure

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **A8.** Merge the RL-framework paragraph (line 67) into the synthesis paragraph (lines 69-81), since it currently sits alone between the methods-gap paragraph and the contribution paragraph. Yields a tighter 3-paragraph abstract (problem, methods gap, framework + contribution + findings).

### Wording / safety

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **A4.** Soften "fully online RL is theoretically appealing" (line 75) to an operational framing, e.g., "while fully online RL is conceptually attractive, it is rarely deployed end to end in production..." Reviewers pushed back on broad RL framings.

### Cleanup

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **A17.** Tighten redundancy at end of opening paragraph (line 60). The two sentences "The key challenges in achieving this balance include ad selection, ranking, and integration with organic content. These involve decisions about whether to insert an ad, which ad to select, and where to place it." say almost the same thing twice. Consider collapsing into one sentence.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **A18.** Remove trailing space at end of line 60.

## Resolved items

Status assessed against the current abstract on May 16, 2026.

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A1.** `[Test]` prefix removed.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A2.** Stray `\\` removed.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A3.** "Ads often underperform..." reframed as a structural trade-off: "Ads are central to platform revenue, but jointly serving them with organic content creates trade-offs between monetization and user experience." No empirical claim, no citation risk.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A7.** Joint optimization scope is named consistently as "joint optimization of ads and organic content" — answers AE's question (it is joint).
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A10.** Transition between opening and methods-gap paragraphs smoothed with "these decisions" bridge. Decision: keep paragraphs separated by design (problem vs gap), do not merge.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A9.** Survey contribution is now explicit: "contributes...distilling design choices and trade-offs through a unifying taxonomy". Does not yet differentiate from `lin2023survey` / `afsar2022reinforcement` by name, but the contribution is no longer implicit. Reopen as A9b if a head-to-head distinction is wanted.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A11.** MDP framing made explicit: "formulates the MDP (state, action, reward) and learns its policy". Addresses Reviewer 2's request.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A5.** Practitioner framing now explicit: "This survey, aimed at industry practitioners, ..." (line 69). Addresses AE explicit request with a 4-word inline modifier, no new sentence.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A6.** Evaluation named as a survey axis: "distilling design choices, trade-offs, and evaluation practices..." (lines 71-72). Addresses AE and both reviewers in the same sentence as A5.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A12.** "Well-known challenge" → "challenge in the industry" (dropped overclaim).
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A13.** "More principled formulation" → "A formulation that accounts for..." (dropped overclaim implying current SL methods are unprincipled).
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A14.** "Remains an open research challenge" → "remains an active area of research".
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A15.** "Robust short-term estimation" → "short-term estimation" (dropped unsupported empirical adjective).
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A16.** Closing sentence rephrased to upgrade "offline replay" into "counterfactual policy evaluation" and to name the value-add: "enable policy learning from logged interaction data". Captures the off-policy / counterfactual capability of RL without adding a new sentence.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A-traditional.** "Traditional methods" → "Many production systems" (less time-loaded, less value-loaded against SL).

## Out of scope for this file

- Citation audits for body sections live in `reward_design_citation_audit.md`, `state_space_citation_audit.md`, and `policy_learning_citation_audit.md`.
- Document-wide revision conventions live in `revision_rules.md`.

## Working rules

- Apply changes one at a time, with explicit approval per item, consistent with the repo workflow.
- Preserve `paper.tex` paragraph style. Do not reflow existing paragraphs in the source unless the change explicitly says so.
- When proposing replacement text in chat, wrap suggestions in fenced `latex` blocks with short physical line widths, per `format-suggested-sentences.mdc`.
- When updating an item's status, swap the colored status badge in place (TODO → IN PROGRESS → PENDING REVIEW → DONE).
- When an item is resolved, move it from Pending to Resolved with a one-line summary of how it was resolved.
