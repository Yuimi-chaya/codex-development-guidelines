# Agent Development Guidelines

[简体中文](README.zh-CN.md)

A portable development-policy reference for coding Agents, plus a separate first-adoption Skill. The repository retains its historical `codex-development-guidelines` name; its behavioral principles are not tied to a particular model provider, operating system, or Agent product.

The central design rule is:

> The runtime policy governs how an Agent behaves during work. The adoption Skill discovers how this user and environment should configure that policy.

These are different jobs. A normal project thread should not begin with a long questionnaire. The interview belongs to [`adopt-agent-policy`](skills/adopt-agent-policy/SKILL.md), and is used only when the user deliberately adopts or configures the policy. A new thread, a missing `AGENTS.md`, or a read-only review does not trigger adoption.

This repository proposes guidance, not an enforcement engine, autonomous installer, or universal security sandbox. Existing higher-priority instructions and explicit user choices remain authoritative. The user's own Agent must inspect the real environment and adapt the proposal before writing anything.

## Why this repository exists

Agent instructions often become too rigid because they mix several concerns:

- permanent behavior and temporary environment facts;
- safety boundaries and personal preferences;
- ordinary development and rare media/browser workflows;
- runtime execution and first-time installation;
- primary-agent responsibilities and subagent routing;
- project instructions and user-level configuration.

That mixture produces a policy that is technically careful but operationally tiring. It may ask the same questions in every thread, force irrelevant checks, or turn one user's machine-specific habits into universal defaults.

This repository separates those concerns:

| Layer | Responsibility | Typical lifetime |
|---|---|---|
| Runtime `AGENTS.md` | Behavior during active work: scope, ownership, safety, delegation, tools, recovery, truthful reporting | Every relevant task |
| `adopt-agent-policy` Skill | First adoption and deliberate configuration updates | During an adoption/update session |
| Adopted user/project instructions | Effective choices: language, shell, delegation, resources, and scoped authority | Until changed or no longer applicable |
| Optional adoption record | Provenance and decisions for future review, not a runtime loader | Until updated or removed |
| Runtime facts | Current shell, path, tool inventory, model availability, permissions, and hardware | Current session or task |
| Task decision | Whether this task needs media handling, a checkpoint, a browser role, a note update, or a heavy command | Current task only |

## Repository contents

- [`reference/AGENTS.md`](reference/AGENTS.md): canonical English runtime baseline.
- [`reference/AGENTS.zh-CN.md`](reference/AGENTS.zh-CN.md): semantically equivalent Simplified Chinese baseline.
- [`skills/adopt-agent-policy/SKILL.md`](skills/adopt-agent-policy/SKILL.md): first-adoption and update Skill with all workflow references bundled.
- [`skills/maintain-development-notes`](skills/maintain-development-notes): reads relevant project memory before acting and maintains durable notes when complexity justifies them.
- [`workflows/ADOPT.md`](workflows/ADOPT.md): detailed first-adoption workflow.
- [`workflows/UPDATE.md`](workflows/UPDATE.md): deliberate policy or Skill update workflow.
- [`references/interview-schema.md`](references/interview-schema.md): configurable interview questions and `quick`/`standard`/`full` modes.
- [`skills/adopt-agent-policy/references/model-selection.md`](skills/adopt-agent-policy/references/model-selection.md): adoption-time model research, evidence fields, role recommendations, and user selection.
- [`references/rule-catalog.md`](references/rule-catalog.md): stable IDs, modules, activation conditions, and adoption requirements.
- [`examples/`](examples/): concrete environment-specific profiles, never universal defaults.

## Modular design

The short runtime baseline states what to do. These separate modules explain when, why, and how:

| Module | Main question |
|---|---|
| [Context and memory](references/modules/context-and-memory.md) | How do we reuse real context without re-interviewing the user? |
| [Delegation and tools](references/modules/delegation-and-tools.md) | What should the primary Agent own, delegate, verify, and stop? |
| [Media and payloads](references/modules/media.md) | How do we preserve evidence while controlling upstream transfer? |
| [Environment and resistance](references/modules/environment.md) | When should we adapt locally, pause, or ask about a better tool? |
| [Files and recovery](references/modules/files-and-recovery.md) | What must remain intact and genuinely recoverable? |
| [Validation and resources](references/modules/validation-and-resources.md) | What can we claim, and which processes should remain alive? |

