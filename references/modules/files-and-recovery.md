# Files and Recovery

Scope: authorized edits, data preservation, and recoverable changes. Related IDs: `FILE-001`, `FILE-002`, `GIT-001`, `GIT-002`, `GIT-003`.

## Why

The user may have uncommitted changes, valuable untracked media, legacy encoding, or accepted behavior that needs a reliable rollback. A clean Git diff is not proof that every relevant asset is recoverable.

## Boundary

Respect the current operation's authorization. A requested code fix does not authorize deleting unrelated assets or rewriting global instructions; an approved exact patch does not need repeated confirmation just because it writes files.

A global instruction-file replacement deserves a visible final diff and backup because it changes later tasks. These adoption safeguards do not impose a questionnaire before ordinary authorized code edits.

## How

1. Inspect affected files, staged/unstaged changes, encoding, and ownership.
2. Verify a checkpoint before accepted behavior, multi-file state/configuration, media, or substantial rework changes. Reuse an adequate checkpoint.
3. Prefer a task-only local commit when policy permits. Do not include unrelated edits even if they share a filename.
4. If a commit is unsuitable, preserve exact relevant state externally. A plain `git diff --binary` omits untracked files and normally staged changes; include the needed comparisons and separately copy required assets.
5. Verify backup contents/hashes and record the base, exact scope, and restoration assumptions.
6. Preserve existing encoding, BOM, line endings, and permissions. Unknown encoding calls for diagnosis or a focused question, not silent conversion.
7. Before rollback, recheck targets and current work. Do not run destructive reset/clean or whole-worktree stash as a shortcut.

Example: a media edit needs both a tracked metadata file and an untracked source image. Back up both; a patch of the metadata alone is not an adequate recovery point. Keep unrelated photos out of the checkpoint.

## Configuration

Checkpoint storage, permitted local commits, and publication authority can be chosen during adoption. A verified local commit does not mean a push was requested. Non-Git work uses exact backups without pretending commits exist.
