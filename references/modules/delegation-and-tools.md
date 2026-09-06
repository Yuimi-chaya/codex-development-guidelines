# Delegation and Tools

Scope: protecting the primary thread without outsourcing judgment. Related IDs: `WRITE-001`, `SUB-001`, `SUB-002`, `SUB-003`, `SUB-005`, `SUB-006`, `SUB-007`, `BROWSER-001`.

## Why

In a tiered setup, the primary model may be more expensive and slower to begin or stream responses than an execution model. Repeated browser observation, clicks, DOM snapshots, and screenshots can occupy that primary thread with low-level interaction. Persistent tool history may also create storage and responsiveness pressure, depending on the harness.

This is a reason to route work deliberately, not a claim that any named model is always faster or cheaper. Delegation adds coordination cost and may not isolate all persisted artifacts. Measure what the harness exposes; do not promise savings from model names alone.

## Boundary

Prefer a supported structured tool, API, or CLI for equivalent work. High-interaction UI work normally goes to an authorized execution role. A simple text lookup is not automatically a browser session, and a simple code edit does not need delegation.

No suitable execution role: choose an allowed structured route, use a previously authorized direct-use fallback, or ask for one specific exception. Respect explicit browser bans. Missing subagents do not create permission to bypass them.

## Delegation contract

Specify objective, permitted reads/actions, exact write scope if any, output size, evidence needed, progress boundary, and stopping condition. A useful browser deliverable is a conclusion, source/page identity, steps that matter, and paths to optimized screenshots, not an entire interaction transcript.

The primary Agent remains responsible for decisions and acceptance even when writes are delegated. Check decisive file locations, source excerpts, test outcomes, or artifact identity. Independent verification should target the claim's risk; it need not replay every click or download every screenshot.

## Stop and take over

Default: at most one directed retry after inadequate delivery. If the premise is wrong or improvement unlikely, take over immediately. Agree on a task-appropriate progress boundary; use bounded waits rather than rapid unchanged polling. Delay alone is not proof of incompetence.

Example: a reviewer claims the failing test is fixed but supplies no relevant diff and discusses another package. Ask once for the exact file and reproduction, or take over immediately if the wrong scope is clear. Do not spend several turns tutoring the same agent or start another agent to continue the same unbounded loop.

## Configuration

Adoption may map actual model/reasoning controls to discovery, browser/media execution, writing, and independent review. Reuse that mapping in future tasks; recheck availability when it matters. Do not invent selectable models, use a costly fallback silently, or assign permanent roles to provider names.
