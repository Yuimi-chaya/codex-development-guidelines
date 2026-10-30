# Codex AGENTS.md Development Guidelines

[简体中文](README.zh-CN.md)

Development guidelines for Codex user-level `AGENTS.md`. Generate usable instructions from the actual environment, existing configuration, and user preferences, honoring an explicitly requested project scope. The behavioral principles can inform other Agents; the configuration workflow targets Codex.

The central design rule is:

> Inspect discoverable facts first, recommend with evidence, collect unresolved preferences together, and let the user decide. Adapt the rules to the user rather than requiring the maintainer's models, tools, or working habits.

When asked to install these guidelines, [`adopt-agent-policy`](skills/adopt-agent-policy/SKILL.md) first inspects the environment, relevant Codex settings, and exposed models, checks public sources, then presents recommendations and outstanding decisions together. Users need not pick rules, select interview modes, or answer numbered topics individually. Existing choices are reused and existing `AGENTS.md` content is merged semantically.

The default target is `AGENTS.md` in the actual Codex home: `CODEX_HOME`, otherwise `~/.codex`. Check whether `AGENTS.override.md` shadows the ordinary file and show the exact target, diff, and recovery plan before writing. Installing only the Skill package, reviewing the repository, or developing it does not authorize local configuration changes.

## Why this repository exists

Agent instructions are not a universal template to copy unchanged. They should reflect the actual environment and the user's preferences, cover common situations to reduce problems, and make everyday work fit the user's needs. This requires distinguishing:

- permanent behavior and temporary environment facts;
- safety boundaries and personal preferences;
- ordinary development and rare media/browser workflows;
- runtime execution and first-time installation;
- primary-agent responsibilities and subagent routing;
- project instructions and user-level configuration.

This repository separates those concerns:

| Layer | Responsibility | Typical lifetime |
|---|---|---|
| Runtime `AGENTS.md` | Behavior during active work: scope, ownership, safety, delegation, tools, recovery, truthful reporting | Every relevant task |
| `adopt-agent-policy` Skill | Inspect and research, recommend, collect choices, merge, and verify | During an installation/update session |
| Adopted user/project instructions | Effective choices: language, shell, delegation, resources, and scoped authority | Until changed or no longer applicable |
| Optional adoption record | Provenance and decisions for future review, not a runtime loader | Until updated or removed |
| Runtime facts | Current shell, path, tool inventory, model availability, permissions, and hardware | Current session or task |
| Task decision | Whether this task needs media handling, a checkpoint, a browser role, a note update, or a heavy command | Current task only |

## Repository contents

- [`reference/AGENTS.md`](reference/AGENTS.md): tagged English authoring source for review, maintenance, and version comparison.
- [`reference/AGENTS.zh-CN.md`](reference/AGENTS.zh-CN.md): semantically equivalent Simplified Chinese source.
- [`skills/adopt-agent-policy/assets/`](skills/adopt-agent-policy/assets/): bilingual installation starting points without maintenance IDs, to adapt and merge.
- [`skills/adopt-agent-policy/SKILL.md`](skills/adopt-agent-policy/SKILL.md): Codex instruction configuration Skill with bundled workflows and clean bilingual policy assets; usable without a separate checkout.
- [`skills/maintain-development-notes`](skills/maintain-development-notes): reads relevant project memory before acting and maintains durable notes when complexity justifies them.
- [`workflows/ADOPT.md`](workflows/ADOPT.md): detailed first-adoption workflow.
- [`workflows/UPDATE.md`](workflows/UPDATE.md): deliberate policy or Skill update workflow.
- [`references/interview-schema.md`](references/interview-schema.md): internal decision checklist, not a sequential interview script.
- [`skills/adopt-agent-policy/references/discovery.md`](skills/adopt-agent-policy/references/discovery.md): read-only discovery of configuration scope, overrides, models, environment, and relevant settings.
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

### Choose model tiers based on user requirements and task needs

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

