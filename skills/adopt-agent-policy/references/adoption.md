# Codex Instruction Configuration

Use this workflow after a request to install/configure the guidelines. Default to the actual Codex-home `AGENTS.md`, honoring an explicit project/file target. Ordinary threads use existing instructions; repository development and read-only review do not start installation. Deliberate updates use [update.md](update.md).

Use the bundled [English](../assets/runtime-policy.en.md) or [Chinese](../assets/runtime-policy.zh-CN.md) asset unless the user specifies another source. These are candidate text, not active instructions or write authority. Identify a selected checkout/release or local draft when applicable; do not require an extra checkout or ask the user to select rule entries.

## Non-negotiable gates

1. Read the user's already-applicable instructions and relevant recovery notes before evaluating the reference.
2. Confirm the active Shell, working directory, task scope, and Git state when the adoption work is inside a repository.
3. Detect objective environment and capability facts without asking the user to confirm verifiable facts.
4. Complete accessible environment/configuration/model discovery and public-source checks before collecting preferences; follow [discovery.md](discovery.md).
5. Reuse explicit answers. Present recommendations and unresolved preferences together using [interview.md](interview.md) as an internal checklist; no mandatory depth/module selection or one-ID-per-turn loop.
6. Show the concrete diff, target, encoding, backup, recovery, and operation scope. Use existing explicit authority where applicable; otherwise request the missing approval for this result. Distinguish optional configuration writes, extra installations, records, restarts, and publication, but allow a single response to authorize named operations. Silence, timeouts, or a suggested default are not consent.

## Phase 1: Inspect without writing

1. Follow [discovery.md](discovery.md) to locate Codex home, active overrides, relevant configuration, model inventory, and environment facts. Inspect only what affects configuration; do not scan secrets or require capabilities the harness cannot enumerate.
2. Report detected facts as `detected`, and distinguish `inferred`, `unknown`, and `user-selected` values. Do not convert facts into permanent preferences.
3. Locate the effective target and selected-language asset. Inspect target existence, encoding, BOM, line endings, permissions, size, and hash. A shadowed file is not an effective installation.
4. Inspect an installed Skill only if the user is considering installing or updating it. Normalize line endings for comparison only; retain original bytes for backup and writing. A normalization-only difference is not an update. Never overwrite an existing installation silently.
5. In Git, identify branch, HEAD, dirty state, unrelated changes, and the latest valid recovery point.
6. If encoding cannot be identified reliably, stop before proposing a write.

Distinguish terminal host from active shell/version. Inspect relevant encoding behavior, installed tools, Git availability, and repository state using non-sensitive observations. If Git is absent, do not run Git commands or initialize a repository automatically. Propose useful improvements without making them adoption prerequisites: explain source/version when applicable, benefits, compatibility costs, scope, risk, recovery, and the alternative of retaining the current environment. PowerShell 7 may be worth recommending on Windows for UTF-8 consistency after checking current documentation, but it does not guarantee all external-tool or legacy encoding issues disappear. Git may improve change inspection and recovery; declining it means choosing suitable exact backups, not refusing ordinary work.

## Phase 2: Research and recommend

Finish relevant checks before opening the preference discussion. Present detected facts, existing choices, proposed settings and alternatives, and unknowns. Recommend a complete configuration adapted from the baseline; users should not need to understand the repository's modules or identifiers.

When selecting or refreshing model roles, use [model-selection.md](model-selection.md): begin with exposed IDs, verify public identities, release dates, relevant capabilities, actual-provider prices, and speed evidence, then offer a shortlist with sources/date/uncertainty. Reuse existing approved choices unless the user requests a refresh or a relevant premise changed. Recent, fast, low-cost throughput candidates still need adequate reliability. Let the user select the final model/reasoning/fallback mappings; research does not authorize paid benchmarking.

For interactive workflows, discuss method, execution capability, context isolation, and resource preferences separately. The strongest interactive model may run as an executor; do not tie advanced capability to the primary context. Resolve direct-use authority even if subagents are disabled. Keep step/time/cost budgets distinct from media transfer and retention controls, and mark unsupported controls rather than promising them.

Evaluate proactive interaction using [user-interaction.md](user-interaction.md). Explain supported channels, benefit, and interruption cost; recommend enabling necessary questions, retaining existing behavior, or deferring. An actual feature change names `config.toml` and its exact key as a distinct optional operation. A recommendation does not authorize the write or restart. Preserve necessary clarification and approval boundaries even if optional interaction is declined.

