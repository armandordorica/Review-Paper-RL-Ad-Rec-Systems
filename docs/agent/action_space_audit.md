# Action Space Representation: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\subsection{Action Space Representation}` (currently lines 607-661).

Latest refresh: May 25, 2026. Re-run after the action-space subsection was conservatively tightened for focus and junior-practitioner readability, then partially source-checked for A5. The current subsection replaces much of the original submission's FrozenLake-driven action-space exposition with an authorial taxonomy of expressiveness, orthogonality, interpretability, and outcome predictability, plus a comparison table across DEAR, SlateQ, LinkedIn, and Alibaba. The opener now frames action-space design as determining which ad-policy levers an RL policy is allowed to control. The formal-definition paragraph retains a compact RL definition, immediately translates the action space into ad insertion choices, and preserves the combinatorial-action-space motivation. The large-action-space paragraph now keeps only the material bridge: industrial systems reduce the feasible slate before policy learning, improving tractability, historical-data coverage for estimating action outcomes, and serving latency while limiting the learned policy to the reduced action family. The concrete lever list is restored to the conservative ordering and wording for ad load, ad quality, ad placement, and ad relevance. A5 is now partially verified: DEAR and SlateQ are source-confirmed, while LinkedIn and Zhang remain partially verified pending exact full-text notation checks. The manuscript compiled successfully as `paper_2026-05-25_1627.pdf`.

## Reviewer Context Used

