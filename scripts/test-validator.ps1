[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$rootPath = (Resolve-Path -LiteralPath $Root).Path
$validator = Join-Path $rootPath 'scripts/validate-repository.ps1'
$tempParent = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$fixture = Join-Path $tempParent ('agent-policy-validator-' + [guid]::NewGuid().ToString('N'))
$utf8 = [System.Text.UTF8Encoding]::new($false, $true)
$script:originals = @{}
$passed = 0

function Get-FixturePath([string]$Relative) {
    $path = [System.IO.Path]::GetFullPath((Join-Path $fixture $Relative))
    $within = [System.IO.Path]::GetRelativePath($fixture, $path)
    if ([System.IO.Path]::IsPathRooted($within) -or $within -match '^\.\.([\\/]|$)') {
        throw "Unsafe fixture path: $Relative"
    }
    return $path
}

function Remember-File([string]$Relative) {
    $path = Get-FixturePath $Relative
    if (-not $script:originals.ContainsKey($path)) {
        $script:originals[$path] = if (Test-Path -LiteralPath $path -PathType Leaf) {
            [System.IO.File]::ReadAllBytes($path)
        } else { $null }
    }
    return $path
}

function Edit-Fixture([string]$Relative, [scriptblock]$Transform) {
    $path = Remember-File $Relative
    $before = [System.IO.File]::ReadAllText($path, $utf8)
    $after = & $Transform $before
    if ([string]::Equals($before, $after, [System.StringComparison]::Ordinal)) {
        throw "Fixture mutation made no change: $Relative"
    }
    [System.IO.File]::WriteAllText($path, $after, $utf8)
}

function Run-Case([string]$Name, [string]$ExpectedCode, [scriptblock]$Mutate) {
    $script:originals = @{}
    try {
        & $Mutate
        $errorMessage = $null
        try { $null = & $validator -Root $fixture -PassThru }
        catch { $errorMessage = $_.Exception.Message }
        if ($ExpectedCode) {
            if (-not $errorMessage -or -not $errorMessage.Contains("[$ExpectedCode]")) {
                throw "$Name expected [$ExpectedCode]; actual: $errorMessage"
            }
        }
        elseif ($errorMessage) { throw "$Name unexpectedly failed: $errorMessage" }
        Write-Host "PASS $Name"
    }
    finally {
        foreach ($path in $script:originals.Keys) {
            $relative = [System.IO.Path]::GetRelativePath($fixture, $path)
            $checked = Get-FixturePath $relative
            if ($null -eq $script:originals[$path]) {
                if (Test-Path -LiteralPath $checked -PathType Leaf) { Remove-Item -LiteralPath $checked }
            }
            else { [System.IO.File]::WriteAllBytes($checked, [byte[]]$script:originals[$path]) }
        }
    }
}

New-Item -ItemType Directory -Path $fixture | Out-Null
try {
    $sourceFiles = @(Get-ChildItem -LiteralPath $rootPath -File -Recurse -Force | Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]'
    })
    foreach ($file in $sourceFiles) {
        $relative = [System.IO.Path]::GetRelativePath($rootPath, $file.FullName)
        $destination = Get-FixturePath $relative
        New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $destination
    }

    $cases = @(
        @{ Name='valid package'; Code=''; Mutate={} },
        @{ Name='LF and CRLF compare equally'; Code=''; Mutate={
            Edit-Fixture 'skills/adopt-agent-policy/SKILL.md' { param($text) $text.Replace("`n", "`r`n") }
        } },
        @{ Name='wording is not frozen'; Code=''; Mutate={
            Edit-Fixture 'reference/AGENTS.md' { param($text) $text.Replace('casual conversation', 'informal conversation').Replace('Casual conversation', 'Informal conversation') }
        } },
        @{ Name='additional cataloged rule is allowed'; Code=''; Mutate={
            foreach ($relative in @('reference/AGENTS.md', 'reference/AGENTS.zh-CN.md')) {
                Edit-Fixture $relative {
                    param($text)
                    $number = [regex]::Matches($text, '(?m)^\d+\. ').Count + 1
                    $text + "`n$number. [EXAMPLE-001] A fixture-only additional rule.`n"
                }
            }
            Edit-Fixture 'references/rule-catalog.md' {
                param($text)
                $numbers = [regex]::Matches($text, '(?m)^\| [A-Z]+-\d{3} \| (?<number>\d+) \|') |
                    ForEach-Object { [int]$_.Groups['number'].Value }
                $number = ($numbers | Measure-Object -Maximum).Maximum + 1
                $text + "`n| EXAMPLE-001 | $number | context-and-memory | active | Test | Additional behavior |`n"
            }
            Edit-Fixture 'references/modules/context-and-memory.md' { param($text) $text + "`nRelated fixture ID: EXAMPLE-001`n" }
        } },
        @{ Name='model selection reference is required'; Code='MISSING_FILE'; Mutate={
            $path = Remember-File 'skills/adopt-agent-policy/references/model-selection.md'
            Remove-Item -LiteralPath $path
        } },
        @{ Name='artifact rule cannot disappear from catalog'; Code='CATALOG_MISSING'; Mutate={
            Edit-Fixture 'references/rule-catalog.md' { param($text) $text -replace '(?m)^\| ARTIFACT-001 [^\n]*\n', '' }
        } },
        @{ Name='artifact bilingual coverage'; Code='REFERENCE_MISSING'; Mutate={
            Edit-Fixture 'reference/AGENTS.zh-CN.md' { param($text) $text.Replace('[ARTIFACT-001]', '') }
        } },
        @{ Name='artifact wording is not frozen'; Code=''; Mutate={
            Edit-Fixture 'reference/AGENTS.md' { param($text) $text.Replace('intended readers and purpose', 'target audience and document purpose') }
        } },
        @{ Name='missing required file'; Code='MISSING_FILE'; Mutate={
            $path = Remember-File 'skills/adopt-agent-policy/references/profile.md'
            Remove-Item -LiteralPath $path
        } },
        @{ Name='duplicate runtime ID'; Code='REFERENCE_DUPLICATE'; Mutate={
            Edit-Fixture 'reference/AGENTS.md' { param($text) $text.Replace('[CORE-001]', '[CORE-001] [CORE-001]') }
        } },
        @{ Name='catalog paragraph mismatch'; Code='RULE_MAPPING'; Mutate={
            Edit-Fixture 'references/rule-catalog.md' { param($text) $text.Replace('| CORE-001 | 1 |', '| CORE-001 | 2 |') }
        } },
        @{ Name='bilingual ID loss'; Code='BILINGUAL_PARITY'; Mutate={
            Edit-Fixture 'reference/AGENTS.zh-CN.md' { param($text) $text.Replace('[MEDIA-001]', '') }
        } },
        @{ Name='known stable ID cannot disappear'; Code='CATALOG_MISSING'; Mutate={
            Edit-Fixture 'references/rule-catalog.md' { param($text) $text -replace '(?m)^\| NOTES-001 [^\n]*\n', '' }
        } },
        @{ Name='deprecated ID cannot be runtime policy'; Code='DEPRECATED_REFERENCE'; Mutate={
            Edit-Fixture 'reference/AGENTS.md' { param($text) $text.Replace('[SUB-006]', '[SUB-006] [SUB-004]') }
        } },
        @{ Name='missing module'; Code='MODULE_MISSING'; Mutate={
            $path = Remember-File 'references/modules/media.md'
            Remove-Item -LiteralPath $path
        } },
        @{ Name='broken local directory link'; Code='LINK_MISSING'; Mutate={
            Edit-Fixture 'README.md' { param($text) $text + "`n[Broken directory](missing-directory/)`n" }
        } },
        @{ Name='Skill cannot link outside installed folder'; Code='SKILL_ESCAPE'; Mutate={
            Edit-Fixture 'skills/adopt-agent-policy/SKILL.md' { param($text) $text + "`n[Outside](../../README.md)`n" }
        } },
        @{ Name='question coverage'; Code='QUESTION_MISSING'; Mutate={
            Edit-Fixture 'skills/adopt-agent-policy/references/interview.md' { param($text) $text.Replace('## SCOPE-01 -', '## SCOPE-99 -') }
        } },
        @{ Name='duplicate question'; Code='QUESTION_DUPLICATE'; Mutate={
            Edit-Fixture 'skills/adopt-agent-policy/references/interview.md' { param($text) $text + "`n## SCOPE-01 - Duplicate`n`n- Requirement: test`n- Ask: test`n" }
        } },
        @{ Name='interview IDs cannot enter runtime'; Code='RUNTIME_INTERVIEW'; Mutate={
            Edit-Fixture 'reference/AGENTS.md' { param($text) $text + "`nAsk SCOPE-01 at startup.`n" }
        } },
        @{ Name='invalid UTF-8'; Code='ENCODING'; Mutate={
            $path = Remember-File 'README.md'
            [System.IO.File]::WriteAllBytes($path, [byte[]]@(0xFF, 0xFE))
        } },
        @{ Name='BOM rejection'; Code='BOM'; Mutate={
            Edit-Fixture 'README.md' { param($text) [string][char]0xFEFF + $text }
        } },
        @{ Name='personal path detection'; Code='PRIVATE_PATH'; Mutate={
            Edit-Fixture 'README.md' { param($text) $text + "`n" + 'C:' + [char]92 + 'Users' + [char]92 + 'private-example' }
        } },
        @{ Name='Skill identity'; Code='SKILL_NAME'; Mutate={
            Edit-Fixture 'skills/adopt-agent-policy/SKILL.md' { param($text) $text.Replace('name: adopt-agent-policy', 'name: wrong-name') }
        } },
        @{ Name='Skill invocation prompt'; Code='SKILL_PROMPT'; Mutate={
            Edit-Fixture 'skills/adopt-agent-policy/agents/openai.yaml' { param($text) $text.Replace('$adopt-agent-policy', '$wrong-name') }
        } }
    )
    foreach ($case in $cases) {
        Run-Case $case.Name $case.Code $case.Mutate
        $passed++
    }

    # Independently inspect a copied Skill with no sibling source checkout.
    $isolated = Join-Path $fixture 'isolated-skills'
    foreach ($name in @('adopt-agent-policy', 'maintain-development-notes')) {
        $destination = Join-Path $isolated $name
        New-Item -ItemType Directory -Path $destination -Force | Out-Null
        Get-ChildItem -LiteralPath (Join-Path $fixture "skills/$name") -Force |
            Copy-Item -Destination $destination -Recurse
        foreach ($file in Get-ChildItem -LiteralPath $destination -Filter '*.md' -File -Recurse) {
            $text = [System.IO.File]::ReadAllText($file.FullName, $utf8)
            foreach ($link in [regex]::Matches($text, '\[[^\]\r\n]*\]\((?<path>[^)\r\n]+)\)')) {
                $href = $link.Groups['path'].Value
                if ($href -match '^(?:[a-zA-Z][a-zA-Z0-9+.-]*:|#|//)') { continue }
                $target = [System.IO.Path]::GetFullPath((Join-Path $file.DirectoryName ($href -split '#', 2)[0]))
                $relative = [System.IO.Path]::GetRelativePath($destination, $target)
                if ($relative -match '^\.\.([\\/]|$)' -or [System.IO.Path]::IsPathRooted($relative) -or
                    -not (Test-Path -LiteralPath $target)) {
                    throw "Isolated Skill link failed: $name $href"
                }
            }
        }
        $passed++
        Write-Host "PASS isolated Skill package: $name"
    }
    Write-Host "Validator regression tests passed ($passed cases). No Skills installed."
}
finally {
    $resolved = (Resolve-Path -LiteralPath $fixture).Path
    $relative = [System.IO.Path]::GetRelativePath($tempParent, $resolved)
    if ([System.IO.Path]::IsPathRooted($relative) -or $relative -match '^\.\.([\\/]|$)' -or
        (Split-Path -Leaf $resolved) -notmatch '^agent-policy-validator-[a-f0-9]{32}$' -or
        (Split-Path -Parent $resolved) -ne $tempParent.TrimEnd('\', '/')) {
        throw "Refusing unsafe fixture cleanup: $resolved"
    }
    Remove-Item -LiteralPath $resolved -Recurse
}
