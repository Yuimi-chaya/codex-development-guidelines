# Artifact Reading Cases

These are prose-review fixtures, not executable tests or a human reading study. Every product, option, and test result below is hypothetical. The facts supplied for a case are the only facts available for its review; they are not evidence about this repository.

## Review procedure

Read each case's brief and reader-visible excerpt before the separate review notes at the end. Identify the exact phrase causing a problem, what context the reader has at that point, and the smallest justified correction. Some excerpts need no correction. Do not borrow this repository's architecture or the drafting conversation to supply missing explanations.

For order-sensitive cases, assess each sentence using only the information available before it. For direct-entry cases, use only the stated entry context. A reviewer who has already seen these notes can perform a walkthrough but cannot claim a blind evaluation.

## Case A

Brief: a reporting tool added CSV export. The requested artifact is a release note.

Reader-visible excerpt:

> The finished release note should describe the feature without referring to the drafting conversation.

## Case B

Brief: a reader follows a link directly to a guide's example section. No module names, local scenario, or section reference accompanies the following sentence.

Reader-visible excerpt:

> The six modules separate runtime behavior from adoption configuration.

## Case C

Brief: the following is the complete introduction to a hypothetical policy package.

Reader-visible excerpt:

> A runtime policy governs coding work. An adoption Skill configures that policy for a user. Six explanation modules cover memory, delegation, media, environment, recovery, and validation.
>
> The six explanation modules perform the initial configuration.

## Case D

Brief: a user follows this file-saving procedure in order. The tool's two modes are defined exactly as stated in step 3.

Reader-visible excerpt:

> 1. Select R2.
> 2. Click Save.
> 3. R2 overwrites the original file; R1 saves a separate copy. Use R1 if the original must be retained.

## Case E

Brief: the reader opens the "Save a copy" section directly. The guide also contains a section titled "Recover an overwritten file," which documents restoration from backups.

Reader-visible excerpt:

> Select "Keep original" to save the edited file as a separate copy.
>
> If the original was already overwritten, see "Recover an overwritten file" for the backup restoration procedure.

## Case F

Brief: an author wants a first-person email confirming their availability for a Tuesday review. That availability is the only scheduling fact supplied.

Reader-visible excerpt:

> I can attend the review on Tuesday.

## Case G

Brief: a PR fixes a crash when exporting an empty report. Three related regression tests passed. The full suite was not run.

Reader-visible excerpt:

> Fixed the empty-report export crash. All tests passed.

## Case H

Brief: the reader enters a writing guide at the following example. The excerpt includes its complete scenario and sample.

Reader-visible excerpt:

> Suppose a reporting tool has added CSV export. Its release note can read:
>
> "Added CSV export."

## Review notes

| Case | Finding and supported correction |
|---|---|
| A | The excerpt tells an author what to write; it does not deliver a release note. A supported replacement is "Added CSV export." Removing conversational words from the instruction would not fix its purpose. |
| B | "The six modules" has no established local referent, and the claimed relationship has no supplied evidence. Do not assume it names this repository's modules. Establish an explicit scenario and accurate relationship, or use a different example with sufficient facts; the supplied brief does not support inventing module names. |
| C | The subjects are named, but the final claim assigns the Skill's configuration responsibility to the explanation modules. A supported replacement is "The adoption Skill performs the initial configuration." Naming the modules alone does not repair the factual mismatch. |
| D | The reader is told to select and execute an option before learning its effect and the condition for using it. Move both mode meanings and the keep-original decision before selection/save. A whole-document reviewer must not treat step 3 as knowledge available at step 1. |
| E | The current action has a named option and purpose. The separate recovery path has a precise heading, condition, and explanation of what it provides. No need to duplicate the entire recovery procedure or eliminate the forward reference. |
| F | First person is appropriate for the requested email, and the sentence uses only the supplied fact. Removing "I" would not improve compliance. |
| G | "All tests passed" exceeds the available evidence. Use "Three related regression tests passed; the full suite has not run." Factual scope still matters even when the wording has no assistant narration. |
| H | The hypothetical scenario is stated beside the actual sample, so no remote context or real-product evidence is required. No need to define CSV for an audience already familiar with the format. |

Record the reviewed source, evaluator, cases, concrete findings, and corrections in the task's development note. Automated package validation checks this file's presence and links, not whether a reader or Agent identifies these issues.