Compare complete-task results, not cost per click. Total time includes model responses, tool/page waits, network transfer, interaction rounds, handoff, recovery, and verification. Suppose a fast model takes 30 rounds at 3 seconds each, totaling 90 seconds, while a stronger model takes 8 rounds at 8 seconds each, totaling 64 seconds. If both models need the same number of rounds, the faster one may be preferable. Do not assume stronger models are always slower or always finish in fewer rounds.

Delegate a bounded stage, such as filtering, exporting, and verifying a report. Keep its observe-decide-act loop with the executor; avoid making the primary inspect every screenshot and tutor a cheap model through each click. When changing operators, stop the previous operator and hand over verified state, pending effects, permission limits, and remaining budget. One mutable session has one active operator.

Short direct use and isolation fallbacks must fit existing authority or a scoped exception. Missing subagents and superior primary-model capability never override an explicit browsing prohibition. Return concise findings and decisive evidence, not the raw session; verification does not require replaying all clicks. The [delegation module](references/modules/delegation-and-tools.md) explains routing, progress signals, and takeover.

### Account for media's upstream network load and local storage demands

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

Review decisive evidence yourself: inspect the relevant file, reproduce a claimed fix, or verify the source behind an assertion. This does not require replaying every browser click or loading all raw output. If the task is simple and the primary Agent can readily complete it, do not create a subagent merely to satisfy a rule.

For substantial file exploration, use an available, authorized read-only agent to return paths, symbols, line references, and compressed findings. Coordinate division of work and both sides' pace: identify responsibilities and dependencies, advance independent work, and exchange relevant blockers and changes. Avoid duplicate exploration and repeated checks of unchanged status.

An authorized agent can monitor a long build/test, observing the existing process and reporting meaningful progress, failures, or exit status. Monitoring does not start another build or increase heavy-task concurrency. If the execution session is inaccessible, use a supported observation route or retain monitoring locally; do not claim a delegation that did not occur.

### Ask or notify the user

Long tasks need sustained progress and timely alignment. When missing information materially affects the approach or result and cannot be reasonably resolved from context, ask a concrete, short question with meaningful options where useful. Reuse explicit answers; ordinary work does not restart the configuration interview.

When the user must open a window, reproduce an issue, or provide immediate assistance, use an available, permitted interaction tool such as `request_user_input` under their preference. State the action and purpose. Do not assume the app is in the foreground or that a passing progress message was seen or acted on.

For example, an investigation needs the user to open an application's settings window. Request that assistance while continuing independent source inspection; wait for confirmation or observation of the window before the screenshot-dependent step. No reply does not mean the action is complete or authorize an unapproved GUI route.

Question tools serve concrete questions and assistance, not routine progress, apologies, or promises. After misuse is pointed out, correct it directly; do not open another dialog asking whether to stop accidental calls. Avoid empty calls or repeated reminders for an unchanged request.

Advance independent work while waiting and keep dependent steps pending. Tool mode, input, and approval restrictions still apply. If the tool is unavailable or optional enablement is declined, ask clearly through an allowed channel without claiming delivery or treating silence/timeouts as consent. Verify host notification behavior rather than assuming the user saw a notification.

### Stop when the environment is resisting

When a shell, terminal, dependency, network, permission, or tool creates clear resistance, the Agent should:

1. identify the observed blocker;
2. determine whether the failure is transient, semantic, or environmental;
3. identify viable alternatives;
4. explain the cost, scope, and risk of each alternative;
5. ask before installing tools, changing global configuration, switching environments, or expanding permissions.

An equivalent already-installed, authorized tool can be used without a new setup interview. For a proposed installation, identify source/version, scope, and recovery as well as costs; mark unknowns honestly.

The user may explicitly require a particular method. Respect that constraint and explain its limits, but do not interpret it as authority to install tools, change global settings, bypass access controls, or retry forever. Ask a focused question about the new decision, not the entire adoption questionnaire.

### Use risk-matched recovery and validation

Establish a task-scoped checkpoint before changes with meaningful recovery costs, such as multi-file logic, accepted behavior, migrations, media, broad configuration, deletion, or rework. It must not absorb unrelated user work.

