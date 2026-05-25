# RL Formulation Opener (Section 4.0): Revision And Reviewer-Risk Audit

Scope: `paper.tex`, the area between `\section{The RL Formulation of Jointly Optimizing Ads and Content}` (line 291) and `\subsection{Reward Design for Monetization-Aware Recommendation Systems}` (line 323). At present this region contains only commented-out content (lines 293-321: the FrozenLake/GridWorld pedagogy block from the original submission). No rendered text appears between the section header and the first subsection.

Latest refresh: May 24, 2026 (late evening). Initial audit, opened as the **Tier 1 item #1** in `paper_audit_master.md`: address Reviewer 2's explicit ask for a dedicated MDP-formulation subsection with notation. Anchored to `original_submission_paper.pdf` pages 14-18 (the original `4 The RL formulation of the Ad Recommendation Problem` opener and the inline MDP definition that lived inside §4.2 Action Space in the submitted manuscript).

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

Section 4 currently has **no rendered opening paragraph**. The reader transitions from the close of Section 3.2 (line 289) into `\section{The RL Formulation of Jointly Optimizing Ads and Content}` at line 291 and immediately into `\subsection{Reward Design for Monetization-Aware Recommendation Systems}` at line 323, with only commented-out FrozenLake content in between. This is the single most reviewer-visible structural omission in the manuscript: Reviewer 2 named the fix directly, and Reviewer 1's "terminology before definition" complaint is in part a downstream consequence of having no notation table.

The closest substitute for an MDP-tuple definition currently appears at line 717 inside `\subsection{State Space Representation}`: *"Together with the action space $\mathcal{A}$, a transition kernel $P(s' \mid s, a)$, a reward function $R(s, a)$, and a discount factor $\gamma \in [0, 1)$, the state space is one component of the Markov decision process (MDP)..."* That is the right tuple, but it is buried inside a subsection and re-introduces the action space, which has already been introduced at line 651. This is exactly the *"spread out into different subsections, introducing different components in each section"* pattern R2 flagged.

Estimated reviewer-aligned score for this subsection: **3 / 10** (empty stub; the primary R2 named ask is the dominant unaddressed reviewer-flag item in the manuscript). Score after the recommended five-item resolution plan: **9 / 10**, since the work is structurally well-defined and the upstream content (introduction MDP framing, methodology MDP mapping table, per-component subsections) already provides everything the opener needs to synthesize.

The unblocking move closes Reviewer 2's single most-cited specific complaint, forces R2 to fall back on generic structure/writing critiques, and re-anchors the rest of Section 4 against a unified notation. The companion benefit is that Sections 4.2, 4.3, 4.4 can each drop their inline re-introductions of $\mathcal{S}, \mathcal{A}, \pi$ and instead state *"the state space $\mathcal{S}$ defined in Section 4.0 ..."*, which reduces the section-level redundancy R2 also flagged.

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

