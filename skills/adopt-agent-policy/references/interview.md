# Configuration Decision Checklist

Use this internally after [discovery.md](discovery.md) and relevant research. Recommend a complete configuration, reuse existing choices, and collect only unresolved preferences together. This is not a questionnaire, a mode/module menu, or a sequence of mandatory questions. No topic IDs belong in the user-facing proposal or generated instructions.

The request determines depth. Optional unknown numbers can retain a disclosed conservative fallback. Missing permission, a material conflict, and a required unsupported capability need explicit resolution. Respect the input tool's limits and approval restrictions; follow up only for a real dependency.

## Scope and Language

- Resolve: actual Codex home and effective instruction file, overrides, explicit project scope, target language.
- Recommend: user-level `AGENTS.md` unless the user specifies otherwise; preserve existing language or propose the conversation language for a new file. One runtime language is normally sufficient.
- Decision: ask only if the target remains ambiguous, an override creates a material conflict, or language cannot reasonably be inferred. Show the exact path and scope in the concrete proposal.

## Environment and Recovery

- Resolve: active shell/version versus terminal host, relevant encoding behavior, available tools/Git, existing preflight/note cadence, checkpoint and rollback restrictions.
- Recommend: adapt to the retained environment. Explain optional tools with source/version, benefits, scope, risks, recovery, and a keep-current alternative. On Windows, PowerShell 7 may help UTF-8 consistency but cannot fix every external-tool or legacy-file issue. Git helps inspect and recover changes; non-Git work can use verified exact backups.
- Decision: combine only needed shell/tool, backup-location, or standing-installation choices. Do not require installation, initialize Git, change global identity/network/default-shell settings, or collect private network data. Preserve stricter preflight and rollback boundaries. Basic note behavior does not require another Skill installation; separate note storage/visibility matters only when a note is actually needed.

## Models and Delegation

- Resolve: exact exposed IDs/providers, supported reasoning and per-agent controls, actual visual/tool/session access, existing role mappings and permission. Use [model-selection.md](model-selection.md) before recommending choices.
- Recommend: a small role-based bundle with verified evidence, alternatives, and unknowns. Throughput candidates must be adequate before favoring recent, cheap, fast releases. A capable premium interactive executor can remain outside the primary context. One model may cover several roles; retain valid explicit choices.
- Decision: offer the relevant researched bundle, retained/default strategy, or custom choice. Resolve subagent permission and unsupported-control fallback without asking users to fill every role individually. Keep simple work local, exploration read-only, writes bounded by ownership, final acceptance with the primary Agent, one-level/conservative delegation, and at most one directed retry with an actual stop boundary unless the user chooses otherwise.
- Preserve: distinguish capability from tool/environment/permission blockers; coordinate both sides' pace, monitor existing long runs without duplicates, prevent overlapping file/UI operators, and carry pending effects and remaining budgets across handoffs. Direct browser authority remains relevant when delegation is unavailable; disabling agents never lifts an explicit prohibition.

## Resources and Media

- Resolve: existing worker/heavy-task limits, responsiveness preferences, server/watcher authority, and relevant visual workflows or supported retention controls.
- Recommend: conservative heavy-task concurrency when unset; optional numeric limits can remain conditional. Preserve originals, inspect dimensions/file/batch sizes before transfer, send necessary optimized evidence, and avoid base64 echoes. Model input, network payload, and persisted history are separate costs; closing an executor does not prove deletion.
- Decision: ask for durable numeric or lifecycle preferences only when they affect this configuration. Do not force a permanent media questionnaire for an unrelated workflow. Detail/coordinate fidelity and actual tool limits govern media choices; a deferred number never authorizes unchecked original uploads.

## Proactive Interaction

- Resolve: question/assistance tools, actual mode/input/approval restrictions, observable feature state and version support, and any existing preference. Use [user-interaction.md](user-interaction.md).
- Recommend: necessary concise questions and visible requests for human help, balanced against interruptions. Offer supported enablement, retaining current behavior, or deferral in the same proposal as other decisions.
- Decision: reuse a known choice; otherwise ask whether to enable this behavior. Name any `config.toml` key change and required reload separately. A behavioral preference alone does not authorize those operations, expose a tool, guarantee a notification, or confirm user action.
- Preserve: continue independent work while waiting, hold dependent steps, retain an allowed necessary-clarification channel when optional enablement is declined, and avoid empty/repetitive prompts or progress/apology dialogs. Silence and timeouts are not consent.

## Conflicts and Write Scope

- Resolve: semantic conflicts, exact diff, encoding/permissions, original hashes, backup/recovery, proposed instruction-chain bytes versus its applicable loading budget, and current operation authority.
- Recommend: preserve compatible wording, user-owned references, stricter boundaries, and unrelated content. Generate self-contained runtime prose without catalog/question IDs, source bookkeeping, research tables, or installation commentary.
- Decision: present material conflicts and any missing authority for the concrete result together. Known byte-budget overflow needs a complete smaller merge or an explicitly scoped configuration remedy, not truncation or a silent limit increase. Policy changes, optional feature writes, extra packages, records, restarts, and publication have distinct named scopes that can be decided in one response. Do not repeat authorization for the same unchanged operation, use a clarification tool for prohibited approval collection, or make an optional adoption record a prerequisite.

## Completion

Once relevant choices and conflicts are resolved, use the approved scope to apply and verify changes. Report what was actually written, preserved, checked, and backed up, plus unknown or pending load/acceptance state. No checklist transcript or extra profile file is required.
