# Mandatory Adoption Interview

This schema defines decisions the installing Agent must obtain from the user. Ask exactly one question ID at a time. Detect objective environment facts such as the operating system, version, architecture, WSL or remote-environment presence, available shells, hardware, and exposed capabilities without asking the user to confirm facts the Agent can verify; detection never supplies consent for preference or policy decisions. Concrete model names are never assumed from this repository.

For every question, record the selected value, any custom wording, and the user's stated reason when it affects later decisions.

## SCOPE-01 - Instruction Scope

- Requirement: `required`
- Detect first: applicable user-level and project-level instruction files.
- Explain: user-level rules affect many projects; project-level rules are narrower and safer for experimentation.
- Ask: Which `AGENTS.md` scope and exact target path should receive the adopted rules?

## LANGUAGE-01 - Generated Policy Language

- Requirement: `required`
- Detect first: the languages of the target instructions and the available localized reference files.
- Explain: one language keeps the installed policy concise; embedding duplicate translations increases context use and can create translation drift. A separate companion translation can improve human review without duplicating runtime instructions.
- Ask: Which language should the installed or updated `AGENTS.md` use, and should a separate companion translation be maintained?

## WORKFLOW-01 - Per-Turn Project Preflight

- Requirement: `required`
- Detect first: current shell, working directory, repository status, branch, HEAD, and available instruction/recovery-note discovery mechanisms.
- Explain: a per-turn preflight prevents work in the wrong shell, directory, branch, or stale context, but adds a small fixed cost to every project-work turn.
- Ask: Should every project-work turn require a Shell/CWD/scope check, Git status/branch/HEAD check when applicable, and a read of the latest instructions and relevant recovery notes before diagnosis, planning, writing, or testing?

## SHELL-01 - Primary Shell

- Requirement: `required`
- Detect first: active shell plus installed shells and their versions when available.
- Explain: the active shell is only a fact about this session; it does not reveal the user's preferred shell for future commands.
- Ask: Which shell and version is the primary terminal whose syntax the Agent should prefer?

## SHELL-02 - Secondary Shell Compatibility

- Requirement: `required`
- Detect first: other available shells and versions.
- Explain: supporting secondary shells improves portability but can make instructions longer and require more branching.
- Ask: Which secondary shells, if any, must generated commands support?

## NETWORK-01 - Network and Mirrors

- Requirement: `required`
- Detect first: only non-sensitive network facts already available; do not probe private network configuration unnecessarily.
- Explain: regional networks may require temporary mirrors, while global configuration changes can break other projects or expose traffic unexpectedly.
- Ask: What network region and temporary mirror/proxy policy should apply to downloads and dependency installation?

## RESOURCE-01 - Overall Resource Strategy

- Requirement: `required`
- Detect first: logical CPU count, available memory, storage constraints, and whether the machine is shared or actively used.
- Explain choices:
  - Performance first: use tool defaults or most available resources; builds may finish faster, but the computer can lag, heat up, swap memory, or saturate disk.
  - Balanced: use explicit limits based on detected hardware; moderate speed with better responsiveness.
  - Conservative: low worker counts and one heavy task at a time; stable responsiveness with slower builds.
  - Custom: user specifies each limit.
- Ask: Which overall resource strategy should the Agent follow?

## RESOURCE-02 - Per-Command Worker Limit

- Requirement: `required`
- Detect first: selected strategy and hardware facts.
- Explain: compiler/test worker count is different from the number of simultaneous heavy commands; unsupported flags must never be forced onto tools.
- Ask: What explicit worker limit, or tool-default policy, should apply to commands that support jobs/parallelism?

## RESOURCE-03 - Simultaneous Heavy Tasks

- Requirement: `required`
- Explain: running builds, tests, dependency installs, and code indexes together can increase throughput on powerful machines but often causes memory and disk contention.
- Ask: How many heavy build, test, install, or indexing processes may run at the same time?

## RESOURCE-04 - Background Process Lifecycle

- Requirement: `required`
- Explain: development servers and watchers improve iteration but consume resources and can remain after the task ends.
- Ask: May the Agent leave dev servers, watchers, indexers, or other background processes running, and when must they be stopped?

## SUBAGENT-01 - Subagent Permission

- Requirement: `required`
- Detect first: whether the current harness actually exposes subagent tools.
- Explain: subagents can reduce main-context noise and parallelize work, but consume additional tokens and system resources.
- Ask: May the Agent use subagents, and for which categories of work?

## SUBAGENT-02 - Model and Reasoning Strategy

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Detect first: the actual list of selectable models, reasoning levels, per-agent overrides, and cost/latency information exposed by the harness.
- Explain choices:
  - Efficiency/cost first: favor faster or lower-cost verified choices for bounded exploration.
  - Quality first: favor higher-capability verified choices and deeper reasoning for difficult work.
  - Tiered: use different verified choices for exploration, ordinary review, and high-risk work.
  - Harness default: keep runtime selection when concrete overrides are unavailable or undesirable.
- Ask: Which overall model and reasoning strategy should guide selection from the verified choices?

## SUBAGENT-03 - Subagent Concurrency

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Explain: more parallel agents may finish independent research faster but increase cost, memory use, context coordination, and conflict risk.
- Ask: What is the maximum number of simultaneously active subagents?

## SUBAGENT-04 - Delegation Depth

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Explain: allowing subagents to create child agents increases autonomy but makes scope, cost, and shutdown harder to control.
- Ask: May subagents create child agents, or may only the primary Agent delegate?