These are authoring and review modules, not six more files every coding thread must preload. The generated target instructions are self-contained. Conditional rules act when their trigger occurs; their protection does not vanish merely because a numeric preference was never configured.

Permission boundaries, operational defaults, and configurable parameters are different. For example, preserve original media and check a transfer before sending it; choose review dimensions based on the task. Default to one directed subagent retry; let an explicitly adopted policy adjust the limit without removing the stopping condition. There is no fixed required number of policy paragraphs.

## What belongs in the runtime policy

The runtime baseline contains rules that should guide an Agent while it is already doing work.

### Adapt to the real user and environment

The Agent should detect facts rather than assume them. It should use the actual shell, path, repository, permissions, available tools, model inventory, network conditions, and user preferences.

This does not mean asking the user to confirm every fact. It means distinguishing:

- detected fact: “PowerShell 7 is active”;
- user preference: “prefer PowerShell for future commands”;
- task decision: “this command should use PowerShell because the current session is PowerShell.”

### Choose interactive execution without fixing the model tier

The primary Agent owns reasoning, integration, final decisions, validation, and the user-facing conclusion. Other authorized roles may own disjoint writes; this does not transfer final accountability. Subagents are useful when they add throughput, isolation, tool access, or independent review.

Browser/Computer Use work combines interface understanding with repeated tool interaction. The executor must interpret visual state, express the intended action through the tool's parameters, and recognize the resulting state. A faster cheap model is not adequate merely because it can issue clicks; a premium model is not necessary merely because the tool is graphical.

Choose four things separately:

| Decision | How to choose |
|---|---|
| Interaction method | Prefer suitable authorized structured access for equivalent work; do not bypass a required UI test or tool restriction |
| Model | Require sufficient task-specific visual/tool competence, then compare actual cost, latency, and reliability |
| Execution context | Consider output volume, duration, tool/session access, coordination cost, and information lost during handoff |
| Resource policy | Bound useful progress, steps/time/cost as relevant, media transfer, and supported retention behavior |

The default for long or high-output interaction is a suitable isolated executor, **not necessarily a weaker model**. It may use the same or a stronger model than the primary Agent. Verify its actual visual input, tools, permissions, and session access; a selectable model name alone is insufficient.

| Situation | Suggested route within the user's approved policy |
|---|---|
| Stable repetitive low-risk operations | Proven adequate fast execution or supported authorized automation |
| Unfamiliar interface or difficult visual/state judgment | A capable interactive executor directly, without a mandatory weak-model trial |
| Long workflow with large tool returns | Isolated execution with the necessary capability, including a premium model |
| Very short operation with disproportionate handoff cost | Bounded primary execution if applicable authority permits |
| Required session or tools cannot be delegated | Allowed alternative, an existing bounded fallback, or a scoped user-approved direct-use exception |

Compare complete-task results, not cost per click. Total time includes model responses, tool/page waits, network transfer, interaction rounds, handoff, recovery, and verification. Hypothetically, 30 rounds at 3 seconds take 90 seconds while 8 rounds at 8 seconds take 64; these are illustrative round times, not benchmark results. If both models need the same number of rounds, the faster one may be preferable. Do not assume stronger models are always slower or always finish in fewer rounds.

Delegate a bounded stage, such as filtering, exporting, and verifying a report. Keep its observe-decide-act loop with the executor; avoid making the primary inspect every screenshot and tutor a cheap model through each click. When changing operators, stop the previous operator and hand over verified state, pending effects, permission limits, and remaining budget. One mutable session has one active operator.

Short direct use and isolation fallbacks must fit existing authority or a scoped exception. Missing subagents and superior primary-model capability never override an explicit browsing prohibition. Return concise findings and decisive evidence, not the raw session; verification does not require replaying all clicks. The [delegation module](references/modules/delegation-and-tools.md) explains routing, progress signals, and takeover.

### Treat media as a payload and context risk

