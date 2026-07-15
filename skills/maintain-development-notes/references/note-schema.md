# Development Note Schema

Use this schema as a menu, not as mandatory boilerplate. Omit sections that do not affect recovery.

## Recommended order

### 1. Purpose and note responsibility

- State what project or workspace the note covers.
- State whether it is the canonical detailed record, a quick recovery summary, or the only note.
- Point to related notes and define synchronization direction when more than one exists.

### 2. Non-negotiable constraints

Record rules that change execution, for example:

- Protected user files or installations.
- Required backup and rollback behavior.
- Resource limits and test concurrency.
- Network, platform, encoding, security, or publication constraints.
- User preferences that materially affect product behavior or PR wording.

### 3. Authoritative current snapshot

Keep this section near the top and update it in place.

Record as applicable:

| Item | Required facts |
|---|---|
| Workspace/repository | Purpose, absolute local path when needed, upstream/fork URL |
| Worktree/branch | Role, path, branch, HEAD, dirty state, whether safe to install or publish |
| PR/issue | URL/number, scope, head, review state, CI state, next gate |
| Installation | Version, source tree, binary hashes, backup path, human-test state |
| Release | Tag, target commit, assets, checksums, workflow state |
| External dependency | Version/contract relied on, compatibility assumptions |

Clearly label historical or unsafe worktrees. Do not infer authority from the newest timestamp.

### 4. Active workstreams and boundaries

For each active track, record:

- Goal and user impact.
- Scope ownership and explicit exclusions.
- Dependencies on other tracks.
- Current implementation and authoritative files.
- Status: investigating, implementing, tested, human-validated, published, merged, installed, blocked, or superseded.
- Remaining work and publication order.

Use a table when several tracks need comparison.

### 5. Important engineering findings

For each significant finding, record:

- Date using local project time.
- Observable symptom.
- Verified root cause and evidence.
- Chosen fix and why.
- Key files, symbols, hooks, schemas, or protocols.
- Compatibility and safety boundaries.
- Tests and human validation.
- Remaining uncertainty.

Do not paste long logs. Keep only decisive messages or values.

### 6. Test and validation record

Separate these states:

- Static or syntax checks.
- Focused automated tests.
- Broader suite/build/CI results.
- Human behavioral acceptance.
- Production-like installation or release verification.

Record exact counts or command names only when useful. A failed unrelated test must be labeled unrelated rather than silently omitted or misattributed.

### 7. Installation, backup, and rollback

Include only when local or deployed artifacts are modified:

- Source tree and version used to build.
- Files replaced and files intentionally not replaced.
- Backup path and verification method.
- Installed artifact size/hash when identity matters.
- Rollback command or procedure.
- Processes that must be stopped before replacement.
- Human acceptance still required.

### 8. Superseded approaches and incidents

Preserve details that prevent repeated mistakes:

- What was tried.
- Why it failed or became obsolete.
- Whether its branch, directory, artifact, or note remains on disk.
- A direct `do not use`, `do not install`, or `historical only` instruction when needed.
- Prevention rules after downgrade, data loss, package breakage, resource exhaustion, or publication mistakes.

### 9. Immediate next actions

List a short ordered set:

1. Next action and prerequisite.
2. Validation gate.
3. Publication/install/handoff step.

Do not keep completed actions here. Move durable outcomes into the current snapshot or history.

## Minimal template

```markdown
# Project Development Notes

## Note Responsibility

- Scope:
- Authority:
- Related notes:

## Non-Negotiable Constraints

- ...

## Current Snapshot

- Repository/workspace:
- Active branch/worktree:
- Current version/head:
- Published/installed state:
- Main risk:

## Active Workstreams

### Workstream Name

- Goal:
- Scope:
- Status:
- Key files:
- Validation:
- Next gate:

## Known Risks and Boundaries

- ...

## Immediate Next Actions

1. ...

## Engineering History

### YYYY-MM-DD Finding or Milestone

- Symptom:
- Root cause:
- Fix/decision:
- Evidence and validation:
- Remaining risk:
```

## Language and style

- Match an existing note's language.
- English is acceptable and often preferable for dense code identifiers and recovery instructions.
- Keep headings stable and prose concise.
- Use exact paths, commits, versions, and statuses when verified.
- Prefer conclusions and evidence over chronology.
- Never use the note as a raw conversation transcript.
