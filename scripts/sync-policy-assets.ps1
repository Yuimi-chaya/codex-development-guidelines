[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot),
    [switch]$Write
)

$ErrorActionPreference = 'Stop'
$rootPath = (Resolve-Path -LiteralPath $Root).Path
$utf8 = [System.Text.UTF8Encoding]::new($false, $true)
$pairs = @(
    @{ Source = 'reference/AGENTS.md'; Target = 'skills/adopt-agent-policy/assets/runtime-policy.en.md' },
    @{ Source = 'reference/AGENTS.zh-CN.md'; Target = 'skills/adopt-agent-policy/assets/runtime-policy.zh-CN.md' }
)

foreach ($pair in $pairs) {
    $source = [System.IO.File]::ReadAllText((Join-Path $rootPath $pair.Source), $utf8).Replace("`r`n", "`n")
    if ($source -notmatch '(?m)^\d+\. \[[A-Z]+-\d{3}\] ') {
        throw "No tagged rules found in $($pair.Source)"
    }
    # Remove only catalog tags at rule starts; preserve the behavioral text.
    $expected = [regex]::Replace($source, '(?m)^(\d+\. )(?:\[[A-Z]+-\d{3}\] )+', '$1')
    if ($expected -match '\[[A-Z]+-\d{3}\]') {
        throw "Unexpected catalog tag outside a rule prefix in $($pair.Source)"
    }
    $target = Join-Path $rootPath $pair.Target
    if ($Write) {
        New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
        [System.IO.File]::WriteAllText($target, $expected, $utf8)
    }
    elseif (-not (Test-Path -LiteralPath $target -PathType Leaf) -or
        -not [string]::Equals([System.IO.File]::ReadAllText($target, $utf8).Replace("`r`n", "`n"), $expected, [System.StringComparison]::Ordinal)) {
        throw "Out-of-date policy asset: $($pair.Target). Run scripts/sync-policy-assets.ps1 -Write."
    }
}

Write-Host "Policy assets match both source languages without catalog tags."
