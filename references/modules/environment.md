# Environment and Resistance

Scope: platform-aware execution and recognizing when a better method is needed. Related IDs: `ENV-001`, `SHELL-001`, `SHELL-002`, `FRICTION-001`, `NET-001`.

## Why

A failing command may reveal wrong shell syntax, missing dependencies, an unsupported interface, network constraints, or a permission boundary. Repeating it or changing random flags can consume more time than explaining a better approach.

## Boundary

Adapting to the environment does not mean forcing every machine into the maintainer's setup. Do not install a preferred tool simply because it is familiar. Prefer already available supported tools and project conventions.

Distinguish switching to an equivalent already installed command from installing packages, changing a default shell, or altering global proxies. The latter need the applicable authority. A user requiring a specific method limits alternatives; it does not grant new permissions.

## How

1. Identify the failure category and whether the command might already have caused a side effect.
2. Fix a verified typo or use an equivalent authorized tool without reopening the whole setup interview.
3. Retry a transient failure only when justified, bounded, and safe against duplicated effects.
4. When there is clear resistance, pause that path and explain a concrete alternative: source/version if known, scope, cost, risk, and recovery.
5. Ask a focused question only for the new decision. Do not mutate the environment while waiting.

Example: extracting frames with the current tool cannot preserve the required timestamps. State that limitation, identify an already installed alternative if possible, or propose a scoped installation with its provenance. Do not repeatedly feed the unsupported option to the same binary.

Example decision request: "The installed tool lacks the required feature. May I install the identified version project-locally? It adds these files, leaves global settings unchanged, and can be removed independently."

## Configuration

Adoption can establish command-scoped mirror policy, preferred shell, permitted install scopes, and resource preferences. Current-session discovery is not evidence of a permanent preference. Missing version/source information should be labeled unknown, not filled with guesses.