The Agent should distinguish what is implemented, tested, human-validated, published, installed, blocked, or unknown. A green static check is not the same as human acceptance or a successful deployment.

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
- proactive-question/assistance enablement, supported channels, and interruption preferences.

`adopt-agent-policy` merges applicable approved choices into the actual user/project instructions. An optional [adoption record](skills/adopt-agent-policy/references/profile.md) retains provenance when requested; it is not created by default and has no automatic loader. Ordinary work must still succeed without that record or this repository.

Reuse explicit preferences already supplied by the user. Unknown optional values may remain conditional with a disclosed fallback; no missing answer implies consent to an install, upload, publication, or new permission.

## Model and environment recommendations

### Whether to enable proactive questions

During initial configuration or a deliberate communication update, detect interaction tools and mode restrictions, then include proactive questions, keep-current behavior, or deferral in the consolidated recommendation. Explain timely alignment versus interruption costs. Ordinary threads reuse the choice. Declining optional enablement does not permit guessing important answers.

For a Codex version supporting the feature, propose:

```toml
[features]
default_mode_request_user_input = true
```

If `[features]` already exists, add or update only the key without duplicating the table. Verify support, effective state, configuration scope, and reload requirements when configuring the actual installation. Show a minimal diff, backup, and recovery plan before an authorized write. Do not automatically edit `config.toml` or restart the app, or promise that a policy rule alone exposes a tool to an existing task.

