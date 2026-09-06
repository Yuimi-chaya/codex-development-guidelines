# First-Adoption Interview Schema

This question bank belongs to `adopt-agent-policy`. Use it for deliberate first adoption or a configuration update, not ordinary coding or a read-only policy review. Starting a thread, encountering an unconfigured module, or finding no `AGENTS.md` does not by itself trigger an interview.

## Interview modes

- `quick`: confirm scope, language, permissions that are immediately relevant, and any module needed by the current adoption.
- `standard`: ask decisions for the modules the user wants enabled in the target profile; leave unrelated modules unconfigured.
- `full`: build or refresh a reusable user-level or team-level profile and ask every applicable preference below.

Ask one unresolved question ID at a time and split compound preferences into short follow-ups where needed. Reuse explicit applicable answers from the request or existing instructions with their source; `required` means resolved, not necessarily asked again. Detect facts first, do not ask users to reconfirm them, and mark unknown facts honestly. Standard is the module-focused default; modes are not mandatory preliminary questions.

Record decisions as answered, reused (with source), not applicable (with reason), deferred (with a disclosed fallback), or unresolved. Defer optional unknown preferences, not consent or a conflict that affects the proposed write. Do not ask about private network configuration or hardware unrelated to the adoption.

## Runtime safeguards versus questions

The question bank configures adopted rules; it does not determine whether unasked safety rules exist. Reuse runtime defaults in the visible proposal when appropriate, labeling them proposed rather than user-selected. A final approved diff can adopt those disclosed defaults. Without such approval, silence adopts nothing. Resource limits, browser exceptions, and publication permissions must not silently become permissive when questions are skipped.

## SCOPE-01 - Instruction Scope

- Requirement: required for every adoption mode.
- Detect: applicable user-level and project-level instruction files and the requested target.
- Ask: Which scope and exact target path should receive the adopted runtime rules?

## LANGUAGE-01 - Generated Policy Language

- Requirement: required for every adoption mode.
- Detect: target language and available localized references.
- Explain: one runtime language keeps the policy concise; a separate companion translation may aid human review without duplicating runtime instructions.
- Ask: Which language should the target use, and should a companion translation be maintained?

## WORKFLOW-01 - Runtime Preflight

- Requirement: full profile, or when changing the startup/notes module.
- Explain: preflight protects against stale scope, branch, or context, but a small task may not need every check.
- Ask: In which project-work situations should the Agent confirm Shell, working directory, scope, Git state, instructions, and notes before acting?

## SHELL-01 - Primary Shell

- Requirement: full profile or when command generation depends on a preferred shell.
- Detect: active shell and installed shell versions.
- Ask: Which shell and version should be preferred for future commands?

## SHELL-02 - Secondary Shell Compatibility

- Requirement: full profile or when cross-shell portability matters.
- Detect: other available shells.
- Ask: Which secondary shells, if any, must generated commands support?

## NETWORK-01 - Network and Mirrors

- Requirement: full profile or when downloads/dependency installation are part of adoption.
- Detect: non-sensitive network facts only.
- Ask: What region, temporary mirror, proxy, and global-configuration policy should apply?

## RESOURCE-01 - Overall Resource Strategy

- Requirement: full profile or when the user wants persistent resource policy.
- Detect: available non-sensitive CPU/memory/storage facts when relevant. Treat shared-use or responsiveness preferences as unknown unless the user has stated them.
- Ask: Should the Agent use performance-first, balanced, conservative, or custom resource behavior?

## RESOURCE-02 - Per-Command Worker Limit

- Requirement: full profile or when persistent worker limits are requested.
- Ask: What worker limit, or tool-default policy, should apply where commands support it?

## RESOURCE-03 - Simultaneous Heavy Tasks

- Requirement: full profile or when persistent heavy-task limits are requested.
- Ask: How many heavy build, test, install, or indexing processes may run at once?

## RESOURCE-04 - Background Process Lifecycle

- Requirement: full profile or when the Agent may manage long-running processes.
- Ask: May the Agent leave servers, watchers, or indexers running, and when must they stop?

## SUBAGENT-01 - Subagent Permission

- Requirement: standard/full when subagents are exposed and the target profile covers delegation.
- Detect: whether subagent tools are actually available.
- Ask: May the Agent use subagents, and for which categories of work?

## SUBAGENT-02 - Model and Reasoning Strategy

- Requirement: full or explicit delegation profile when subagents are enabled.
- Detect: actual selectable models, reasoning levels, cost/latency information, and per-agent overrides.
- Ask: Should verified choices be selected for efficiency, quality, a tiered strategy, or the harness default?

## SUBAGENT-03 - Subagent Concurrency

