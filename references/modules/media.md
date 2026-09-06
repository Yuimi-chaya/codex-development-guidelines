# Media and Payloads

Scope: media leaving local storage for tools, models, or subagents. Related ID: `MEDIA-001`.

## Why

The motivating incident was a 4K video investigation with individual extracted frames larger than ten megabytes. A batch of such frames created a foreseeable transfer burden and risk of an oversized request. This is an example, not a measured universal API limit.

Dimensions alone are not a size budget. Compression, content, format, request wrappers, and transport representation affect actual transfer size. Delegating the upload does not remove network limits or guarantee a smaller stored session.

## Boundary

Retain original media locally. Optimize review copies rather than repeatedly recompressing the only original. The target is sufficient evidence with a small transfer, not unreadable thumbnails.

Some tools return screenshots automatically. Where documented controls exist, request a compact representation; otherwise avoid copying the return into further messages. Never manually echo base64 or claim the Agent can control an unavailable screenshot setting.

## Three different budgets

| Budget | What to inspect | What not to assume |
|---|---|---|
| Model input/context | Relevant image detail, accompanying tool text, repeated history, reported usage where available | File bytes are not a universal token count |
| Network request | Encoded image bytes, individual and batch size, request wrappers and verified limits | A separate agent automatically receives a smaller request |
| Persisted history | Actual harness retention, local/session artifacts, available lifecycle controls | Closing an agent deletes screenshots or shrinks the stored task |

The controls may belong to different layers. Agent instructions can require inspection and constrain manual returns, but cannot guarantee that a tool or host suppresses, compresses, or deletes automatic images. Report unavailable controls honestly. Prefer a lower-output authorized route when it still meets the task; if the remaining transfer is unacceptable or exceeds a known limit, stop for a decision. Do not continue an expensive automatic-output loop merely because it is isolated.

## How

1. Inspect dimensions or duration, individual bytes, and total bytes before transfer.
2. Narrow the time range and select representative frames locally using existing allowed tools.
3. Create small review copies, focused crops, or short clips. Preserve timestamps and a source-to-review mapping. For UI coordinates, retain crop offset and scaling and follow the tool's actual coordinate contract; a review thumbnail is not automatically a valid action coordinate space.
4. Check that text, transparency, colors, or pixel details required by the task survive. Use lossless crops for detail, not automatic lossy conversion.
5. Apply verified tool and user limits with headroom. If unknown, start with one small representative item and disclose uncertainty.
6. On an oversized-payload error, inspect and reduce the payload before retrying. Do not resend the unchanged batch or discard originals.
7. Return paths, timestamps, and conclusions to the primary Agent; verify recipient access and transfer necessary optimized evidence if paths are not shared. Do not claim visual verification based only on an inaccessible path or an executor's summary.

## Configuration

A user can set persistent size, quality, privacy, fidelity, and retention preferences during adoption. Record only retention capabilities actually supported; permission to retain evidence is not permission to delete user history. Unknown numbers do not disable the runtime inspection rule. Do not automatically upload originals because there is no saved media profile, and do not install a new transcoder without the applicable authorization.
