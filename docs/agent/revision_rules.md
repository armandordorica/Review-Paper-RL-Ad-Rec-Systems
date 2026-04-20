# Document Revision Agent Instructions

Revise the document using the following priorities, in this exact order. Apply each requirement once, do not duplicate guidance, and prefer edits that improve clarity, rigor, and reproducibility without adding unnecessary length.

## 1. Preserve the document’s purpose and business tone
- Treat the document as a business document, not a literary or purely academic one.
- Write formally and professionally.
- Avoid conversational language, contractions, slang, and informal expressions.
- Avoid making the client, sponsor, or partner organization look bad.
- Do not identify the sponsor company by name; use generic labels such as **the Bank** or **the Company**, where applicable.
- Avoid grandstanding, overclaiming, or recommendations not fully supported by analysis.
- Avoid extreme words such as *crucial*, *imperative*, and *essential* unless fully justified.

## 2. State the objective immediately and precisely
- In Chapter 1, make the objective statement short and direct.
- Start the objective statement with: **“The objective of this thesis is …”**
- Add only a brief expansion after that opening if needed.

## 3. Lead the reader at every stage
- Organize material so the reader always knows what is coming next.
- Use clear structure: paragraphs, subsections, or chronological ordering, whichever best fits the material.
- Do not surprise the reader with section transitions or headings.
- Each chapter, except the first, should begin with a short introductory paragraph explaining what the chapter covers, how it is organized, and sometimes why that organization was chosen.
- Each chapter, except the first and possibly the last, should end with a summary section.
- Each section should transition naturally into the next.
- Tell the reader why each part of the analysis is being presented.

## 4. Write efficiently
- Prefer concise, high-value writing.
- If something can be said in fewer words, shorten it.
- Remove material that does not contribute to the document’s purpose or “so what.”
- Avoid single-sentence paragraphs except in rare cases where they are clearly justified.

## 5. Make the “so what” explicit
- Ensure the document explains why each major point matters.
- End the literature review with a clear summary that explains the specific takeaway and why it matters.

## 6. Separate prior work from your own contribution
- Make it unambiguous what comes from the literature or other sources and what comes from your own analysis.
- Use citations to distinguish external ideas, results, methods, and interpretations from your contribution.
- Referencing adds credibility and should be used liberally where appropriate.

## 7. Support claims with references
- Back up nearly every nontrivial claim with a citation.
- Avoid unsupported assertions.
- Prefer paraphrasing with citation over quotation.
- Use quotations only sparingly.

## 8. Use the literature review correctly
- Do not use the literature review to explain standard methods or common metrics in a textbook style.
- Instead, review literature that addressed the same or closely related problem.
- Use prior studies to justify methodological choices rather than explaining basic methods in detail.
- If a standard method must be mentioned, cite a textbook or source rather than explaining the method at length.

## 9. Enforce citation style consistently
- Use the following narrative citation forms:
  - One author: **Smith (2019)**
  - Two authors: **Smith and Jones (2019)**
  - More than two authors: **Smith et al. (2019)**
- If the citation appears at the end of the sentence, place it in parentheses before the period.
- Be consistent in punctuation and formatting of **et al.**

## 10. Ensure grammar and usage are clean
- Grammar must be correct throughout.
- Avoid emm dashes. Use commas, parentheses, or colons instead.
- Never start a sentence with a numeral.
- Spell out integers from zero to nine in text; use numerals for 10 and above unless sentence position requires rewording.
- Be careful with words like **this**, **it**, and **these**. Each must have a clear and specific referent.
- Maintain lexical consistency when referring back to something. If it was introduced as an **issue**, do not later refer to it as a **problem** unless there is a reason to change terms.

## 11. Make the document self-contained and reproducible
- Revise so that a colleague could reproduce the work from the document and the data alone.
- Do not overexplain simple standard methods; cite them instead.
- For each method actually used, provide the necessary reproducibility details: inputs, outputs, model structure if relevant, equations used, hyperparameters, tuning approach, software/library versions, and execution-relevant settings.
- Keep methodology content in the methodology section; keep findings in the results section.
- Where methodology and results are difficult to separate, explain the process in methodology and signal clearly that the resulting outputs will be presented later.

