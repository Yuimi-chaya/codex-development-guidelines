# Stable Rule Catalog

IDs identify behavior rather than exact wording or position. Keep active IDs in both reference languages; preserve deprecated IDs for upgrade comparison without including them in generated runtime policy. Renumbering paragraphs is allowed; changing an ID's meaning requires an explicit migration note.

| ID | Rule | Module | Status | Trigger | Behavior |
|---|---:|---|---|---|---|
| CORE-001 | 1 | context-and-memory | active | Every relevant task | Adapt to actual user context; reuse choices; do not replay adoption |
| START-001 | 2 | context-and-memory | active | Project start and changed context | Confirm shell, directory, scope, Git status/branch/HEAD |
| START-002 | 3 | context-and-memory | active | Before relevant project decisions | Read instructions and existing notes at the selected cadence |
| NOTES-001 | 4 | context-and-memory | active | Relevant memory or complex continuing work | Recover prior context; maintain notes only at meaningful checkpoints |
| WRITE-001 | 5 | delegation-and-tools | active | Work ownership and side effects | Authorized role writes; primary Agent retains final acceptance |
| SUB-007 | 6 | delegation-and-tools | active | Material delegation benefit | Protect context and avoid ceremonial delegation |
| SUB-003 | 7 | delegation-and-tools | active | Selecting model/reasoning controls | Verify capabilities and apply approved choices or permitted fallback |
| SUB-005 | 7 | delegation-and-tools | active | Mapping work roles | User-approved roles; model capability independent of primary/executor context |
| BROWSER-001 | 8 | delegation-and-tools | active | Interactive browser or Computer Use | Separate method/model/context/budget; optimize full task; preserve authority |
| SUB-001 | 9 | delegation-and-tools | active | Every delegation | Bounded task and evidence contract; no overlapping writes |
| SUB-002 | 9 | delegation-and-tools | active | Delegation depth/concurrency | Honor user limits with conservative defaults |
| SUB-006 | 10 | delegation-and-tools | active | Delegation result or progress review | Verify claims; one retry by default; reassess cause, authority, and remaining budget |
| MEDIA-001 | 11 | media | active | Media transfer upstream | Inspect/optimize evidence; separate input, payload, and retention costs |
| ENV-001 | 12 | environment | active | Environment-dependent work | Detect relevant facts; recommend without imposing tools or Git adoption |
| SHELL-001 | 13 | environment | active | Executing commands | Use active-shell syntax and evidence-based failure handling |
| SHELL-002 | 13 | environment | active | Handling command paths | Safe quoting and path handling |
| FRICTION-001 | 14 | environment | active | Clear environmental/tool resistance | Stop ineffective retries; propose alternatives; ask for new authority |
| NET-001 | 15 | environment | active | Downloads, installs, configuration | Scoped tools and network changes within actual authorization |
| FILE-001 | 16 | files-and-recovery | active | Editing files | Preserve encoding, structure, permissions, and unrelated content |
| FILE-002 | 17 | files-and-recovery | active | Risky or subjective changes | Exact target/scope and applicable authorization |
| GIT-001 | 18 | files-and-recovery | active | Meaningful recovery cost | Verify checkpoints before risky work and at stable milestones |
| GIT-002 | 19 | files-and-recovery | active | Creating checkpoints | Task-only commits or complete relevant external backups; no implicit publication |
| GIT-003 | 20 | files-and-recovery | active | Rollback, stash, publication | Exclude unrelated work; verify targets and authority |
| RES-001 | 21 | validation-and-resources | active | Heavy work | Supported worker limits and conservative heavy-task concurrency |
| RES-002 | 22 | validation-and-resources | active | Resource/process lifecycle | Announce, monitor, react to lag, preserve user processes |
| VERIFY-001 | 23 | validation-and-resources | active | Acceptance and completion | Risk-matched evidence; distinguish implementation/testing/human acceptance |
| COMM-001 | 24 | validation-and-resources | active | User-facing communication | Selected language/detail, concise evidence and state |
| ARTIFACT-001 | 25 | validation-and-resources | active | Deliverable authoring and review | Actual supported content in the intended voice, not drafting commentary or placeholders |
| ARTIFACT-002 | 26 | validation-and-resources | active | Explanation, reference, and example composition | Reading-order prerequisites, clear referents, local example context, accurate sample text |
| SUB-004 | - | delegation-and-tools | deprecated | Historical comparison only | Mandatory numeric delegation thresholds; never adopt automatically |

## Module and precedence rules

- `active` means maintained, not executed on every task. The trigger determines applicability.
- Module explanations are authoring/review material, not additional files every coding thread must load. The selected runtime instructions must be self-contained.
- User preferences can include scoped standing authority. Apply its exact limits; neither a suggested default, an optional profile, nor a tool's availability creates authority.
- Existing user and project instructions are authoritative input. Reference rules are merged semantically and never replace local content merely to match wording.
- Runtime facts are not preferences. A detected shell, model, browser, or memory size does not answer a user's choice about future behavior.
- Concrete model names, reasoning labels, browser tools, write routes, worker counts, and media budgets must come from the actual harness or an explicit user choice.

## Module rationale

- [Context and memory](modules/context-and-memory.md)
- [Delegation and tools](modules/delegation-and-tools.md)
- [Media and payloads](modules/media.md)
- [Environment and resistance](modules/environment.md)
- [Files and recovery](modules/files-and-recovery.md)
- [Validation and resources](modules/validation-and-resources.md)

## Migration from the portable baseline

Keep all previously active IDs. `SUB-003` still means verified model/reasoning selection, and `SUB-005` still means role mapping; browser routing has its own new `BROWSER-001`. `NOTES-001` remains active. `SUB-004` remains deprecated.

New IDs separate adaptation/no-repeat adoption (`CORE-001`), browser routing (`BROWSER-001`), resistance handling (`FRICTION-001`), and verification (`VERIFY-001`). Preflight/read cadence now permits approved event-based customization while preserving stricter existing user rules. The default one-retry limit is retained and independent result verification is explicit.

Compare behavior as well as IDs when updating. Stable IDs and translations never justify overwriting a customized user rule.

## Adaptive execution and artifact-boundary revision

`BROWSER-001` retains structured-tool preference and permission boundaries while separating interaction method, model, context, and resource policy. Long/high-output UI work favors isolation when viable; a stronger executor need not be the primary thread or follow a failed weak-model trial. Short direct work remains conditional on authority. Preserve any stricter locally adopted primary-browser prohibition when merging.

`SUB-003` and `SUB-005` retain capability verification and role mapping, with researched recommendations confined to adoption or requested configuration consultation. `SUB-006` retains the default one-directed-retry ceiling: takeover is responsibility for reassessment, not permission to use forbidden tools, and changing agents cannot reset budgets. `MEDIA-001` distinguishes model input, transfer, and retention; `ENV-001` makes recommendations non-imposing. The new `ARTIFACT-001` separates deliverable voice from conversation commentary without banning first person or required disclosure. No existing active ID is retired or repurposed.

## Reader-context revision

`ARTIFACT-001` retains its audience/voice boundary and explicitly requires substantive, factually supported content instead of writing instructions disguised as finished prose. `ARTIFACT-002` adds reading-order and local-context requirements: establish prerequisites, resolve references, and supply each example's necessary scenario. A reference located somewhere in a document does not automatically establish the reader's understanding at the point of use.

Keep both rules distinct from a ban on technical terminology, first person, or forward references. Existing reader-appropriate expertise, concise reminders, and precise navigation remain valid; the revision does not require every sentence to repeat all context. Compare these behaviors semantically during adoption, without replacing a user's compatible wording.
