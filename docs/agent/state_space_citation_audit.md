# State Space Representation: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\subsection{State Space Representation}` (currently lines 662-744).

Latest refresh: May 25, 2026. Rebuilt from a citation-focused audit into a scored section-level reviewer-risk audit with an explicit score, prioritized pending items, citation adequacy scores, and resolved items. The current subsection is substantially stronger than a generic state-representation tutorial: it frames state design around joint ad and organic ranking, states that the five-property framework is authorial synthesis, compares representative systems in Table~\ref{tab:state-space-comparison}, includes reported-results prose, and ends with practitioner guidance. The main remaining risks are ad-policy specificity, table-cell source verification, qualitative reported-results language, broad citations for some state levers, and table placement/readability.

## Reviewer Context Used

Anchored to direct quotes from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`. Three-state calibration: the original submission already discussed state spaces as part of the RL formulation, but the current five-property analytical lens, representative-system table, reported-results paragraph, and practitioner guidance contain substantial **new content** added after submission. New content carries full author responsibility and should be source-verified before final submission.

- **Associate Editor:** `"the focus of the work is not always entirely clear. Various discussions in the paper do not seem specific to ad policies and the joint optimization of ads and recommendations."` -> S1, S2, S5.
- **Associate Editor:** `"a critical discussion and comparison of approaches seems missing"` -> S3, S7, S8.
- **Reviewer 1 Major Comment 1:** `"A more detailed comparison of methods, highlighting their trade-offs, assumptions, and real-world performance, would substantially enhance the utility of the survey."` -> S3, S6, S7.
- **Reviewer 1 Major Comment 3:** `"Quantitative results from existing studies could also be summarized to help readers understand real-world performance and trade-offs."` -> S6.
- **Reviewer 1 Theoretical Background:** `"at many points there is a complete lack of depth in explanation or evaluation"` -> S2, S6, S8.
- **Reviewer 2:** `"The majority of the paper looks like a general study on Reinforcement Learning and Recommender systems. Emphasis on Ad-policies is insufficient, since this is the main focus of the paper."` -> S1, S2, S5.
- **Reviewer 2:** `"Several statements about adaptability of RL and its traits on recommenders and ad-related systems, are not sufficiently backed by literature. Some of the cited work on these claims are on general RL research, not specific to ad-policies/recommenders."` -> S4, S5, S6.
- **Reviewer 2:** `"Position tables in the texts where they are mentioned or referred to will make it easier for the readers."` -> S9.
- **`revision_rules.md`:** Section 7.1 citation audit, Section 8 literature-review discipline, Section 15 table handling, Section 17.2 metric and trade-off discussion.

## Current Overall Assessment

The state-space subsection now has a clear design question: what information must the state encode so a policy can balance short-term monetization against long-term engagement across successive interactions? That question is reviewer-aligned because it keeps the discussion tied to ad-policy optimization rather than generic state representation. The section also has useful structure: a formal definition, five properties, a comparison table, reported results, operational levers, and practitioner guidance.

The remaining risks are not severe enough to require a full rewrite. They are source and focus risks. Some property paragraphs still read like general recommender/RL state-design prose with ad examples added. The table is useful, but the cells are author-coded and should say so. The reported-results paragraph is dense and mostly qualitative; "meaningful" in the PinnerFormer sentence should be softened or replaced with exact reported magnitudes. Several citations are broad for the claims attached to them, especially `covington2016deep` for engineered contextual features and `hohnhold2015focusing` for state drift.

Estimated reviewer-aligned score: **8.0 / 10**. The section is strong enough to avoid the original "generic RL/recsys tutorial" criticism in broad form, but it remains below action space because the table, reported-results paragraph, and some ad-policy relevance claims need a source-verification pass.

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

### Ad-Policy Specificity And Reviewer Depth

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S1.** Make the property paragraphs more explicitly ad-policy-specific. Markovianity and the opening paragraph are strong, but expressiveness, stability, and sample efficiency sometimes read like general recommender state design. Recommended fix: in each weaker property paragraph, add or revise one sentence to state how the property affects the monetization versus organic-engagement trade-off.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S2.** Rephrase "representations that lean entirely..." to avoid treating explanatory extremes as literal system claims. Safer wording: "In this taxonomy, representations that lean heavily..." This preserves the analytical contrast without overclaiming that real systems occupy pure endpoints.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S3.** Make the comparison-table takeaway explicit. The pre-table sentence says no system satisfies all five properties cleanly, but the main takeaway could be sharper: higher expressiveness generally increases serving complexity, reduces interpretability, or increases evaluation burden. Add only if it materially improves the reader's understanding.

### Citation And Source Verification

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S4.** Verify every system-specific cell in Table~\ref{tab:state-space-comparison}. The table is new after submission and carries high author responsibility. Confirm that DEAR, SlateQ, PinnerFormer, and TransAct sources support the state components, evaluation claims, and trade-off descriptions assigned to them. If exact cell support is authorial synthesis, say so in the table lead-in or caption.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S5.** Replace or pair broad citations where ad-policy claims depend on them. Highest-risk examples: `covington2016deep` for engineered contextual features including ad-load history and ad-policy interpretability; `hohnhold2015focusing` for state-representation drift. Preferred direction: use `zhao2021dear` for ad-policy contextual features and `dulac2021challenges` or `gama2014survey` for drift.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S6.** Keep `glanois2024survey` only if the interpretability sentence remains conceptual. It supports interpretable RL generally, while `gauci2018horizon` better supports production RL workflow. No urgent edit is needed, but remove `glanois2024survey` if citation density becomes a problem.

### Evidence, Results, And Evaluation

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S7.** Verify and sharpen the reported-results paragraph. Reviewer 1 explicitly asked for quantitative results where available. Current risk centers on "meaningful offline retrieval-quality gains and online engagement lift" for PinnerFormer. Either quote exact reported magnitudes if available or soften to "reported offline retrieval-quality gains and online engagement lift."

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S8.** Consider splitting the reported-results paragraph into two parts if readability remains poor: one paragraph for system outcomes and one for evaluation limitations/reproducibility. This would make the response to the evaluation critique more visible without changing the section's argument.

### Tables, Placement, And Consistency

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S9.** Compile and inspect placement of Table~\ref{tab:state-space-comparison}. The table is placed immediately after first reference in source, but as a `table*` float it may move in the rendered PDF. Visual inspection remains open.

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **S10.** Consider changing repeated "are appropriate" in the practitioner guidance to "are most defensible when" or "are better suited when." This makes the guidance conditional rather than prescriptive.

## Citation Adequacy Scores

| Citation | Current Use In State-Space Subsection | Adequacy | Assessment |
|---|---|---:|---|
| `Sutton1998` | Formal MDP/state definition. | 9 | Strong foundational source. Current use is appropriate for definition only. |
| `puterman2014markov` | Formal MDP definition and Markovianity definition. | 9 | Strong source for MDPs and the Markov property. |
| `zhao2021dear` | State components; DEAR table column; reported results; contextual signals; sample efficiency; guidance. | 9 | Directly ad-policy relevant. Strong fit. |
| `ie2019slateq` | Slate-so-far state; table; reported results; guidance. | 9 | Directly supports slate state and user-choice decomposition. Strong fit. |
| `xia2023transact` | Real-time sequence representation; table; reported results; sequence compression; offline/online representation pattern; guidance. | 9 | Strong fit for real-time state representations and production serving constraints. |
| `zhang2024scaling` | Online user representations for ads personalization; stability; representation decomposition; guidance. | 9 | Strong ad-personalization fit. Good support for online representation updates. |
| `liu2022monolith` | Real-time recommendation infrastructure; stability; representation decomposition. | 8 | Strong production-system source for freshness and serving-time representation, but not ad-specific. |
| `swaminathan2015counterfactual` | Logged-feedback variance; counterfactual value estimation; sample efficiency. | 8 | Good support for logged-feedback/counterfactual claims, but not ad-specific. |
| `levine2020offline` | Offline RL and sample-efficiency constraints. | 8 | Strong for offline RL limitations. Broad but appropriate. |
| `dulac2021challenges` | Real-world RL partial observability, drift, and sample-efficiency constraints. | 8 | Broad but appropriate for real-world RL constraints. Useful replacement for indirect drift support. |
| `gama2014survey` | Distribution shift/concept drift. | 8 | Strong concept-drift source, not ad-specific. Fine when paired with production/recsys examples. |
| `hohnhold2015focusing` | Long-term outcomes and production drift context. | 7 | Relevant to long-term production outcomes, but indirect for state-representation drift. |
| `Zhou2018` | DIN, user behavior attention, display advertising, reported results. | 8 | Strong for display-ad CTR state features. Less direct for RL state-space design. |
| `pancha2022pinnerformer` | Long-history user embeddings; table; reported results; guidance. | 8 | Strong for user-state representation, but not ad-policy-specific. |
| `kang2018sasrec` | Sequence compression via self-attention. | 7 | Good for sequence compression, but not ad-specific and not RL. |
| `naumov2019deep` | Model size / serving cost in expressiveness trade-off. | 7 | Acceptable for recommender architecture and embedding-system cost. Not ad-specific. |
| `gauci2018horizon` | Interpretability and operator-facing production RL concerns. | 8 | Good fit for production RL workflow and operator-facing levers. |
| `glanois2024survey` | Interpretable RL. | 8 | Good conceptual support for interpretability, but not ad-system-specific. |
| `ie2019recsim` | RecSim in SlateQ reported results. | 9 | Direct support. |
| `mcmahan2013ad` | Ad features and sparse ad-click prediction context. | 9 | Strong fit for sparse ad/user/context feature claims. |
| `cheng2016wide` | Ad features; feature crosses; user-ad interaction features. | 7 | Useful industrial feature-modeling source. Not ad-policy/RL-specific. |
| `covington2016deep` | Engineered contextual features in the levers list; embedding combination sentence. | 6 | Broad recommender-system source. Risky for ad-policy-specific contextual-feature claims. |
| `grbovic2018real` | Embedding projection / production personalization building blocks. | 7 | Good production-embedding source, not ad-policy-specific. |
| `zhang2018whole` | Final guidance on constrained reward/action formulations. | 8 | Strong ad-allocation and whole-page optimization fit. |
| `yan2020ads` | Final guidance on constrained ad allocation. | 9 | Strong fit for feed ad allocation and constrained optimization. |

## Resolved Revision Items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **S11.** The subsection now opens with an explicit state-space design question for policies that jointly rank ads and organic content. This directly addresses the reviewer concern that the manuscript drifted into generic RL/recsys exposition.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **S12.** The five properties are explicitly labeled as authorial synthesis rather than a consensus taxonomy inherited from a single source.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **S13.** The section now includes a comparison table across DEAR, SlateQ, PinnerFormer, and TransAct, giving readers a concrete cross-system comparison rather than a list of state-representation ideas.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **S14.** The reproducibility limitation is framed as the authors' review finding: "In our review of these papers..." This avoids implying the claim comes from a cited source.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **S15.** The prior mechanistic stability phrasing ("absorbs short-horizon noise") has been softened to "is intended to smooth short-horizon noise," reducing overclaiming.

## Out Of Scope For This File

- Section 4.1 reward design: handled in `reward_design_citation_audit.md`.
- Section 4.2 action-space design: handled in `action_space_audit.md`.
- Section 4.4 policy learning: handled in `policy_learning_citation_audit.md`.
- Section 5 evaluation framework: handled in `evaluation_audit.md`.
- Paper-wide float placement and table/figure numbering: belongs in a future `tables_figures_audit.md`.

## Working Rules

- Preserve the current section architecture unless source verification shows a claim is unsupported.
- Apply `/write-rl-paper` conservative replacement rule: prefer local edits over rewriting the section.
- Treat Table~\ref{tab:state-space-comparison} as useful but source-sensitive. Do not add new cells or stronger trade-off labels without source support or explicit authorial-synthesis framing.
- Keep state-space claims tied to ad-policy consequences: monetization, organic engagement, ad load, slate context, inventory freshness, and evaluation burden.
- Apply citation checks to every metric, reported result, system property, and deployment claim.
