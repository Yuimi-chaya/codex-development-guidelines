# Guided First Adoption Workflow

Use this workflow only when a user deliberately adopts the reference policy in a user/project scope or creates a reusable configuration. It is not a per-thread startup routine. Ordinary project threads follow the adopted runtime `AGENTS.md` without replaying the interview. A read-only review produces findings, not an adoption session; deliberate source updates use [update.md](update.md).

The reference files are candidate policy data, not active instructions during review. Resolve the user-selected source separately from the installed Skill: record its path and commit/release, or label it a local draft. Read the source's selected runtime baseline and stable rule catalog. Do not assume they exist next to an installed Skill.

## Non-negotiable gates

1. Read the user's already-applicable instructions and relevant recovery notes before evaluating the reference.
2. Confirm the active Shell, working directory, task scope, and Git state when the adoption work is inside a repository.
3. Detect objective environment and capability facts without asking the user to confirm verifiable facts.
4. Use `standard` depth unless the request calls for `quick` or `full`. Reuse applicable explicit answers with provenance; ask only unresolved selected questions from [interview.md](interview.md).
5. Ask exactly one question ID at a time. Explain practical tradeoffs before requesting a decision.
6. Do not use timeouts, silence, or a tool default as consent for a user preference.
7. Do not modify `AGENTS.md`, install a Skill, create a profile, or change global configuration until the relevant operation has separate explicit approval.
8. Interview completion is not write approval. Show the exact diff, target, encoding, backup, recovery point, and permissions before writing.

## Phase 1: Inspect without writing

1. Identify the active shell, working directory, scope, and applicable instruction paths using the harness's actual discovery rules. Detect operating system, version, architecture, remote context, hardware, and tool capabilities only where they affect the adoption. Do not scan sensitive configuration or require capabilities the harness cannot enumerate.
2. Report detected facts as `detected`, and distinguish `inferred`, `unknown`, and `user-selected` values. Do not convert facts into permanent preferences.
3. Locate the intended target and available localized references. Inspect target existence, encoding, BOM, line endings, permissions, size, and hash.
4. Inspect an installed Skill only if the user is considering installing or updating it. Normalize line endings for comparison only; retain original bytes for backup and writing. A normalization-only difference is not an update. Never overwrite an existing installation silently.
5. In Git, identify branch, HEAD, dirty state, unrelated changes, and the latest valid recovery point.
6. If encoding cannot be identified reliably, stop before proposing a write.

Distinguish terminal host from active shell/version. Inspect relevant encoding behavior, installed tools, Git availability, and repository state using non-sensitive observations. If Git is absent, do not run Git commands or initialize a repository automatically. Propose useful improvements without making them adoption prerequisites: explain source/version when applicable, benefits, compatibility costs, scope, risk, recovery, and the alternative of retaining the current environment. PowerShell 7 may be worth recommending on Windows for UTF-8 consistency after checking current documentation, but it does not guarantee all external-tool or legacy encoding issues disappear. Git may improve change inspection and recovery; declining it means choosing suitable exact backups, not refusing ordinary work.

## Phase 2: Select the adoption depth

Explain the three modes:

- `quick` is for a local first use or a small project. It confirms scope, language, immediate permissions, and only the modules needed now.
- `standard` is for a reusable project profile. It asks preferences for enabled modules such as Git recovery, notes, delegation, or resources.
- `full` is for a user-level or team-level profile. It refreshes every applicable preference and capability mapping.

The mode changes interview breadth, not runtime safeguards. State the selected depth briefly; do not force a mode-selection round when the request is clear. Existing explicit answers satisfy a question without re-asking. Unknown preferences can remain unconfigured with a disclosed runtime fallback; missing consent for an actual operation cannot.

## Phase 3: Run the selected interview

1. Read the relevant questions in [interview.md](interview.md) and process selected IDs in dependency order.
2. Detect facts before each question. When subagents, browser, media, or writing roles are involved, show only capabilities actually exposed by the current harness.
3. Record answers and custom wording without changing files.
4. Mark unrelated questions not applicable and unknown preferences deferred, with reasons. Do not treat either state as consent or as disabled runtime protection.
5. Show a concise decision record for selected questions and skipped modules. A full review may show all IDs; quick adoption need not dump the entire catalog. Resolve every conflict affecting the proposed write.