- Requirement: full or explicit delegation profile when subagents are enabled.
- Ask: What is the maximum number of simultaneously active subagents?

## SUBAGENT-04 - Delegation Depth

- Requirement: full or explicit delegation profile when subagents are enabled.
- Ask: May subagents create child agents, or may only the primary Agent delegate?

## SUBAGENT-05 - Write and Tool Ownership

- Requirement: standard/full when subagents are enabled.
- Explain: authorized roles may own separate file writes, but the primary Agent retains final decisions and acceptance. Direct browser use requires an allowed route or scoped exception; disabling subagents does not bypass that boundary.
- Ask: Which verified roles may read, browse, write, or handle media, and who owns final acceptance?

## SUBAGENT-06 - Unsupported Controls

- Requirement: full or explicit delegation profile when requested model/reasoning controls may be unavailable.
- Ask: If a requested control is unavailable, should the Agent disclose and use the harness default, avoid subagents, or stop and ask?

## SUBAGENT-07 - Delegation Trigger

- Requirement: standard/full when subagents are enabled.
- Explain: delegation should be driven by material benefit, not ceremonial numeric thresholds.
- Ask: Which task signals justify delegation, and when should the primary Agent proceed alone?

## SUBAGENT-08 - Capability and Role Mapping

- Requirement: full or explicit delegation profile when roles are enabled.
- Detect: verified models, reasoning levels, browser/write/media access, and primary-Agent access.
- Ask: For each enabled role, which exact verified model, reasoning level, and tool permissions should apply?

## SUBAGENT-09 - Retry, Takeover, and Closure

- Requirement: standard/full when subagents are enabled.
- Explain: bounded retries protect cost and make takeover explicit.
- Ask: Should the default maximum of one directed retry apply, and what progress/stop boundary is appropriate? The primary Agent may take over sooner and must verify conclusions independently.

## INSTALL-01 - Dependencies and Tools

- Requirement: required when adoption may install a Skill, dependency, or helper.
- Ask: What may the Agent install automatically, and which sources or scopes require separate approval?

## ENCODING-01 - Unknown Encoding

- Requirement: full profile or when the target contains uncertain legacy text.
- Ask: Must the Agent stop on unknown encoding, or proceed only after the user specifies it?

## SAFETY-01 - Destructive and Broad Changes

- Requirement: required whenever adoption may modify existing instructions or broad configuration.
- Ask: Which destructive, broad, or subjective operations always require explicit approval?

## GIT-01 - Publication Authority

- Requirement: full profile, an explicit publication-policy change, or an actual requested forge action. Merely editing a Git-tracked file does not require a publication interview.
- Ask: Which remote Git and forge actions may occur without a new confirmation, and which always require one?

## GIT-02 - Recovery Point Triggers

- Requirement: full profile or when adopting Git recovery behavior.
- Ask: Which changes and milestones must have a verified recovery point before work continues?

## GIT-03 - Checkpoint Storage and Scope

- Requirement: full profile or when adopting Git recovery behavior.
- Ask: Should checkpoints prefer task-only commits, external exact backups, or a context-dependent combination, and where may backups be stored?

## GIT-04 - Rollback and Stash Safety

- Requirement: full profile or when adopting Git recovery behavior.
- Ask: What stash, destructive-command, and rollback restrictions must apply?

## NOTES-01 - Development Note Trigger

- Requirement: standard/full when the notes module is enabled.
- Ask: When should `$maintain-development-notes` create or update a durable note?

## NOTES-02 - Development Note Visibility

- Requirement: full profile when notes may be committed or shared.
- Ask: Should notes be committed, private, decided per project, or stored at a custom location?

## NOTES-03 - Read Gate and Refresh Cadence

- Requirement: standard/full when the notes module is enabled.
- Ask: For which project tasks and at what cadence must the Agent reread applicable instructions and notes?

## MEDIA-01 - Visual Review Transfer Budget

- Requirement: only when visual/media tools or workflows are enabled.
- Detect: available media tools, transparency/detail needs, source sizes, and whether media leaves the local machine.
- Ask: Which task-specific review budget and fidelity requirements should be recorded? Discuss dimensions, format, and batch size only where useful. Retain originals and avoid base64 echoes regardless; do not invent unavailable tool limits or allow raw batch uploads merely because numeric preferences are deferred.

## COMMUNICATION-01 - Response Language and Detail

- Requirement: full profile or when the user wants a reusable communication preference.
- Ask: What response language and default detail level should the Agent use?

## Completion

Before proposing the final diff, summarize selected answers, their sources, skipped modules, and any deferred values with the exact proposed fallback. A full review may list all IDs; a quick review should stay compact. Resolve decisions and conflicts that affect the write. Completing the interview never authorizes writing, installation, publication, or global changes.