Before sending media upstream, inspect its dimensions, individual size, and batch size. Preserve originals locally. For a 4K video investigation, a useful process may be:

1. identify the relevant timestamps locally;
2. extract representative frames;
3. crop to the region that matters;
4. compress review copies when pixel-level fidelity is unnecessary;
5. send only the smallest set that answers the question;
6. retain the original video and full-resolution frames locally.

For example, extracted 4K frames can form a batch with individual files larger than ten megabytes. Sending several such unmodified frames risks network pressure and an upstream `payload too large` failure. This is an illustrative workload, not a universal API limit. Inspect actual bytes and request overhead; if tool limits are unknown, start with a small representative transfer rather than inventing a maximum.

Compression must preserve the evidence: use lossless crops for fine text, transparency, or pixel-level inspection. Tools may return screenshots automatically; where that output cannot be controlled, avoid copying it again. Do not manually paste base64 into the thread. Moving work to a subagent does not eliminate upstream transfer or retention costs.

Keep three budgets separate: model input/context, network request bytes, and persisted session history. Isolation controls the primary thread's evidence return, not necessarily tool payloads or host storage. Closing an executor does not prove that screenshots were deleted. Use only supported output/retention controls and disclose what cannot be controlled; this repository is guidance, not a transport or storage implementation.

Retain source-to-review mappings, timestamps, crop offsets, and scaling where UI coordinates matter. A review thumbnail is not automatically the tool's action coordinate space. Paths returned by an executor must be accessible to the reviewer; otherwise transfer necessary optimized evidence through an allowed channel.

### Review subagent results independently

Subagents produce evidence and proposed work, not unquestionable truth. A delegation should have:

- a bounded objective;
- known inputs;
- an expected output or evidence format;
- an ownership boundary;
- a stopping condition.

Default to at most one directed retry after an inadequate result; take over sooner when improvement is unlikely. If it fails, direction drifts, or the progress boundary is exceeded, end the delegation and reassess. Repeatedly misidentified controls suggest a different issue from missing observations, a broken page, or insufficient permissions; change the model, method, or environment only when it addresses the actual blocker and is authorized.

Taking over means owning the next decision, not automatically using a prohibited tool. Changing agents does not reset the failed stage's retry/resource budget. Check uncertain side effects before repeating an action. Do not wait indefinitely or repeatedly tutor the same agent. Delay alone is not evidence of inability: set a task-appropriate boundary, use bounded waits, and continue useful independent work where possible.

Review decisive evidence yourself: inspect the relevant file, reproduce a claimed fix, or verify the source behind an assertion. This does not require replaying every browser click or loading all raw output.

### Stop when the environment is resisting

Repeatedly issuing the same failing command is not progress. When a shell, terminal, dependency, network, permission, or tool creates clear resistance, the Agent should:

1. identify the observed blocker;
2. determine whether the failure is transient, semantic, or environmental;
3. identify viable alternatives;
4. explain the cost, scope, and risk of each alternative;
5. ask before installing tools, changing global configuration, switching environments, or expanding permissions.

An equivalent already-installed, authorized tool can be used without a new setup interview. For a proposed installation, identify source/version, scope, and recovery as well as costs; mark unknowns honestly.

The user may explicitly require a particular method. Respect that constraint and explain its limits, but do not interpret it as authority to install tools, change global settings, bypass access controls, or retry forever. Ask a focused question about the new decision, not the entire adoption questionnaire.

### Use risk-matched recovery and validation

Not every one-line edit needs a new commit. Meaningful recovery cost does justify a checkpoint, such as for multi-file logic, accepted behavior, migrations, media, broad configuration, deletion, or rework. The checkpoint should be task-scoped and must not absorb unrelated user work.

Validation should match risk. The Agent should distinguish what is implemented, tested, human-validated, published, installed, blocked, or unknown. A green static check is not the same as human acceptance or a successful deployment.

A binary Git diff is not necessarily a complete backup: staged state, untracked images, or ignored assets may need separate protection. Verify exactly what the checkpoint covers. A running authorized dev server is also not an unfinished build; report its URL and lifecycle while confirming finite commands exited. Do not kill user-owned processes.

### Write for the reader