### Structural items (the main work)

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O1.** Add a new subsection `\subsection{Formulating Joint Ad and Organic Ranking as a Markov Decision Process}` (or similar) between lines 291 and 323. Open with a single-paragraph section-level introduction that names the goal (Section 4 formalizes joint ad and organic ranking as an MDP), states the four-component agenda (action 4.2, state 4.3, policy 4.4, exploration 4.5; reward design in 4.1 as the connective tissue), and forward-references each subsection. Then state the MDP tuple $(\mathcal{S}, \mathcal{A}, P, R, \gamma)$ in a single coherent block, with each element interpreted explicitly in joint ad + organic terms (e.g., $a_t$ may be an ad selection, a slate composition, an ad-load lever, or a control on reserve price; $r_t$ is a blended utility over revenue, engagement, and fatigue; $\mathcal{S}$ aggregates user-level, session-level, and platform-level signals at decision time). Close with a two-sentence acknowledgment that real ad-policy MDPs are partially observable and that the logging policy that generated training data differs from the target policy being evaluated (which motivates Section 4.4 + the future evaluation section). Anchor on `Sutton1998, puterman2014markov` for the MDP formalism and on `zhao2021dear, ie2019slateq, chen2022off` for the ad-policy framing. **This is Tier 1 item #1 in `paper_audit_master.md`.**
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O2.** Add a notation table directly after the MDP-tuple definition in O1. Reviewer 2 explicit ask: *"Include a table of notation if possible."* Recommended structure (single column for symbol, second column for type, third column for ad-policy meaning), drafted below in the *Proposed Notation Table* subsection. Position the table in-line at first reference (`revision_rules.md` §3 and Reviewer 2's general table-positioning concern).
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O3.** Within the opener, restate the joint ad + organic objective formally. AE quote: *"is the goal to select and rank ads independently, or to rank ads and recommendations jointly; or both?"* The introduction (line 91) and the methodology table (line 131) both answer this informally. The MDP opener should state the formal version: $\max_\pi \mathbb{E}_{\tau \sim \pi}\left[\sum_{t=0}^{\infty} \gamma^t r_t(s_t, a_t)\right]$ where $r_t$ is the blended ad + organic utility defined in Section 4.1, and $a_t$ ranges over actions that affect both the ad and organic streams (slate composition, ad load, ranking policy). This single equation closes the AE's "clear definitions of the problems" ask in formal terms.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O4.** Define **partial observability** and **logging policy** in one sentence each in the opener so later subsections can use these terms without re-defining. *"In practice, the platform does not observe $s_t$ directly; instead it conditions on a representation $\hat{s}_t$ constructed from logged features (Section~\ref{state_space_representation})."* And: *"The data used to train and evaluate policies are generated under a fixed historical logging policy $\pi_b$, which differs from the target policy $\pi$ being evaluated."* These two sentences close R1 Major 4 (terminology defined when introduced) for the two terms that appear most often in later subsections without local definition.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O5.** Close the opener with explicit forward references to Sections 4.1-4.5. This directly addresses Reviewer 2's structural concern. Single paragraph format: *"Sections 4.1 through 4.5 unpack each component of this MDP in turn: 4.1 examines how the reward $r_t$ is designed in production systems, 4.2 the structure of $\mathcal{A}$ under high-dimensional ad selection, 4.3 the construction of $\mathcal{S}$ from observable signals, 4.4 the learning and evaluation of $\pi$, and 4.5 the exploration–exploitation balance that any deployed $\pi$ must resolve."* Locks the reader into the unified taxonomy stated in the opener.

### Calibration items (handle inherited content)

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O6.** Remove the commented-out FrozenLake/GridWorld block at lines 293-321, including the commented figure (lines 298-304) and commented table (lines 307-321). The block is `[F]` reviewer-flagged content (R1 Major 2) that has been silenced from the rendered output via comment characters but remains in source. Per `/revise-rl-ad-paper` Section "Editing Workflow" step 6 (check broken references after removing): verify no live reference to `tab:frozen_lake` or `frozenlake-table.png` survives anywhere in `paper.tex`. *Status note: this is `[T]` for cleanup grounds (commented content does not render and is tolerated by reviewers in its commented state), but the source-hygiene benefit is high and the work is mechanical.*
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O7.** Add a single ad-policy worked example to the opener that addresses Reviewer 1's *"focused, domain-relevant illustrations (e.g., simplified bandit-based ad selection examples)"* directly. R1 did not just want FrozenLake removed; R1 wanted a domain-relevant replacement. Recommended example: a single-step ad-slate decision in a news-feed setting, where the action is choosing the ad creative and position, the state is the user's session context and slate-so-far, the reward is the displacement-cost-adjusted CTR or RPM, and the policy maps state to action with a learned blend of revenue and engagement utilities. Keep to one paragraph and one equation; no figure. This closes R1 Major 2 fully (FrozenLake replaced, not just removed) rather than partially.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O8.** After O1-O5 land, propagate the unification. Modify Section 4.3 line 717 (currently the closest thing to an MDP tuple in the rendered paper) to remove the redundant tuple restatement; replace with *"the state $s_t \in \mathcal{S}$ is one component of the MDP defined in Section~\ref{rl_formulation_opener} ..."*. Similarly, Section 4.2 line 651 can drop its standalone definition of $\mathcal{A}$ and instead cite the opener. Section 4.4 line 790 can drop its policy definition. This is the inverse of the R2 complaint: instead of each subsection re-introducing notation, each subsection refers back to the opener. *Caveat: each propagation should be a single-paragraph edit per subsection and must not orphan the citations currently anchored at those points (`Sutton1998`, `puterman2014markov` should remain at the opener; `zhao2021dear`, `ie2019slateq`, `xia2023transact` should remain in the subsections where they substantiate ad-policy claims).*

### Citation and bibliography items

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O9.** Bibliography hygiene check: the bibliography contains both `dulac2019challenges` and `dulac2021challenges` (flagged in `introduction_audit.md` I10/I11 as possible duplication). The opener should cite at most one of these for the partial-observability and policy-shift framing. Verify which is the correct primary source (the 2019 conference version vs.\ the 2021 journal version of "Challenges of Real-World Reinforcement Learning") and use only the chosen one in O4. The other can be deduplicated paper-wide as a follow-up.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **O10.** Internal-style: avoid citing `Sutton1998` more than once in the opener subsection. The textbook is correctly cited at line 105 (intro), at multiple points in Sections 4.2-4.5, and is at risk of being over-used. Pair its appearance in the opener with `puterman2014markov` for definitional duty (consistent with current Section 4.3 line 717 usage) and reserve `Sutton1998` for the cumulative-discounted-return statement.

## Proposed Notation Table (draft for O2)

The following Markdown sketch is for review only. The actual LaTeX implementation should use `\begin{table}[ht]` with `\caption{Notation for the joint ad and organic ranking MDP}` and `\label{tab:notation}`, and should be positioned in-line at first reference.

| Symbol | Type | Meaning in the joint ad + organic ranking MDP |
|---|---|---|
| $\mathcal{S}$ | set | State space; aggregates user-level signals, session-level context, and platform-level features (slate-so-far, ad load, inventory). |
| $s_t \in \mathcal{S}$ | observation | State at decision step $t$. Practically observed through a learned representation $\hat{s}_t$; the underlying MDP is partially observable. |
| $\mathcal{A}$ | set | Action space; encompasses ad selection, slate composition, ad placement, ad load, and ranking control levers. Detailed in Section~\ref{action_space_representation}. |
| $a_t \in \mathcal{A}$ | decision | Action taken at step $t$. May affect both the ad stream and the organic stream when ads and organic items share slate positions. |
| $P(s' \mid s, a)$ | conditional distribution | Transition kernel; how the user's state evolves after action $a$ is shown. |
| $R(s, a)$, equivalently $r_t$ | scalar | Reward at step $t$. In joint ad + organic ranking, $r_t$ is typically a utility combining revenue, engagement, and ad-fatigue penalties (Section~\ref{reward_design}). |
| $\pi(a \mid s)$ | conditional distribution | Policy; probability of choosing action $a$ in state $s$. Detailed in Section~\ref{policy_learning}. |
| $\pi_b$ | policy | Logging (behavior) policy under which historical training data were generated. Differs from the target policy $\pi$; counterfactual estimators correct for this gap. |
| $\gamma \in [0, 1)$ | scalar | Discount factor; encodes how strongly future rewards (long-term engagement, retention) weigh against immediate rewards (clicks, revenue). |
| $V^\pi(s)$ | scalar | Value of state $s$ under policy $\pi$; expected discounted cumulative reward from $s$. |
| $Q^\pi(s, a)$ | scalar | Value of action $a$ in state $s$ under policy $\pi$; expected discounted return for the $(s, a)$ pair. |

This table doubles as the notation glossary R1 implicitly requested via Major 4 (terms defined when introduced).

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

| Element | Original-submission status | New-opener status |
|---|---|---|
| FrozenLake/GridWorld pedagogy block | `[F]` present in submission, R1 Major 2 explicitly flagged | `[T]` already commented out; remove via O6 |
| Inline MDP definition $(S, A, P, R)$ at original page 17 | `[F]` present in submission, R2 explicitly flagged as "spread out" | `[F]` to be promoted into a dedicated opener via O1 |
| Notation table | not present in submission | `[N]` to be added via O2; reviewer-aligned because R2 explicitly asked for it |
| Forward references to 4.1-4.5 | not present in submission | `[N]` to be added via O5; reviewer-aligned because R2 explicitly asked for unified structure |
| Joint ad + organic objective in formal MDP terms | partial (informal in intro and methodology) | `[N]` to be added via O3; reviewer-aligned because AE explicitly asked for clear problem definition |
| Ad-policy worked example | not present (FrozenLake stood in for it) | `[N]` to be added via O7; reviewer-aligned because R1 Major 2 explicitly asked for "domain-relevant illustrations (e.g., simplified bandit-based ad selection examples)" |

All Tier 1 items in this audit (O1-O5, O7) are either reviewer-flagged removal of submitted content or new content motivated by a specific reviewer quote. No item in this audit is purely internal-style (Tier 3) at P0 or P1.

## Recommended Order of Execution

1. **O6** first (cheapest, mechanical): delete the commented-out FrozenLake source block. This clears the work area between lines 291 and 323.
2. **O1 + O2 + O3 + O4 + O5** together as a single landed subsection: the new opener is best written and reviewed as a coherent unit, not as five sequential micro-edits. The proposed structure is one paragraph for objective + section roadmap (O5), one paragraph for the MDP tuple definition (O1), the notation table (O2), one paragraph for the formal objective with the discounted-return equation (O3), one short paragraph closing with partial observability and logging-policy distinction (O4).
3. **O7** after O1-O5 land: insert the ad-policy worked example as the final paragraph of the new subsection. This addresses R1 Major 2 without bloating the opener.
4. **O8** as a follow-on cleanup pass: edit Sections 4.2, 4.3, 4.4 to forward-reference the new opener instead of re-introducing notation locally. This is a separate commit because it touches multiple subsections.
5. **O9 + O10** as final citation hygiene: pick one of `dulac2019challenges` / `dulac2021challenges`, audit `Sutton1998` density paper-wide if the new opener pushes it over the redundancy threshold.

After all items land, the opener should be roughly 25-35 lines of LaTeX (one section header, one introductory paragraph, one MDP-tuple paragraph, one notation table, one objective paragraph with equation, one partial-observability paragraph, one worked-example paragraph) and the rendered subsection should be approximately one printed page.

## Resolved Revision Items

None yet. This audit is the initial inventory.

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