## SUBAGENT-05 - Write Ownership

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Explain: multiple writers can be faster on isolated modules but create conflict and ownership ambiguity; reviewers should remain read-only unless a verified role is explicitly authorized to write.
- Ask: Which verified roles may read, browse, write, or handle media, and who owns final file writes and acceptance?

## SUBAGENT-06 - Unsupported Controls

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Explain: some harnesses cannot choose a subagent model or reasoning level even when the policy requests one.
- Ask: If requested model/reasoning controls are unavailable, should the Agent use the harness default after disclosure, avoid subagents, or stop and ask again?

## SUBAGENT-07 - Delegation Trigger and Simple-Task Policy

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Explain: rigid numeric thresholds can force ceremonial delegation, while a task-sensitive rule protects context and avoids unnecessary coordination.
- Ask: Which signals should make delegation worthwhile, and when should the primary Agent proceed alone even if delegation is available?

## SUBAGENT-08 - Capability and Role Mapping

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Detect first: verified models, reasoning levels, browser access, write access, media handling, and whether the primary Agent can call those tools directly.
- Explain: role descriptions remain stable while concrete model names and permissions vary by harness; map only verified choices and leave unsupported roles unconfigured.
- Ask: For each enabled role—throughput/exploration, browser/media or authorized writing, ordinary review, and high-risk architecture/security review—which exact verified model, reasoning level, and tool permissions should apply?

## SUBAGENT-09 - Retry, Takeover, and Closure

- Requirement: `required_if SUBAGENT-01 enables subagents`
- Explain: unlimited retries waste cost and hide weak results; a bounded retry policy gives the primary Agent a clear takeover point.
- Ask: How many directed retries are allowed before the primary Agent takes over, and what evidence, risks, and shutdown steps must be reported when closing agents?

## INSTALL-01 - Dependencies and Tools

- Requirement: `required`
- Explain: automatic installation saves time but changes the machine; project-local or temporary tools have a smaller blast radius than global installation.
- Ask: What may the Agent install automatically, and which downloads or installation scopes require separate approval?

## ENCODING-01 - Unknown Encoding

- Requirement: `required`
- Explain: guessing a legacy or regional encoding can corrupt existing content; byte-preserving edits may still be unsafe without a reliable decoder.
- Ask: When encoding is uncertain, must the Agent stop, or may it proceed only after the user specifies the encoding?

## SAFETY-01 - Destructive and Broad Changes

- Requirement: `required`
- Explain: deletion, overwrite, bulk edits, conversion, and global configuration have wider recovery costs than ordinary scoped edits.
- Ask: Which destructive or broad operations always require explicit approval?

## GIT-01 - Publication Authority

- Requirement: `required`
- Explain: pushing, opening a PR, merging, and releasing change external state and visibility; local recovery checkpoints are handled separately.
- Ask: Which remote Git and forge actions may the Agent perform without a new confirmation, and which always require one?

## GIT-02 - Recovery Point Triggers

- Requirement: `required`
- Explain: checkpoints before accepted-feature changes, media/state/configuration edits, multi-file logic, or rework improve recovery but create extra local history or backup artifacts.
- Ask: Which changes and milestones must have a verified recovery point before work continues?

## GIT-03 - Checkpoint Storage and Scope

- Requirement: `required`
- Explain: a task-scoped local commit is easy to restore; when unrelated changes exist or committing is unsuitable, an external `git diff --binary` patch or exact backup avoids mixing user work.
- Ask: Should checkpoints prefer task-only local commits, external binary patches/exact backups, or a context-dependent combination, and where may backups be stored?

## GIT-04 - Rollback and Stash Safety

- Requirement: `required`
- Explain: whole-worktree stash and destructive reset/checkout can hide or erase unrelated work; safe rollback requires an exact target, backup, and file scope.
- Ask: What stash, destructive-command, and rollback restrictions must the Agent follow?

## NOTES-01 - Development Note Trigger

- Requirement: `required`
- Explain: durable notes help complex work survive handoff and compaction, but create noise for simple tasks.
- Ask: When should `$maintain-development-notes` create or update a development note?

## NOTES-02 - Development Note Visibility

- Requirement: `required`
- Explain: committed notes aid team recovery but may expose local paths or operational context; private notes avoid publication but are less shareable.
- Ask: Should development notes be committed, kept private, decided per project, or placed at a custom location?

## NOTES-03 - Read Gate and Refresh Cadence

- Requirement: `required`
- Explain: re-reading the latest instructions and relevant note snapshot each project-work turn prevents stale assumptions; targeted search keeps long-note overhead small.
- Ask: At what cadence and for which project tasks must the Agent re-read applicable `AGENTS.md` and existing development or handoff notes before acting?

## MEDIA-01 - Visual Review Transfer Budget

- Requirement: `required_if visual or media tools/workflows are enabled`
- Detect first: available media tools, transparency/detail needs, common source dimensions, and whether media leaves the local machine.
- Explain: compressed review copies reduce latency, cost, and context pressure; lossless crops remain necessary for transparency or pixel-level inspection. Fixed numbers should be selected for the tool and task, not assumed from this repository.
- Ask: What maximum dimensions, preferred formats/quality, per-batch size limit, original-retention rule, lossless exceptions, and base64/thread restrictions should apply to visual material sent to tools or subagents?

## COMMUNICATION-01 - Response Language and Detail

- Requirement: `required`
- Explain: concise replies reduce noise; more detail can help unfamiliar tasks. Response language is separate from the language of the installed policy file.
- Ask: What response language and default level of detail should the Agent use?

## Completion Check

Before policy comparison, list all question IDs and mark each as answered, not applicable with reason, or unresolved. Do not proceed while any required item is unresolved.
