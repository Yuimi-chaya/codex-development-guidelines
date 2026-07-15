---
name: maintain-development-notes
description: Create and maintain durable development notes for context recovery. Use automatically when a workspace or thread has multiple active features, branches, worktrees, PRs, repositories, risky local installations, repeated task switching, long-running investigations, or state that must survive compaction and handoff; also use when an existing development note needs synchronization. Do not use for ordinary chat, one-off questions, simple single-task or single-file changes, or short read-only exploration with no continuing project state.
---

# Maintain Development Notes

Preserve verified project reality so a future agent can resume without repeating investigations, confusing branches, or losing safety constraints.

## Apply the complexity gate

Assess the gate silently before creating a note.

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

Do not create a note for:

- Casual conversation or general advice.
- A one-off question with no continuing implementation state.
- A small, self-contained change with one clear branch and no expected follow-up.
- Short read-only exploration that produces no durable decision or risk.
- Routine command output that is already captured adequately by source control or CI.

If the gate is not met, continue the task without mentioning development notes.

## Discover before creating

1. Search the workspace for existing files such as `DEVELOPMENT_NOTES.md`, `DEV_NOTES.md`, `CODEX_DEV_NOTES.md`, `HANDOFF.md`, or a clearly equivalent project record.
2. Read applicable `AGENTS.md` instructions and the current snapshot sections of existing notes.
3. Reuse the authoritative note. Do not create a competing note merely because its filename differs from the preferred name.
4. If multiple notes exist, identify their responsibilities. Synchronize them only when their documented roles require it.
5. If authority is ambiguous or notes contradict each other, verify reality before editing. Ask the user only when repository evidence cannot resolve ownership safely.

## Choose the note topology

- For one growing repository, use one root-level `DEVELOPMENT_NOTES.md` unless the repository already has an established equivalent.
- For a large multi-repository or multi-product workspace, use a short workspace recovery summary plus one canonical detailed engineering note only when both roles provide real value.
- Define the responsibility of every note near its top. Avoid maintaining two independent copies of the same history.
- Keep user-facing documentation separate from private agent recovery notes unless the user explicitly wants a public document.

Read [references/note-schema.md](references/note-schema.md) before creating a new note or substantially restructuring an existing one.

## Verify reality before writing

Treat conversation history as a lead, not as authoritative state.

- Verify relevant repository path, branch, HEAD, dirty state, remotes, and worktree role.
- Verify PR, issue, CI, release, installation, version, backup, or hash state when it matters and tools permit.
- Distinguish `implemented`, `tested`, `human-validated`, `published`, `merged`, `installed`, `pending`, and `superseded`.
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
