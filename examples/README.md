# Examples

Files in this directory are concrete, environment-specific examples. They explain how a user's real environment and preferences can produce a runtime policy; they are not portable defaults.

Do not copy an example into a user's `AGENTS.md` without:

1. detecting the current environment and available capabilities;
2. comparing existing user/project instructions semantically;
3. using `adopt-agent-policy` or the adoption workflow when durable configuration is needed;
4. obtaining separate approval for writes, installations, global configuration, and publication.

[`AGENTS.windows-powershell-zh-CN.md`](AGENTS.windows-powershell-zh-CN.md) is a Simplified Chinese Windows/PowerShell profile example. Its concrete shell, network, resource, subagent, and media choices are examples of user-selected configuration, not repository requirements.

The example is intentionally preserved, not rewritten to match the portable baseline. It demonstrates that a user may choose stricter per-turn checks, fixed resource limits, or model routing. Adoption must respect those choices when applicable rather than silently relaxing them.
