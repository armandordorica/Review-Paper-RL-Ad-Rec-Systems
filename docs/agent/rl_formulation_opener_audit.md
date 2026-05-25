# RL Formulation Opener (Section 4.0): Revision And Reviewer-Risk Audit

Scope: `paper.tex`, the opener for `\section{The RL Formulation of Jointly Optimizing Ads and Content}` and the notation blueprint introduced earlier in Table~\ref{tab:comparison}. The rendered opener now appears before `\subsection{Reward Design for Monetization-Aware Recommendation Systems}` and formalizes joint ad and organic ranking as an MDP.

Latest refresh: May 25, 2026 (noon). Refreshed after the Section 4 opener landed in `paper.tex`: the FrozenLake source block was removed, a dedicated MDP-formulation subsection was added, Table 1 was redesigned as a compact notation guide near the beginning of the paper, and the opener now defines partial observability plus the logging-policy/target-policy distinction.

## Reviewer context used

Anchored to direct quotes from `docs/agent/reviewers.txt`. Reviewer comments respond to `original_submission_paper.pdf` (workspace root), not the current `paper.tex`. Three-state classification (per `/revise-rl-ad-paper` calibration): the original Section 4 opener content (FrozenLake/GridWorld block at submitted-PDF page 14, lines 374-386) was **present in submission and reviewer-flagged**; the inline MDP definition that lived at submitted page 17 inside §4.2 was **present in submission and reviewer-flagged**; a dedicated MDP-formulation subsection with notation table is **not present in submission**, so the new content carries author responsibility but is responsive to a specific R2 named ask.

- **Associate Editor:** *"clear definitions of the problems are needed at the beginning. E.g., is the goal to select and rank ads independently, or to rank ads and recommendations jointly; or both?"* → O3.
- **Associate Editor:** *"the focus of the work is not always entirely clear. Various discussions in the paper do not seem specific to ad policies and the joint optimization of ads and recommendations."* → O1 (ad-policy framing of the MDP), O3.
- **Reviewer 1 Major Comment 2:** *"the Frozen Lake example does not meaningfully contribute to understanding the core problems faced in real-world ad and recommendation systems. The paper would be much stronger with focused, domain-relevant illustrations (e.g., simplified bandit-based ad selection examples)."* → O6 (remove commented-out FrozenLake block), O7 (replace with ad-policy worked example).
- **Reviewer 1 Major Comment 4:** *"Several technical terms are used before they are defined, which hinders clarity. For example, 'displacement cost' appears early but is only briefly defined much later in the appendix. Ensuring that all terms are defined when first introduced would improve accessibility."* → O2 (notation table) and O4 (define partial observability and logging policy at top).
- **Reviewer 2 (primary motivation for this audit):** *"The RL-formulation (in section 4) is spread out into different subsections, introducing different components in each section. Although this might be essential for the structure of the paper, it would be better to have a separate subsection introducing the RL task (eg: formulating as MDP, etc) with the necessary notations. Include a table of notation if possible."* → O1, O2, O5.
- **Reviewer 2 (general):** *"Several statements about adaptability of RL and its traits on recommenders and ad-related systems, are not sufficiently backed by literature. Some of the cited work on these claims are on general RL research, not specific to ad-policies/recommenders."* → O8 (citation hygiene: pair `Sutton1998` and `puterman2014markov` with ad-policy MDP anchors such as `zhao2021dear`, `ie2019slateq`, `chen2022off`).
- **`revision_rules.md`:** §3 (each chapter except the first should begin with a short introductory paragraph and end with a summary section) → O1 + O5 (Section 4 currently lacks both). §7.1 (no orphans, no redundancy, claim-citation alignment) → O8.

## Current Overall Assessment

Section 4 now has a rendered opener. The subsection `Formulating Joint Ad and Organic Ranking as a Markov Decision Process` defines the MDP tuple, states the joint ad-plus-organic action space, explains the blended reward objective, introduces partial observability, and defines the logging-policy/target-policy gap for offline learning and evaluation. Table 1 now acts as the notation guide near the beginning of the paper rather than as a bloated MDP-component table.