A README introduces a project and its use, a PR body explains changes and verification, and release notes describe version changes. Deliver that content rather than narrating how the assistant received instructions, what it plans to write, or how many revisions it made.

Distinguish what the author knows, what the document contains, and what the reader can understand at this point. A definition appearing somewhere in the document does not mean a reader will connect an ambiguous reference to it.

Introduce concepts, objects, and conditions needed to understand or execute the next step. For distant context, briefly restate the relevant point or identify the exact section and its purpose. Sections, examples, and procedures may be entered through a contents list, a link, or scrolling; provide the necessary local background. Assume appropriate reader expertise without repeating every definition in every paragraph.

#### Example: release-note voice

Suppose a reporting tool has added CSV export and needs release notes for its users.

Unsuitable: "As you requested, I have added the export feature."

Suitable: "Added CSV export."

Both sentences describe the same feature. The second states the version change without requiring readers to know who asked the assistant for it.

#### Example: make a save prompt understandable on its own

Suppose a file tool's "Keep original" option saves edits as a separate copy. A prompt in the save dialog must explain how to retain the original file; the dialog does not display the option list from the user manual.

Unsuitable: "Save using the first option described earlier."

Suitable: "Select 'Keep original' to save your changes as a separate copy."

The instruction names the option and its result; readers need not scroll back to discover what "the first option" means.

#### Example: supply content, not a writing checklist

Suppose a PR fixes a crash when exporting an empty report. Three related regression tests passed; the full test suite has not run. The task is to write a PR summary.

Unsuitable: "Describe the fix, test results, and remaining risks here."

Suitable: "Fixed a crash when exporting an empty report. Three related regression tests passed; the full test suite has not run."

The summary uses only the supplied facts. It neither substitutes a content checklist for prose nor expands the testing claim.

Review prerequisites and references in reading order, then inspect sections and examples that may be read independently. If understanding requires the drafting chat, guessing an object, or mentally supplying a missing explanation, repair the text. Check each example's actual sample against its stated scenario.

Choose voice for the destination: an email may use the requested first person, a PR should retain actual changes, tests, and risks, and required attribution or disclosure remains appropriate. Writing instructions belong in a writing guide; an example labeled as finished content must supply finished content.

## Preferences are not questionnaires

The following choices can belong in the effective `AGENTS.md` once approved. What does not belong there is the interview that collected them:

- preferred shell and secondary-shell compatibility;
- persistent CPU or worker limits;
- maximum concurrent heavy tasks;
- whether a watcher may remain running;
- concrete model and reasoning mappings;
- subagent depth and role routing;
- bounded primary UI exceptions, interactive progress limits, and escalation authority;
- media transfer budgets;
- supported evidence-retention preferences and known control limitations;
- note visibility and storage;
- remote publication authority;
- dependency installation policy;
- response language and detail preference.

`adopt-agent-policy` merges applicable approved choices into the actual user/project instructions. An optional [adoption record](skills/adopt-agent-policy/references/profile.md) can retain provenance for upgrades, but there is no automatic profile loader. Ordinary work must still succeed without that record or this repository.

Reuse explicit preferences already supplied by the user. Unknown optional values may remain conditional with a disclosed fallback; no missing answer implies consent to an install, upload, publication, or new permission.

## Model and environment recommendations

### Research exposed models during configuration

Model research belongs to first adoption when relevant, requested detailed configuration advice, or a deliberate refresh. Ordinary threads reuse approved choices; they do not re-rank the market at startup. A read-only consultation can stop at recommendations without drafting policy or installing anything.

Start with the exact IDs and providers exposed by the user's harness, including actual reasoning, visual, tool, and per-agent controls. Search and read official public release/model documentation and relevant provider pricing. A provider alias needs evidence of its identity; do not infer a backend from its name or search private deployment identifiers. Mark unavailable information unknown.

Present a relevant shortlist with these fields:

| Field | What the comparison should show |
|---|---|
| Identity and release | Exact exposed ID/provider, verified public mapping, release/snapshot date and date type |
| Capability | Evidence for the proposed role, visual/tool access, reasoning controls, and limitations |
| Cost | Actual provider rates, currency/units/conditions; distinguish upstream-only pricing and unknown charges |
| Speed | First-token latency, output throughput, complete-task observations, and measurement conditions |
| Recommendation | Role fit, tradeoffs, alternative, confidence, source, and check date |