The example and motivation come from the [maintainer's usage note](https://x.com/heyiwei233/status/2109408871941034316). The [official configuration schema](https://developers.openai.com/codex/config-schema.json), checked on October 12, 2026, contains this boolean key; that does not establish every version's support or notification delivery. See the [bundled interaction procedure](skills/adopt-agent-policy/references/user-interaction.md).

### Research exposed models during configuration

An installation request starts proactive inspection of the exposed model inventory and relevant public evidence before recommendations; retain existing valid mappings. Requested detailed configuration advice and deliberate refreshes can also include research. Ordinary threads reuse approved choices rather than re-ranking the market at startup. A read-only consultation can stop at recommendations without drafting policy or installing anything.

Start with the exact IDs and providers exposed by the user's harness, including actual reasoning, visual, tool, and per-agent controls. Search and read official public release/model documentation and relevant provider pricing. A provider alias needs evidence of its identity; do not infer a backend from its name or search private deployment identifiers. Mark unavailable information unknown.

Present a relevant shortlist with these fields:

| Field | What the comparison should show |
|---|---|
| Identity and release | Exact exposed ID/provider, verified public mapping, release/snapshot date and date type |
| Capability | Evidence for the proposed role, visual/tool access, reasoning controls, and limitations |
| Cost | Actual provider rates, currency/units/conditions; distinguish upstream-only pricing and unknown charges |
| Speed | First-token latency, output throughput, complete-task observations, and measurement conditions |
| Recommendation | Role fit, tradeoffs, alternative, confidence, source, and check date |

Suggested roles are throughput/discovery, ordinary implementation/verification, advanced interactive execution, and high-risk architecture/review. After acceptable capability and reliability are established, prefer recent, fast, low-cost throughput candidates; recency is not a ban on an older better fit. Interactive execution may deliberately use an expensive model; long workflows favor a viable authorized independent context, while short direct work retains its applicable permission boundary.

The user makes the final selection and fallback decision. Do not silently substitute recommendations, pay for benchmark calls, install test dependencies, or persist unapproved mappings. If research access or comparable measurements are unavailable, disclose the limits. Keep volatile tables out of runtime instructions; only approved operational choices belong there. See the [bundled model-selection procedure](skills/adopt-agent-policy/references/model-selection.md).

### Inspect tools while respecting user preferences

Adoption checks relevant terminal host, active shell/version, encoding behavior, tool availability, and Git state. These are detected facts, not permission to change the machine.

On Windows, PowerShell 7 may be recommended for more consistent UTF-8 defaults after checking version-specific behavior, with a clear warning that external programs and legacy encodings still need care. Git may be recommended for status/diff inspection and recoverable task-scoped history. Neither is a mandatory prerequisite for the behavioral policy.

Explain benefits, compatibility costs, source/version for proposed installations, scope, risks, recovery, and the keep-current alternative. A user may retain the current shell or non-Git workflow: adapt commands and use verified exact backups. Do not automatically install Git, initialize a repository, set global identity/configuration, change the default shell, or publish. The [environment module](references/modules/environment.md) provides examples.

## Inspect first, then ask

There is one configuration flow, with depth determined by the actual request. Complete accessible read-only checks before collecting preferences; no preliminary choice of modes or modules is required.

| Inspect proactively | Recommendation it supports |
|---|---|
| Actual Codex home, existing instructions, overrides, and relevant settings | Exact target, preserved local rules, shadowing, and conflicts |
| Active shell/version, relevant encoding behavior, Git, and installed tools | Workable current-environment behavior, optional improvements, costs, and keep-current alternatives |
| Exposed models and supported controls | Role/model suggestions after checking release, capability, provider-price, and speed evidence |
| Question tools, mode restrictions, and observable feature state | Necessary proactive interaction and an allowed fallback |
| File encoding, line endings, permissions, hash, recovery, and applicable instruction-chain budget | Minimal diff, backup, and whether the merged instructions would be truncated |

Extract only relevant configuration fields. Do not dump `config.toml`, read authentication files, or send keys, private endpoints, or deployment identifiers to search engines. If inventory, speed, or price evidence is unavailable, mark it unknown, finish other checks, and offer a limited recommendation without endless probes or invented data.

A successful write does not prove every instruction loads. Before merging, check the contributing chain's bytes against the installed version's effective limits, including `project_doc_max_bytes` where relevant. Resolve known overflow with a deduplicated/smaller complete policy or a specifically authorized configuration change. Do not silently truncate, remove user content, or raise the limit. If loading completeness cannot be checked, report it as unverified.

Then present detected facts, reused choices, recommendations with reasons, and only the decisions the user must make: model strategy, proactive questions, resource preferences, or actual rule conflicts. Respect question-tool limits. Follow up only when an answer introduces a real dependency or conflict. Optional numeric limits can use a disclosed conservative fallback without a question for every checklist entry.

For example, suppose discovery finds Windows with PowerShell 5.1, no Git, and no instruction override conflict. The user already requested Chinese, the current default model, and no automatic installations. Preserve those choices, explain the optional benefits of PowerShell 7 and Git in the same proposal, continue adapting to the existing environment, and resolve only outstanding interaction preferences and concrete file changes. Do not ask for language again, require rule selection, or make tool installation a prerequisite.

The proposal can include the complete diff and exact operation scope. Obtain missing authority for that concrete result; do not reconfirm an already authorized operation. Policy writes, optional `config.toml` changes, extra tools, and restarts have distinct scopes that can be listed and decided together. A question tool cannot replace an approval mechanism its restrictions require.

## Installed instructions

The result is a usable `AGENTS.md` containing applicable behavior and approved preferences, with descriptive headings and ordinary lists. Exclude catalog IDs such as `[CORE-001]` and `[SUB-007]`, question IDs, module-status tables, research tables, source/revision bookkeeping, and installation commentary.

For example, a delegation rule can read:

```markdown
Keep simple tasks with the primary Agent. Use available, authorized read-only agents
for substantial file exploration. Define responsibilities, evidence, and stop limits;
the primary Agent verifies decisive findings and owns final acceptance.
```

Catalog identifiers remain in repository sources for maintenance, translation, and upgrade comparison. Bundled policy assets remove those tags without reducing behavioral boundaries; validation checks that they match their sources. When updating an older installation, include leaked repository tags in the proposed cleanup while retaining their behavior. Preserve user-owned identifiers and project references with a runtime purpose; do not remove tags globally.

## How to use it

An Agent can configure directly from a local checkout without installing the Skill first:

```text
Use this checkout's skills/adopt-agent-policy to configure my Codex user-level AGENTS.md.
First inspect relevant settings, the environment, and exposed models, and check public sources.
Reuse existing preferences and present recommendations, outstanding decisions, and the proposed diff together.
```

To install only the reusable Skill, request `skills/adopt-agent-policy` from an identified version; that operation does not also modify `AGENTS.md`. Its workflows and policy assets are bundled, so no additional checkout is required. Honor a different explicitly selected checkout/release instead of assuming one exists beside the installation. Install `skills/maintain-development-notes` separately when requested and compare existing destinations.

For a deliberate update, use `workflows/UPDATE.md` and revisit only changed decisions. Missing old records should not prevent semantic comparison. Other Agents can adapt the behavior to their own instruction discovery, model controls, and installation mechanisms rather than copying Codex paths.

## Adoption procedure

When the user asks to adopt this repository:

1. Read the applicable user/project instructions and recovery notes.
2. Detect the environment and actual harness capabilities without asking the user to confirm objective facts.
3. Check relevant public model evidence and prepare recommendations with alternatives and unknowns.
4. Reuse existing answers and collect unresolved preferences/conflicts together.
5. Merge semantically, preserve local changes, and generate self-contained instructions without maintenance IDs.
6. Show the concrete diff, exact scope, encoding, backup, recovery, and fallbacks; resolve missing authority.
7. Apply only authorized changes, verify hashes, diff, overrides, and actual prose, and report write/load state.

See [`workflows/ADOPT.md`](workflows/ADOPT.md) for the detailed contract.

## Boundary examples

| Situation | Runtime behavior | Adoption behavior |
|---|---|---|
| New ordinary coding thread | Use the existing runtime policy and current facts | Do not start the interview |
| First guideline installation | Finish relevant configuration, environment, and model checks first | Recommend a complete configuration, collect unresolved choices, default to user-level scope |
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

Interaction boundary cases: reuse existing choices; preserve an allowed clarification channel when enablement is deferred; verify a requested window before dependent work; monitor an existing build without restarting it. Keep preference, write, and restart authority explicit; they can be resolved together.

## Language and localization

English and Simplified Chinese sources share stable IDs and should remain behaviorally equivalent; installed instructions omit those maintenance IDs. Normally install one runtime language. A companion translation may aid human review, but duplicating both full policies in one file increases context use and translation-drift risk.

## Validation

Run from the repository root in PowerShell 7:

```powershell
pwsh -NoProfile -File ".\scripts\validate-repository.ps1"
pwsh -NoProfile -File ".\scripts\test-validator.ps1"
```

Validation uses the repository's PowerShell toolchain without requiring adopting users to switch shells. It checks encoding, links, source/catalog relations, decision-checklist coverage, Skill metadata, clean policy assets, and source/asset consistency. Regression tests mutate temporary packages without installing anything. Neither proves semantic equivalence or Agent workflow behavior.

After changing bilingual policy sources, maintainers run `pwsh -NoProfile -File ".\scripts\sync-policy-assets.ps1" -Write`, then the checks above. This updates repository assets only; it does not install or modify a user's `AGENTS.md`.

Use [review scenarios](tests/policy-scenarios.md) for a separate behavior-oriented walkthrough or a future isolated forward test. Record which actually ran; do not call a primary-Agent walkthrough an independent execution test.

For prose review, [reading cases](tests/artifact-reading-cases.md) provide complete excerpts and separate review notes. Read the excerpts first, then compare the notes to check missing prerequisites, ambiguous references, inaccurate summaries, and placeholders. Structural validation does not establish that readers can understand those excerpts without difficulty.

## Status and publication

This repository provides configuration-level guidance; installation and tradeoffs remain the user's decisions. A newer source file does not authorize a push, PR, merge, release, installation, or overwrite of existing instructions. Use an identifiable package/source version and keep local changes recoverable.

## License

MIT