When selecting or refreshing model roles, use [model-selection.md](model-selection.md): begin with exposed IDs, verify public identities, release dates, relevant capabilities, actual-provider prices, and speed evidence, then offer a shortlist with sources/date/uncertainty. Reuse existing approved choices unless the user requests a refresh or a relevant premise changed. Recent, fast, low-cost throughput candidates still need adequate reliability. Let the user select the final model/reasoning/fallback mappings; research does not authorize paid benchmarking.

For interactive workflows, discuss method, execution capability, context isolation, and resource preferences separately. The strongest interactive model may run as an executor; do not tie advanced capability to the primary context. Resolve direct-use authority even if subagents are disabled. Keep step/time/cost budgets distinct from media transfer and retention controls, and mark unsupported controls rather than promising them.

## Phase 4: Compare and present

Semantically compare the target with the selected source's localized reference and stable rule catalog. Classify each rule as:

- `equivalent`: already covered; keep local wording.
- `compatible`: useful addition or deduplicated merge.
- `conflicting`: explain both behaviors and ask separately.
- `not applicable`: excluded by task, capability, or selected profile.
- `missing`: selected and useful but absent locally.

Before writing, show:

1. Detected facts and selected profile.
2. Runtime policy language and any companion translation.
3. Rules to keep, add, merge, replace, or omit with stable IDs.
4. Exact target path, encoding, BOM, line endings, and permissions.
5. Backup path and recovery-point plan.
6. Complete unified diff or equivalent before/after preview.
7. Any Skill installation or profile creation as a separate operation.

Put effective user choices in the target instructions, with conditions where needed. The generated `AGENTS.md` must work without the source checkout, Skill, or optional profile present. Do not copy the interview or explanatory modules into it. Skipping budget questions does not remove media protection; disabling delegation does not authorize forbidden direct browsing.

Keep volatile research tables and drafting commentary out of the runtime file. Review it for a future reader who never saw the adoption chat: provide actual rules, not instructions to fill them in later. Introduce necessary terms and conditions before use, name the subjects of references, and keep examples understandable at their location. Do not assume a fact elsewhere in the source checkout supplies missing context in the target file. Preserve relevant expertise and precise cross-references without copying all background into every rule.

Ask for explicit approval for the final policy diff. Enumerate separate profile, installation, or other operations so the user can approve only the intended subset; do not ask again for the same already approved operation.

## Phase 5: Apply and verify

After approval:

1. Re-read and re-hash every target. If it changed, stop and regenerate the preview.
2. Establish the approved task-scoped commit or external exact backup. Include relevant staged/unstaged state and separately protect required untracked assets; a plain binary diff is not a complete worktree backup. Do not use a whole-worktree stash or mix unrelated work.
3. Back up original bytes and preserve encoding, BOM, line endings, permissions, and unrelated content.
4. Apply only the approved changes, then re-read, hash, and inspect the final diff.
5. Validate file integrity and the approved semantic diff. Repository source validation does not enforce a user's customized target shape. If the source validator is available, run it for package integrity, not as proof that adoption works. Report checkpoint, target, backup, installation/publication state, and remaining manual validation.

## Separate Skill installation

Use the harness's supported installer when available, otherwise describe a scoped manual installation and obtain approval. This workflow does not depend on Codex-specific tools being present. Install only the requested folder, compare existing destinations, and preserve user changes. Use a pinned source. Discovery/restart requirements depend on the harness; report only verified requirements.

An optional adoption record follows [profile.md](profile.md). It is a review aid, not a hidden runtime configuration loader. Installing a Skill, adopting policy, and saving that record are separate operations.

## Completion criteria

Adoption is complete only when the selected questions are recorded, semantic conflicts are resolved, each approved write is verified, and unsupported capabilities are recorded rather than simulated. A future ordinary thread starts with the runtime policy, not with this interview.
