---
name: maintain-development-notes
description: Read, reconcile, create, and maintain durable development notes for context recovery. Use automatically when a workspace or thread has multiple active features, branches, worktrees, PRs, repositories, risky local installations, repeated task switching, long-running investigations, or state that must survive compaction and handoff; whenever an applicable note exists, also use it before diagnosing problems, planning, choosing an approach, resuming work, or changing direction so prior similar scenarios, user preferences, rejected approaches, overall direction, evidence, and open risks guide the work. Do not create or update notes for ordinary chat, unrelated one-off questions, simple self-contained changes with no continuing state, or short read-only exploration that produces no durable decision or risk.
---

# Maintain Development Notes

Preserve verified project reality so the current agent and future agents can recover context without repeating investigations, ignoring user preferences, retrying rejected approaches, confusing branches, or losing safety constraints. Treat a development note as operational memory: read it before it should influence work, then update it when verified reality meaningfully changes.

## Apply separate read and write gates

Apply the read gate before the write gate.

### Read gate

When an applicable development note exists, read the relevant parts before diagnosing, planning, choosing a solution, implementing, resuming work, changing direction, installing, releasing, or handing off.

The read gate applies even when the current task is small and will not justify a note update. A small task can still depend on old decisions, user preferences, or a rejected approach.

Skip reading only for casual conversation, general advice, or work clearly unrelated to the note's scope.

### Write gate

Assess the write gate silently before creating or updating a note.

Create or adopt a development note when any hard trigger applies:

- The user explicitly requests a development note or durable handoff record.
- Work spans multiple threads, repositories, worktrees, or PRs.
- Work includes a risky local installation, package replacement, backup, rollback, migration, or production-like operation.
- The agent is about to switch away from a substantial unfinished workstream that must be resumed later.

Otherwise, create a note only when at least two complexity signals apply:

- Three or more active feature, bug, research, release, or publication tracks exist.
- Two or more branches, worktrees, deployment variants, or patch stacks must remain distinct.
- The thread repeatedly switches between tasks or returns to earlier tasks.
- Important state depends on exact paths, commits, versions, hashes, CI runs, settings, or external review status.
- Multiple failed or superseded approaches could be repeated without a record.
- The conversation is long enough that compaction or handoff is likely to lose operational context.
- Different artifacts have different ownership, safety boundaries, or release plans.

Do not create or update a note solely for:

- Casual conversation or general advice.
- A one-off question with no continuing implementation state.
- A small, self-contained change with one clear branch and no expected follow-up.
- Short read-only exploration that produces no durable decision or risk.
- Routine command output that is already captured adequately by source control or CI.

If the write gate is not met, continue without creating or updating a note. Still use any context recovered through the read gate.

## Discover and read before acting

1. Search the workspace for existing files such as `DEVELOPMENT_NOTES.md`, `DEV_NOTES.md`, `CODEX_DEV_NOTES.md`, `HANDOFF.md`, or a clearly equivalent project record.
2. Read applicable `AGENTS.md` instructions, then read the note's current snapshot, non-negotiable constraints, active workstreams, known risks, and immediate next actions.
3. Search the note for terms connected to the current task: symptoms, error text, feature names, paths, symbols, branches, tools, protocols, or user language.
4. Recover six kinds of operational memory before choosing an approach:
   - the same or a related problem or scenario;
   - user preferences and non-negotiable constraints;
   - rejected, failed, superseded, or unsafe approaches and why they were rejected;
   - the overall product, architecture, and release direction;
   - the last verified authoritative state and supporting evidence;
   - unresolved risks, pending validation, and ordered next actions.
5. Reuse the authoritative note. Do not create a competing note merely because its filename differs from the preferred name.
6. If multiple notes exist, identify their responsibilities and read the authoritative source for each relevant fact. Synchronize them only when their documented roles require it.
7. If authority is ambiguous or notes contradict each other, verify reality before acting. Ask the user only when repository evidence cannot resolve ownership safely.

