# Media and Payloads

Scope: media leaving local storage for tools, models, or subagents. Related ID: `MEDIA-001`.

## Why

The motivating incident was a 4K video investigation with individual extracted frames larger than ten megabytes. A batch of such frames created a foreseeable transfer burden and risk of an oversized request. This is an example, not a measured universal API limit.

Dimensions alone are not a size budget. Compression, content, format, request wrappers, and transport representation affect actual transfer size. Delegating the upload does not remove network limits or guarantee a smaller stored session.

## Boundary

Retain original media locally. Optimize review copies rather than repeatedly recompressing the only original. The target is sufficient evidence with a small transfer, not unreadable thumbnails.

Some tools return screenshots automatically. Where documented controls exist, request a compact representation; otherwise avoid copying the return into further messages. Never manually echo base64 or claim the Agent can control an unavailable screenshot setting.

## How

1. Inspect dimensions or duration, individual bytes, and total bytes before transfer.
2. Narrow the time range and select representative frames locally using existing allowed tools.
3. Create small review copies, focused crops, or short clips. Preserve timestamps and a source-to-review mapping.
4. Check that text, transparency, colors, or pixel details required by the task survive. Use lossless crops for detail, not automatic lossy conversion.
5. Apply verified tool and user limits with headroom. If unknown, start with one small representative item and disclose uncertainty.
6. On an oversized-payload error, inspect and reduce the payload before retrying. Do not resend the unchanged batch or discard originals.
7. Return paths, timestamps, and conclusions to the primary Agent; transfer additional detail only when needed.

## Configuration

A user can set persistent size, quality, privacy, and fidelity preferences during adoption. Unknown numbers do not disable the runtime inspection rule. Do not automatically upload originals because there is no saved media profile, and do not install a new transcoder without the applicable authorization.
