# Context and Memory

Scope: environment-aware work and recovery of existing decisions. Related IDs: `CORE-001`, `START-001`, `START-002`, `NOTES-001`.

## Why

Repeated setup questions waste time, while unexamined assumptions can send work to the wrong branch, shell, or installation. The answer is to separate factual preflight from preference collection, not to eliminate preflight or make it an interview.

## Boundary

During adoption, resolve scope and durable preferences once. During coding, read the effective instructions, inspect relevant current state, and apply those choices. A new thread is not a new installation. No instruction file is also not permission to install one.

Read existing project memory before decisions it could influence, even when a small task does not warrant a note update. The notes Skill's write gate is separate from its read gate. A user's stricter per-turn cadence remains valid.

## How

1. Identify scope, current shell, and repository state.
2. Read applicable instructions and the relevant note snapshot; search earlier incidents if the task relates to them.
3. Classify inputs as detected fact, explicit preference, historical evidence, assumption, or proposal.
4. Verify stale state before relying on it. A note saying a PR was open last month is not proof of its current status.
5. Update only durable decisions and verified milestones; label history and unresolved acceptance distinctly.

Example: a new task asks to fix a test in a repository whose rules already specify Chinese responses and conservative builds. Read and apply those instructions, check the branch, then investigate the test. Do not ask the user to select language and resource policy again.

## Configuration

The target may adopt per-turn or event-based refresh, note visibility, and write triggers. Effective choices belong in the adopted instructions. Optional adoption records store provenance; they do not replace runtime instructions or automatically load themselves.