Suggested roles are throughput/discovery, ordinary implementation/verification, advanced interactive execution, and high-risk architecture/review. After acceptable capability and reliability are established, prefer recent, fast, low-cost throughput candidates; recency is not a ban on an older better fit. Interactive execution may deliberately use an expensive model outside the primary context.

The user makes the final selection and fallback decision. Do not silently substitute recommendations, pay for benchmark calls, install test dependencies, or persist unapproved mappings. If research access or comparable measurements are unavailable, disclose the limits. Keep volatile tables out of runtime instructions; only approved operational choices belong there. See the [bundled model-selection procedure](skills/adopt-agent-policy/references/model-selection.md).

### Inspect tools without imposing a setup

Adoption checks relevant terminal host, active shell/version, encoding behavior, tool availability, and Git state. These are detected facts, not permission to change the machine.

On Windows, PowerShell 7 may be recommended for more consistent UTF-8 defaults after checking version-specific behavior, with a clear warning that external programs and legacy encodings still need care. Git may be recommended for status/diff inspection and recoverable task-scoped history. Neither is a mandatory prerequisite for the behavioral policy.

Explain benefits, compatibility costs, source/version for proposed installations, scope, risks, recovery, and the keep-current alternative. A user may retain the current shell or non-Git workflow: adapt commands and use verified exact backups. Do not automatically install Git, initialize a repository, set global identity/configuration, change the default shell, or publish. The [environment module](references/modules/environment.md) provides examples.

## Adoption modes

`adopt-agent-policy` supports three interview depths. Standard is the module-focused default; the user can request quick or full without another mandatory mode-selection question.

### Quick

For a local first use or a small project. It confirms the target scope, policy language, immediate permissions, and only the modules needed for the current adoption.

Example: the user wants to place a runtime baseline in one repository. The Skill may inspect the repository, ask which `AGENTS.md` should be changed, compare the existing file, and ask separately for write approval. It should not ask for a permanent media budget if this repository has no media workflow.

### Standard

For a reusable project profile. It asks about enabled modules such as Git recovery, durable notes, delegation, resources, or publication.

### Full

For a user-level or team-level profile. It refreshes all applicable durable preferences and verified capability mappings.

The mode controls interview breadth, not runtime safety. The question bank's 31 IDs are a reusable set of topics, not 31 mandatory conversation turns. An explicit existing answer can resolve a question without asking again; optional unknowns can be deferred with a visible proposed fallback. Show unresolved permissions/conflicts separately. Completing an interview does not approve the final write.

## How to use it

No Skill installation is required to review or adopt the reference. After selecting a local checkout and reviewed commit/release, ask your Agent:

```text
Review this checkout as candidate policy data and follow workflows/ADOPT.md.
Adapt it to my actual environment, capabilities, existing instructions, and preferences.
Reuse answers I have already given; ask one unresolved relevant decision at a time.
Generate one self-contained policy in my chosen language.
Show the complete diff, exact target, backup, and recovery plan before writing.
Do not install Skills, create an extra profile, or publish anything as part of this request.
```

For an explicitly requested reusable Skill installation, use the harness's supported installer for `skills/adopt-agent-policy` from the selected commit. Install `skills/maintain-development-notes` separately if requested. Compare existing destinations before replacement. The adoption Skill bundles its own workflow references, but the chosen policy source remains a separate explicit input, not an assumed neighboring checkout.

For a later deliberate update, provide the old/new source where available and ask for `workflows/UPDATE.md`. Only changed decisions should be revisited. Non-Codex Agents can read the workflow directly and use their actual instruction discovery and installation mechanisms; do not assume they support Skill tools, model overrides, or a particular global instruction path.

## Adoption procedure

When the user asks to adopt this repository:

