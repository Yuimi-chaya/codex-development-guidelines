# Validation, Resources, and Communication

Scope: proportional verification, useful process lifecycles, and honest close-out. Related IDs: `RES-001`, `RES-002`, `VERIFY-001`, `COMM-001`.

## Why

Builds, tests, installations, indexers, browsers, and agents consume different shared resources. More parallel work can reduce responsiveness instead of saving time. Meanwhile, a passing syntax check may say little about the behavior the user wanted.

## Boundary

Resource policy comes from the user's environment and preferences, not fixed tool flags from an unrelated machine. Do not force a worker flag onto a tool that does not support it.

The rule to verify process exit applies to finite commands. A useful authorized dev server may stay running; report its identity or URL and lifecycle. Do not terminate an unknown or user-owned process to make a port available.

## How

1. Use known limits, or start heavy work conservatively without simultaneous heavy commands.
2. Announce work that affects the machine. Track processes started for this task and verify completion or justified continued use.
3. When the user reports lag, stop starting heavy work and safely reduce task-owned load first.
4. Choose checks that address the changed behavior and its blast radius. Inspect decisive evidence from delegated work.
5. Report implemented, statically checked, behaviorally tested, human-accepted, installed, and published as separate states.
6. Keep summaries short but actionable. Include skipped checks, remaining risks, recovery state, and pending decisions where relevant.

Example: a validator confirms that bilingual policy files contain matching IDs. This supports structural parity, not semantic equivalence or proof that an independent Agent followed the policy. Record a scenario walkthrough separately and do not present it as a live forward test.

## Configuration

Response language, detail, background-process permission, and build concurrency belong in the approved effective instructions. A new task can reuse them without asking again. If a specific job needs more resources than authorized, explain the tradeoff and seek only that change.