For long notes, start with the current snapshot and use targeted search. Do not load or repeat the entire history when only a small section is relevant.

## Choose the note topology

- For one growing repository, use one root-level `DEVELOPMENT_NOTES.md` unless the repository already has an established equivalent.
- For a large multi-repository or multi-product workspace, use a short workspace recovery summary plus one canonical detailed engineering note only when both roles provide real value.
- Define the responsibility of every note near its top. Avoid maintaining two independent copies of the same history.
- Keep user-facing documentation separate from private agent recovery notes unless the user explicitly wants a public document.

Read [references/note-schema.md](references/note-schema.md) before creating a new note or substantially restructuring an existing one.

## Reconcile memory with reality before acting or writing

Treat conversation history and development notes as leads, not as substitutes for current evidence.

- Verify relevant repository path, branch, HEAD, dirty state, remotes, and worktree role.
- Verify PR, issue, CI, release, installation, version, backup, or hash state when it matters and tools permit.
- Distinguish `implemented`, `tested`, `human-validated`, `published`, `merged`, `installed`, `pending`, and `superseded`.
- Compare a proposed approach with previously rejected or superseded approaches. Do not repeat one unless a relevant premise changed, and record that changed premise.
- Honor recorded user preferences and overall direction unless the user has changed them or verified reality makes them impossible.
- If live evidence invalidates the note, correct the current snapshot before relying on it for downstream decisions.
- Record uncertainty explicitly. Never turn an assumption into a completed status.
- Never copy secrets, API keys, auth files, tokens, private prompt history, or unnecessary personal data into notes.

## Write for recovery

Put the current source of truth before long history. Include only information that changes how a future agent should act:

- Project purpose, user priorities, and non-negotiable constraints.
- Active workstreams and boundaries between them.
- Authoritative repositories, paths, branches, worktrees, commits, PRs, and installed artifacts.
- Root cause and behavioral evidence for important bugs.
- Key files, symbols, hooks, protocols, and design decisions.
- Tests run, exact outcomes, human validation, and remaining gates.
- Known risks, unresolved limitations, safety incidents, and rollback information.
- Superseded approaches labeled as historical, including why they failed.
- Immediate next actions in dependency order.

Use concise English when it makes technical recovery clearer. Otherwise follow the existing note language or the user's preference. Do not translate an established note merely for consistency.

Prefer workspace-relative paths for portable source references. Use absolute paths for local worktree roles, installations, backups, or other machine-specific facts where ambiguity would be dangerous.

## Update at meaningful checkpoints

Update the note after:

- Confirming a root cause or invalidating an earlier diagnosis.
- Changing architecture, ownership boundaries, or implementation strategy.
- Creating, rebasing, publishing, reviewing, merging, closing, or replacing a branch or PR.
- Completing tests, human acceptance, installation, backup, rollback, or release work.
- Discovering a safety incident, compatibility boundary, or repeated failure mode.
- Switching to another substantial workstream or preparing a handoff.

Do not log every command, file read, transient error, or speculative thought. Summarize evidence and consequences.

## Preserve history without preserving confusion

- Update the current snapshot when reality changes.
- Keep useful historical evidence, but mark it `superseded`, `historical`, `obsolete`, or `do not use`.
- Never leave an old path, branch, installed hash, or PR status presented as current after it changes.
- When a mistake caused data loss, downgrade, broken installation, or resource exhaustion, record the prevention rule prominently.
- When two notes have summary/detail roles, update the detailed record first and then refresh the summary.

## Finish with a note audit

Before ending substantial work, check that:

- Current paths, heads, versions, PR states, and next actions are accurate.
- Completed work is not still listed as pending.
- Pending human or CI validation is not claimed as passed.
- No sensitive data entered the note.
- The note remains useful for resuming work rather than becoming a raw transcript.

Do not create commits or publish note changes unless the user requested that repository action or the note is intentionally part of the requested patch.