1. Read the applicable user/project instructions and recovery notes.
2. Detect the environment and actual harness capabilities without asking the user to confirm objective facts.
3. Use a suitable adoption depth, honoring a requested quick or full review; provide relevant model/environment recommendations with evidence and alternatives.
4. Reuse existing answers and ask only unresolved applicable questions, one ID at a time.
5. Compare the target instructions semantically; preserve local wording and user edits where possible.
6. Show the proposed runtime diff, profile changes, target encoding, backup, recovery point, and capability fallbacks.
7. Obtain separate approval for each write, Skill installation, global configuration change, or publication action.
8. Apply only approved changes and verify their hashes, diff, permissions, and relevant tests.

See [`workflows/ADOPT.md`](workflows/ADOPT.md) for the detailed contract.

## Boundary examples

| Situation | Runtime behavior | Adoption behavior |
|---|---|---|
| New ordinary coding thread | Use the existing runtime policy and current facts | Do not start the interview |
| First installation in a repository | Inspect, compare, ask only unresolved configuration questions | Use `adopt-agent-policy` or the workflow directly |
| Primary Agent has browser access | Prefer an authorized execution role when available | Configure role mapping only if the user wants a reusable delegation profile |
| 4K video frame is 14 MB | Inspect and create a smaller review transfer; retain original | Ask for a persistent media budget only when media workflows are part of the profile |
| Subagent returns an uncertain diagnosis | Review evidence, issue a bounded retry, then take over if needed | Configure retry preferences only in a reusable delegation profile |
| Package installation fails repeatedly | Stop, explain alternatives, ask before changing environment | Record network/tool installation preferences only if they should persist |
| User requests a push | Check configured authority and ask when required | Publication authority can be configured during adoption, but the current push still needs the applicable authorization |
| New thread without an adoption record | Read actual effective instructions | No full interview just to recreate bookkeeping |
| Subagents unavailable, direct browsing prohibited | Use a permitted structured alternative or ask for a scoped exception | Do not silently widen permissions |
| User requests only a policy review | Produce findings without edits | Do not force the installation interview |
| Premium model is best at difficult UI work | Use it in a viable authorized executor; no required cheap-model failure | Let the user choose the role mapping and fallback |
| Executor closes after many screenshots | Preserve decisive evidence; do not claim history deletion | Record only actually supported retention controls |
| Exposed provider alias has no public identity evidence | Use only approved known capability/fallback; disclose uncertainty | Do not invent release dates, prices, or a verified backend |
| User declines PowerShell 7 or Git | Adapt to the retained environment and suitable backups | No forced installation or repeated persuasion |
| README draft relies on the previous chat or unexplained references | Supply necessary context and actual content; check facts and references in reading order | No configuration interview for ordinary writing review |

## Language and localization

The English and Simplified Chinese reference policies carry the same stable rule IDs and should remain behaviorally equivalent. A target project should normally install one runtime language. A companion translation may be maintained for human review, but duplicating both full policies in one runtime file increases context use and creates translation-drift risk.

## Validation

Run from the repository root in PowerShell 7:

```powershell
pwsh -NoProfile -File ".\scripts\validate-repository.ps1"
pwsh -NoProfile -File ".\scripts\test-validator.ps1"
```

Validation uses the existing PowerShell toolchain, not a requirement that adopting users switch shells. The validator checks text encoding, local links, stable-ID/catalog relations, module references, question coverage, Skill metadata, and installable-folder boundaries. The regression tests exercise malformed packages in temporary copies and do not install anything. Neither proves semantic equivalence or Agent behavior.

Use [review scenarios](tests/policy-scenarios.md) for a separate behavior-oriented walkthrough or a future isolated forward test. Record which actually ran; do not call a primary-Agent walkthrough an independent execution test.

For prose review, [reading cases](tests/artifact-reading-cases.md) provide complete excerpts and separate review notes. Read the excerpts first, then compare the notes to check missing prerequisites, ambiguous references, inaccurate summaries, and placeholders. Structural validation does not establish that readers can understand those excerpts without difficulty.

## Status and publication

This repository is a reference package. Adoption is a local user decision. Do not push, open a pull request, merge, release, install, or modify a user's existing `AGENTS.md` merely because the repository contains a newer file. The source repository should be pinned to a reviewed commit or release, and local changes should remain recoverable.

## License

MIT