Estimated reviewer-aligned score for this subsection: **8.5 / 10**. Reviewer 2's explicit ask for a separate MDP-formulation subsection with notation is substantially closed. The remaining risk is not the absence of an opener, but whether later subsections should be lightly edited to refer back to the new notation instead of re-introducing it locally.

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

## Pending Revision Items

### Structural items (remaining work)

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O7.** Consider adding a single ad-policy worked example to the opener if the subsection still feels abstract after review. R1 asked for *"focused, domain-relevant illustrations (e.g., simplified bandit-based ad selection examples)"*. The current opener removes FrozenLake and gives domain-specific notation, but it does not include a worked example. Keep any future example to one compact paragraph.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O8.** Propagate the unification in a later pass. Sections 4.2, 4.3, and 4.4 can now refer back to the opener and Table~\ref{tab:comparison} rather than re-introducing $\mathcal{A}$, $\mathcal{S}$, and $\pi$ locally. This should be a separate edit because it touches multiple subsections and may affect local citations.

### Calibration items (handle inherited content)

All inherited FrozenLake/GridWorld source content in the opener region has been removed. No live references to `tab:frozen_lake` or `frozenlake-table.png` should be reintroduced.

### Citation and bibliography items

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O9.** Bibliography hygiene check: the bibliography contains both `dulac2019challenges` and `dulac2021challenges` (flagged in `introduction_audit.md` I10/I11 as possible duplication). The opener should cite at most one of these for the partial-observability and policy-shift framing. Verify which is the correct primary source (the 2019 conference version vs.\ the 2021 journal version of "Challenges of Real-World Reinforcement Learning") and use only the chosen one in O4. The other can be deduplicated paper-wide as a follow-up.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O10.** Internal-style: avoid citing `Sutton1998` more than once in the opener subsection. The textbook is correctly cited at line 105 (intro), at multiple points in Sections 4.2-4.5, and is at risk of being over-used. Pair its appearance in the opener with `puterman2014markov` for definitional duty (consistent with current Section 4.3 line 717 usage) and reserve `Sutton1998` for the cumulative-discounted-return statement.

## Implemented Notation Table (O2)

Table~\ref{tab:comparison} is now the implemented notation guide. It remains near the beginning of the paper, where it serves as a blueprint, rather than appearing as a new float inside Section 4. The table is not a one-to-one map of Section 4 subsections. It defines recurring RL constructs that readers need across the paper: environment, goal, episode/horizon, state, action, reward, policy, exploration strategy, and logging policy. The goal row now frames the objective as a weighted utility over monetization, engagement, retention, and user-experience costs rather than assuming monetization grows while engagement remains fixed. Exploration strategy and logging policy are separated because exploration is an action-selection strategy for reducing uncertainty, while the logging policy is the historical or experimental data-generating policy used for offline replay and off-policy learning.

## Citation Adequacy Scores (anchors that the new opener will need)

| Citation | Intended use in opener | Adequacy | Assessment |
|---|---|---:|---|
| `Sutton1998` | MDP formalism reference; cumulative-discounted-return objective | 10 | Canonical RL textbook; the appropriate definitional anchor. |
| `puterman2014markov` | MDP definition; Markov property | 9 | Canonical MDP source; complements `Sutton1998` and is already used at line 717. |
| `zhao2021dear` | Ad-policy MDP framing (DEAR / TikTok) | 10 | Directly ad-policy. Strongest available industrial anchor for the MDP framing. |
| `ie2019slateq` | Slate-based action and partial observability | 9 | Directly ad-policy via slate ranking; ties cleanly to the joint ad + organic story. |
| `chen2022off` | Off-policy actor-critic for recsys; framing of $\pi_b$ vs target $\pi$ | 9 | YouTube industrial deployment; correct anchor for logging-policy distinction. |
| `dulac2019challenges` *or* `dulac2021challenges` | Partial observability + real-world RL challenges | 8 | Choose one in O4 / O9. Avoid double-citation. |
| `swaminathan2015counterfactual` | Counterfactual-evaluation lead-in | 8 | Anchors the logging-policy framing; already used elsewhere; keep parsimonious. |
| `afsar2022reinforcement` | Survey-level RL-for-recsys reference | 7 | Useful for one sentence connecting this opener to the broader RL-for-recsys literature; avoid over-using. |