## Phase 3: Collect unresolved choices together

Use [interview.md](interview.md) internally to check coverage. Reuse existing preferences; group remaining related choices in the same proposal, with a recommended bundle and keep-current alternatives. If an input tool limits question count, fit related decisions into its supported format or ask through an allowed channel; do not expand every checklist entry into a separate turn. Follow up only for a real conflict or answer-dependent branch.

Unknown optional numeric settings can retain a disclosed conservative fallback. Resolve material conflicts and authority needed for the proposed write. A user can approve the exact proposed bundle; an unanswered preference is not an approved choice. When choices are already known, proceed straight to the concrete diff.

## Phase 4: Compare and present

Semantically compare the target with the selected policy text. When using a source checkout, its catalog can help internal comparison; the user's file does not need catalog IDs. Classify changes internally as:

- `equivalent`: already covered; keep local wording.
- `compatible`: useful addition or deduplicated merge.
- `conflicting`: explain both behaviors and include the needed choice in the consolidated proposal.
- `not applicable`: excluded by task, capability, or selected configuration.
- `missing`: selected and useful but absent locally.

Before writing, show:

1. Detected facts, reused preferences, and proposed configuration.
2. Runtime policy language and any companion translation.
3. Meaningful changes and preserved/conflicting behavior in ordinary language.
4. Exact target path, encoding, BOM, line endings, permissions, and proposed instruction-chain bytes versus the applicable loading budget.
5. Backup path and recovery-point plan.
6. Complete unified diff or equivalent before/after preview.
7. Any Skill installation, profile creation, interaction-feature configuration, or host restart as a separate operation.

Put effective user choices in the target instructions, with conditions where needed. The generated `AGENTS.md` must work without the source checkout, Skill, or optional profile. Exclude catalog/question IDs, module-status metadata, source/revision bookkeeping, interview text, research tables, and adoption commentary; descriptive headings and ordinary paragraph numbers are fine. Do not delete user-owned references that serve a runtime purpose. Skipping budget questions does not remove media protection; disabling delegation does not authorize forbidden direct browsing.

Keep volatile research tables and drafting commentary out of the runtime file. Review it for a future reader who never saw the adoption chat: provide actual rules, not instructions to fill them in later. Introduce necessary terms and conditions before use, name the subjects of references, and keep examples understandable at their location. Do not assume a fact elsewhere in the source checkout supplies missing context in the target file. Preserve relevant expertise and precise cross-references without copying all background into every rule.

Where approval is still required, request it for this concrete diff through the permitted approval channel. Combine the preview and outstanding preferences when practical; the user can approve only the named subset of operations. If a choice changes the proposal, update the affected diff. Reconfirm only new scope, changed target state, or unresolved authority, not the same already authorized operation.

## Phase 5: Apply and verify

Once the required authority is resolved:

1. Re-read and re-hash every target. If it changed, stop and regenerate the preview.
2. Establish the approved task-scoped commit or external exact backup. Include relevant staged/unstaged state and separately protect required untracked assets; a plain binary diff is not a complete worktree backup. Do not use a whole-worktree stash or mix unrelated work.
3. Back up original bytes and preserve encoding, BOM, line endings, permissions, and unrelated content.
4. Apply only the approved changes, then re-read, hash, and inspect the final diff.
5. Validate file integrity and the approved semantic diff. Read the actual generated instructions for internal-ID leakage, missing referents, leftover placeholders, ineffective override placement, and dependence on absent source files. Recheck applicable chain-byte limits: a successful write/hash cannot prove a known oversized policy loads completely. Resolve known overflow before applying; disclose unavailable load evidence. Preserve stricter local rules and unrelated content. Source validation checks package integrity, not the user's customized target shape or runtime behavior. Report target, backup/checkpoint, actual write/load state, and remaining manual validation.

## Separate Skill installation

If the user requests only the reusable Skill, use the harness's supported installer, compare existing destinations, preserve user changes, and install only the requested folder from an identified version. That operation does not also adopt the policy. If configuration and package installation are both requested, show both scopes together. Report actual discovery/reload requirements; do not restart the host automatically.

An optional adoption record follows [profile.md](profile.md). It is a review aid, not a hidden runtime configuration loader. Installing a Skill, adopting policy, and saving that record are separate operations.

## Completion criteria

Configuration is complete when material choices/conflicts are resolved, each authorized write is verified, and unsupported capabilities are disclosed. No extra profile or questionnaire transcript is required. A future ordinary thread uses the effective instructions without restarting setup.