## 12. Clarify the data geometry early
- Add an early section describing the structure of the data.
- Define what the observations are, what the variables/features are, and how many records are used.
- Make it easy for a reader to understand the setup before discussing modeling.

## 13. Improve methodology presentation
- Include an overall process-flow diagram if useful.
- Reference that diagram in the methodology introduction.
- Reuse the process-flow components when describing later methodology subsections.
- Explain the purpose of each step before presenting it.

## 14. Handle equations and variables rigorously
- All variables mentioned in the text must appear in math mode.
- Define every variable the first time it is introduced.
- Where relevant, define domains or ranges.
- Do not use the same symbol for different concepts.
- Do not use multiple symbols for the same concept.
- Avoid redefining variables repeatedly; if needed later, explicitly remind the reader of the prior definition.
- Equations must read as part of the sentence and use proper punctuation.
- Use automatic equation numbering and automatic cross-referencing.

## 15. Handle figures, tables, and appendices properly
- Reference every figure and table in the text before it appears.
- Walk the reader through the figure or table; do not make the reader infer the takeaway alone.
- Put table titles before tables.
- Put figure captions after figures.
- Use automatic numbering and cross-referencing for figures and tables.
- If appendices exist, explicitly direct the reader to the relevant appendix sections from the main text.

## 16. Enforce document-wide consistency
- Be absolutely consistent in formatting, fonts, numbering, capitalization, references, figure/table conventions, paging, and notation.
- Refer to **Chapter** and **Section** with capitalization when used as formal references, such as “see Section 3.1.”
- Do not capitalize generic uses such as “in this chapter.”

## 17. Apply methodology standards from the ACM TORS checklist
Use the following as a reproducibility and evaluation audit for the experimental parts of the document.

### 17.1 Reproducibility checklist
- Report whether the full experimental pipeline code is publicly available, including:
  - proposed method code
  - baseline code
  - preprocessing and postprocessing code
  - hyperparameter tuning code
  - training and testing execution code
  - statistical analysis code
  - documentation and installation/execution instructions
- Report whether all relevant data artifacts are publicly available, including:
  - original datasets
  - preprocessed datasets
  - train/validation/test splits
  - results
  - trained models
- Report configuration details needed for reproduction, including:
  - hyperparameter search strategy
  - search space
  - search time
  - best hyperparameters per dataset/model
  - train-test split configuration
  - random seeds
  - required libraries and versions
  - hardware configuration
- Report experiment-level reproducibility details, including:
  - whether an existing evaluation framework was used
  - whether one-click reproducibility is supported
  - whether limited-hardware reproduction guidance is provided
  - whether expected runtime is reported

### 17.2 Methodology checklist
- Ensure the research question is clearly stated.
- Ensure the hypothesis follows from the research question.
- Ensure the experimental design matches the research question.
- Ensure the conclusions are supported by the research question and design.
- Check that baselines are appropriate, include both strong and simple baselines, are tuned fairly, and are clearly identified as rerun or sourced from prior work.
- Check that evaluation metrics are appropriate, nonredundant, and accompanied by discussion of tradeoffs.
- Check that the data collection process is clearly explained, including biases and public availability where applicable.
- Check that the chosen datasets are appropriate and that any generalization claim is supported by dataset diversity and dataset provenance.
- Check that preprocessing is minimal, justified, and clearly explained.
- Check that data splitting matches the task structure, respects time where relevant, applies equally to all methods, and uses cross-validation when possible.
- Check that hyperparameter optimization is clearly specified, sufficiently broad, and reported consistently across methods.
- Check that experiment execution is fair, statistically sound, and documented with significance testing, p-values, confidence intervals where possible, and hardware details.
- Check that sensitivity analysis is reported for relevant method parameters and dataset properties, with tradeoffs made explicit.

## 18. Final revision rule
- Revise for clarity, traceability, and reproducibility.
- The final document should read as a guided, evidence-based, professionally written analysis that stands on its own.