The opener should contain at most 8-12 citations total. Anything more triggers `/write-rl-paper` Section 7B (no citation dumping).

## Three-State Calibration Summary

| Element | Original-submission status | Current status |
|---|---|---|
| FrozenLake/GridWorld pedagogy block | `[F]` present in submission, R1 Major 2 explicitly flagged | `[DONE]` removed from the opener source. |
| Inline MDP definition $(S, A, P, R)$ at original page 17 | `[F]` present in submission, R2 explicitly flagged as "spread out" | `[DONE]` promoted into a dedicated opener via O1. |
| Notation table | not present in submission | `[DONE]` Table 1 redesigned as the notation guide; reviewer-aligned because R2 explicitly asked for notation. |
| Forward references to 4.1-4.5 | not present in submission | `[DONE]` opener maps later subsections back to reward, action, state, policy learning, and exploration. |
| Joint ad + organic objective in formal MDP terms | partial (informal in intro and methodology) | `[DONE]` opener states joint ad-plus-organic action space and single optimization objective. |
| Ad-policy worked example | not present (FrozenLake stood in for it) | `[N]` to be added via O7; reviewer-aligned because R1 Major 2 explicitly asked for "domain-relevant illustrations (e.g., simplified bandit-based ad selection examples)" |

The remaining items in this audit are follow-up improvements, not the primary Reviewer 2 blocker.

## Recommended Order of Execution

1. Review the rendered opener and Table 1 for readability.
2. Decide whether O7's worked example is still needed after the notation guide and opener now use domain-specific ad-ranking language.
3. Execute O8 as a follow-on cleanup pass: edit Sections 4.2, 4.3, and 4.4 to forward-reference the new opener instead of re-introducing notation locally.
4. Run O9/O10 citation hygiene if the follow-on pass adds or moves citations.

## Resolved Revision Items

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **O1.** Added `\subsection{Formulating Joint Ad and Organic Ranking as a Markov Decision Process}` under Section 4. The opener defines the MDP tuple and interprets it in joint ad and organic ranking terms.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **O2.** Redesigned Table 1 as a compact notation guide near the beginning of the paper, preserving environment, goal, episode/horizon, action, and policy while adding notation. Subsequent refinement corrected the goal row to a weighted-utility framing and split exploration strategy from logging policy.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **O3.** Restated the joint ad-plus-organic objective through the action-space decomposition and blended reward discussion.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **O4.** Defined partial observability and logging policy in the opener, including the on-policy contrast that explains why logged ad data require off-policy correction.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **O5.** Closed the opener with forward references to the reward, action-space, state-space, policy-learning, and exploration/exploitation subsections.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **O6.** Removed the commented-out FrozenLake/GridWorld source block from the opener region.

## Out Of Scope For This File

- Section 4.1 Reward Design prose: handled in `reward_design_citation_audit.md`.
- Section 4.2 Action Space prose: no audit file exists yet; should be opened separately if substantive changes are made.
- Section 4.3 State Space prose: handled in `state_space_citation_audit.md` (citation focus only; prose audit not yet opened).
- Section 4.4 Policy Learning prose: handled in `policy_learning_citation_audit.md`.
- Section 4.5 Exploration/Exploitation: no audit file exists yet; should be opened separately.
- Tables 3-4 vs Figures 3-4 labeling consistency (Reviewer 2): paper-wide concern, belongs in a future `tables_figures_audit.md`. The notation table to be added here should be labeled and positioned in a way that is consistent with however that audit decides to standardize table labeling.
- Bibliography deduplication outside the opener's local citation set.

## Working Rules

- Apply changes one at a time when the user wants approval-gated revision.
- Preserve `paper.tex` paragraph style unless reflow is explicitly requested.
- Move resolved items from Pending to Resolved with a one-line explanation.
- Apply `/write-rl-paper` Section 7 citation audit to every citation added in the new opener.
- Apply `/revise-rl-ad-paper` three-state calibration to each proposed change; do not claim reviewer alignment for items that fail the three-state check.
- After O1-O5 land, update `paper_audit_master.md`: move Tier 1 item #1 to a "resolved" state in this file, and re-rank the master's priority queue.