Anchored to direct quotes from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`. The submitted action-space section appeared at original PDF pages 17-19. Three-state calibration: the basic action-space definition, FrozenLake comparison, large combinatorial action-space claim, action abstraction examples, interpretability discussion, consistency discussion, and action-lever list were **present in submission**. Reviewer 1 explicitly flagged shallow treatment of action abstraction and large action spaces; Reviewer 2 generally flagged insufficient ad-policy emphasis and loose citation support. The current taxonomy, comparison table, and system-specific trade-off framing are **new content** added after submission and therefore carry full author responsibility.

- **Associate Editor:** `"the focus of the work is not always entirely clear. Various discussions in the paper do not seem specific to ad policies and the joint optimization of ads and recommendations."` -> A1, A2, A3, A5.
- **Associate Editor:** `"a critical discussion and comparison of approaches seems missing"` -> A2, A6.
- **Reviewer 1 Major Comment 1:** `"references to real-world practices--such as action abstraction in practical systems or the deployment strategies used by YouTube and Meta--are intriguing, but remain under-explored"` -> A1, A2, A6.
- **Reviewer 1 Soundness:** `"many important methods are barely described, if at all (e.g. policy gradient methods such as REINFORCE, or methods to deal with extremely large action spaces). In many cases, approaches are listed with explanation or any comparisons being drawn."` -> A1, A2, A4, A6.
- **Reviewer 1 Suggestions:** `"Provide a clearer framework for comparing approaches--e.g., by organizing around challenges like exploration, long-term optimization, evaluation, or system constraints."` -> A2, A6.
- **Reviewer 2:** `"The majority of the paper looks like a general study on Reinforcement Learning and Recommender systems. Emphasis on Ad-policies is insufficient, since this is the main focus of the paper."` -> A1, A3, A5.
- **Reviewer 2:** `"Several statements about adaptability of RL and its traits on recommenders and ad-related systems, are not sufficiently backed by literature. Some of the cited work on these claims are on general RL research, not specific to ad-policies/recommenders."` -> A3, A4, A5, A7.
- **Reviewer 2:** `"Position tables in the texts where they are mentioned or referred to will make it easier for the readers."` -> A8.
- **`revision_rules.md`:** Section 7.1 citation audit, Section 8 literature-review discipline, Section 15 table handling, Section 17.2 metric and trade-off discussion.

## Current Overall Assessment

The current action-space subsection is substantially stronger than the original submission. It now opens with a purpose-first statement, states that the four-property taxonomy is the authors' synthesis, uses ad-policy concepts rather than FrozenLake, and gives a compact comparison table across four representative systems. The property paragraphs define the evaluative framework briefly, while Table~\ref{tab:action-space-comparison} gives concrete action-space definitions and a property-based critique rather than forcing a one-to-one mapping between every system and every property. The large-action-space paragraph now directly explains why systems reduce the feasible action set before policy learning without burying the reader in method labels. The final lever list is descriptive rather than prescriptive and avoids unsupported rankings or invented levers.

The remaining risk is mostly verification rather than structural absence. DEAR and SlateQ table cells are now source-verified against accessible source text. The LinkedIn row is supported at the level of feed-ad allocation, constrained optimization, post-ranking allocation, and deployment, but its exact threshold notation still needs full-paper verification. The Zhang row is supported at the metadata and topic level, but the exact binary slot-vector notation still needs verification from the original 2018 paper or should be softened further. The reduced-action-family paragraph is now conceptually useful and readable, but `zhao2024survey` should still be checked as support for ad/content retrieval and candidate restriction. The final lever list still contains broad or older citations that should be verified, especially the umbrella use of `koutsopoulos2016native`, `nielsen2017advertising`, and the ad-relevance example supported by `Zhou2018`.

Estimated reviewer-aligned score: **8.4 / 10**. The reviewer-facing structure is now good, the FrozenLake drift has been removed, and the large-action-space treatment is readable and clearly tied to policy-learning feasibility. The score is held below 8.5 because the comparison table has several unverified system cells and the final lever list still contains broad or older citations that may not directly support modern ad-policy claims.

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

### Reviewer-Flagged Depth And Comparison

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **A2.** Strengthen the comparison-table walk-through. Resolved by adding a compact synthesis paragraph after Table~\ref{tab:action-space-comparison}: richer actions give the policy more control over ad insertion, but increase the number of state-action outcomes that must be estimated from logged data; lower-dimensional placement or allocation controls are easier to evaluate but restrict what the learned policy can change.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **A3.** Tighten the opening formal definition without turning it into generic RL pedagogy. Resolved by retaining one compact definition of $\mathcal{A}$ and immediately translating it into ad insertion choices: whether to show an ad, which ad to select, and where it appears relative to organic content.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **A4.** Verify the "technically discrete" claim at line 613. Current wording keeps the original combinatorial discrete-action framing because it is clearer than later abstractions and fits the slate/placement examples; continuous or parameterized controls remain represented in the table rather than generalized in this definition paragraph.

### Citation And Source Verification

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#0d6efd;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">IN PROGRESS (May 25)</span> **A5.** Verify every system-specific cell in Table~\ref{tab:action-space-comparison}. Partial source check completed:
  - `zhao2021dear`: verified. The accessible AAAI/arXiv text states $a_t=(a_t^{ad},a_t^{loc})\in\mathcal{A}$, describes the three sub-actions (whether to insert an ad, which ad, and where), states the at-most-one-ad assumption, and treats not inserting an ad as special `location 0`.
  - `ie2019slateq`: verified. The IJCAI text states the combinatorial slate action space over item set $I$, gives the fixed-size slate optimization $A\subseteq I$, $|A|=k$, and decomposes slate value into item-wise values under user-choice assumptions.
  - `yan2020ads`: partially verified. The public KDD page supports the feed-ad allocation problem, the post-operation framing after separate organic and ad rankings, constrained optimization, offline simulation, online A/B tests, and production deployment. The exact threshold notation with $x_i$, $r_i^a$, $u_i^a$, $u_i^o$, and $\alpha$ still needs source-level verification from the paper text.
  - `zhang2018whole`: partially verified but still risky. Metadata and later ad-allocation literature support that Zhang et al.\ 2018 is a whole-page/dynamic ad-allocation paper. The exact binary vector notation $a=(x_1,\ldots,x_K)$ with $x_k=1$ for displaying an ad in slot $k$ is directly visible in later page-level ad-allocation literature, but the exact Zhang 2018 source text was not accessible in this pass. Keep this row pending source-level verification or soften it further if the original text cannot be obtained.
  The table caption was softened from "reports each paper's action notation" to "reports each paper's action definition or corresponding operational decision" so authorial operationalization is not overstated as source notation.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **A6.** Verify or soften the Horizon action-space claim. Resolved by removing the Horizon-specific interpretability sentence from the property prose during the table-led restructuring.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#ffc107;color:black;padding:2px 8px;border-radius:4px;font-weight:bold">PENDING REVIEW</span> **A7.** Re-audit the concrete lever list. The list has been restored to the conservative prior structure: ad load, ad quality, ad placement, and ad relevance. Remaining review should verify the umbrella support from `koutsopoulos2016native`, the item-level support for `nielsen2017advertising`, and whether `Zhou2018` directly supports the ad-relevance example.

### Tables, Placement, And Consistency

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#ffc107;color:black;padding:2px 8px;border-radius:4px;font-weight:bold">PENDING REVIEW</span> **A8.** Compile and inspect placement of Table~\ref{tab:action-space-comparison}. The manuscript compiled successfully as `paper_2026-05-25_1627.pdf`; visual inspection of the rendered `table*` placement remains open because the source places the table immediately after first reference but the float may move in the PDF.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **A9.** Consider whether the action-space table should use the same row naming and caption style as the state-space and policy-learning comparison tables. This is internal-style consistency unless a future tables/figures audit finds a rendering issue.

## Citation Adequacy Scores

| Citation | Current use in action-space subsection | Adequacy | Assessment |
|---|---|---:|---|
| `Sutton1998` | Formal action/action-space definition. | 9 | Canonical source. Acceptable for definition only; do not use it for ad-specific action-space claims. |
| `ie2019slateq` | Ad recommendation action combinations; SlateQ full-slate/per-item decomposition; table column. | 9 | Strong for slate-based recommender action spaces and decomposition. Not ads-specific, but directly relevant to slate action complexity. |
| `zhao2020jointly` | Revenue/engagement objective for action selection; ad-load fatigue row. | 9 | Direct joint ad + recommendation source. Strong fit. |
| `covington2016deep` | Candidate-generation and ranking stages as industrial action-space reduction. | 8 | Strong industrial recommender source for retrieval/ranking reduction, but not ad-policy-specific. Good fit when paired with ad/content retrieval or ad-allocation sources. |
| `cheng2016wide` | Candidate-generation/ranking infrastructure and learned representation for large-scale recommendation. | 7 | Industrial recommender source. Useful for large-scale ranking context, but less direct than YouTube or ad-specific retrieval sources for action-space reduction. |
| `zhao2024survey` | Candidate restriction in ad/content recommendation systems. | 7 | Topically direct for ad/content retrieval, but arXiv survey status makes it a secondary anchor rather than the strongest standalone source. |
| `ie2019recsim` | High-dimensional discrete decision problem framing. | 7 | Good simulator/RL recommender anchor, but broad for the exact combinatorial action-space claim. Pair with SlateQ or deployment-specific sources. |
| `dulac2021challenges` | High-dimensional action spaces; expressiveness trade-off; interpretability limits; non-stationarity. | 8 | Strong broad real-world RL source. Useful for general deployment constraints, but not ad-policy-specific. |
| `zhao2021dear` | DEAR discrete placement action; slot-level controllers; table column. | 9 | Direct ad-policy source. A5 source check verified the action notation, location-0 no-ad option, and at-most-one-ad assumption. |
| `yan2020ads` | LinkedIn shadow-bid multiplier; interpretability; ad placement. | 8 | Direct feed-ad allocation source. Public KDD text verifies the constrained feed-ad allocation setting and post-ranking deployment; exact threshold notation still needs full-text verification. |
| `koutsopoulos2016native` | Orthogonality warning and lever-list umbrella citation. | 6 | Potentially relevant to native-ad systems, but broad for the full list of action levers and modular-policy-learning implications. Needs verification or narrower wording. |
| `zhang2018whole` | Alibaba coupled whole-page optimization; table column. | 7 | Direct whole-page ad allocation source by title and metadata, but exact binary slot-vector notation remains unverified against the original source text. |
| `puterman2014markov` | Outcome predictability / predictable outcomes over repeated state-action pairs. | 9 | Strong MDP source. Definitional use is appropriate. |
| `mcmahan2013ad` | Stable expected engagement/monetization outcomes. | 7 | Strong ad-click prediction source, but indirect for state-action outcome predictability. Reframe or pair with a policy-evaluation source if the claim remains. |
| `zhao2018deep` | Long-term value estimates in ad/bidding setting. | 8 | Relevant ad/RL source, likely better than generic RL for value-estimation claims. Verify exact use. |
| `hohnhold2015focusing` | Non-stationary outcomes and drift risk. | 7 | Strong for long-term online experimentation, weaker for specific action-space coupling. Use carefully. |
| `swaminathan2015counterfactual` | Importance weighting for off-policy evaluation. | 9 | Strong foundational source for logged counterfactual evaluation. |
| `sagtani2024ad` | Off-policy bandit learning for ad-load balancing. | 9 | Direct ad-load/off-policy source. Strong fit. |
| `gauci2018horizon` | Frequent retraining / rolling-window production-RL workflow. | 6 | Broad platform source. Useful for production RL workflow, but not an ad-specific action-space anchor unless source text is verified. |
| `abrams2007personalized` | Ad load and fatigue risk. | 8 | Relevant ad-load/ad-fatigue source. Older but useful for the lever row. |
| `yan2009much` | Ad quality / landing-page or ad features. | 7 | Likely relevant to ad quality, but verify exact support for landing-page and design-format wording. |
| `nielsen2017advertising` | Ad quality and landing-page quality. | 5 | Broad or non-peer-reviewed depending on source type. Replace with an academic ad-quality or landing-page source if possible. |
| `saha2021advertiming` | Ad placement / timing. | 8 | Likely relevant to ad timing/placement. Verify exact platform and metric alignment. |
| `yuan2020unbiased` | Placement bias / relevance to surrounding content. | 7 | Useful if the claim is about position or unbiased learning. Verify direct support for "relevance to surrounding content." |
| `chakrabarti2008contextual` | Contextual advertising relevance. | 8 | Good fit for contextual ad relevance. Older but on-topic. |
| `Zhou2018` | Ad relevance via user-interest modeling. | 7 | Strong display-ad/recsys source, but indirect for adjacency-to-vacation-query example. |

## Resolved Revision Items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **A1.** Added and then conservatively tightened the large-action-space reduction paragraph after the formal definition. The current paragraph states that industrial systems restrict candidate ads or organic items before policy learning, which improves tractability, makes historical outcome estimation more plausible, and reduces serving latency, while limiting optimality to the reduced action family.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A10.** Original FrozenLake action-space comparison removed from the live subsection. The current text no longer uses "up, down, left, right" as the main action-space explanation.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A11.** Added a purpose-first subsection opener that frames action-space design as a monetization-aware ranking problem and states the author's four-property taxonomy.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A12.** Added Table~\ref{tab:action-space-comparison}, which compares four representative systems by concrete action-space definition, exposed control, and reduction or constraint.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A13.** Replaced the informal opener question with a direct purpose statement: "This subsection examines how action-space design shapes policy learning in monetization-aware recommendation systems."
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A14.** Recast the four property paragraphs as authorial synthesis and separated that synthesis from Table~\ref{tab:action-space-comparison}. The section now defines expressiveness, orthogonality, interpretability, and outcome predictability in prose, while the table defines the systems' concrete action spaces.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A15.** Renamed the fourth property from consistency to outcome predictability and restored the stronger paragraph explaining statistically predictable outcomes, non-stationarity, off-policy evaluation, off-policy bandit learning, and rolling retraining.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A16.** Removed the primary-trade-off row from Table~\ref{tab:action-space-comparison} because it mixed system-level summary with the table's four-property structure.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A17.** Tightened the prose around Table~\ref{tab:action-space-comparison} so the section introduces the table once, interprets it after the float, and transitions to concrete levers without another table reference.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A18.** Reworked Table~\ref{tab:action-space-comparison} from a property-by-system matrix into a concrete action-space definition table after the prior version proved too vague for interpreting DEAR and related systems.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A19.** Updated Table~\ref{tab:action-space-comparison} to use source-level notation for action sets where available, including DEAR's $a_t=(a_t^{ad},a_t^{loc})$, SlateQ's slate $A\in\mathcal{A}$, and LinkedIn's allocation variable $x_i$ with threshold rule.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A20.** Revised Table~\ref{tab:action-space-comparison} into the requested three-column structure: paper/system, formal action-space definition and meaning, and commentary judging the design against the four author-identified properties.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **A21.** Added inline symbol definitions to Table~\ref{tab:action-space-comparison} so equations such as $a_t=(a_t^{ad},a_t^{loc})$, $A\in\mathcal{A}$, $x_i$, and $a=(x_1,\ldots,x_K)$ are interpretable without searching the cited papers.

## Out Of Scope For This File

- Section 4.0 MDP opener and notation table: handled in `rl_formulation_opener_audit.md`.
- Section 4.1 Reward Design: handled in `reward_design_citation_audit.md`.
- Section 4.3 State Space: handled in `state_space_citation_audit.md`.
- Section 4.4 Policy Learning: handled in `policy_learning_citation_audit.md`; remaining R1 depth risk is now primarily policy-gradient coverage rather than action-space reduction.
- Section 4.5 Exploration/Exploitation: no dedicated audit file exists yet.
- Paper-wide table and figure numbering: belongs in a future `tables_figures_audit.md`.

## Working Rules

- Treat the four-property taxonomy as authorial synthesis unless a source is found that explicitly defines it.
- Preserve the current section's compactness. Add depth through one targeted paragraph and a stronger table walk-through, not a long tutorial on action spaces.
- Verify source support before adding quantitative or system-specific action-space claims.
- Keep generic RL definitions short and refer back to the Section 4 opener when possible.
- Apply `/write-rl-paper` Section 7 checks to every citation touched in this subsection.
