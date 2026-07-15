[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$rootPath = (Resolve-Path -LiteralPath $Root).Path
$failures = [System.Collections.Generic.List[string]]::new()

$requiredFiles = @(
    'README.md',
    'LICENSE',
    'reference/AGENTS.md',
    'workflows/ADOPT.md',
    'workflows/UPDATE.md',
    'references/interview-schema.md',
    'references/rule-catalog.md',
    'skills/maintain-development-notes/SKILL.md',
    'skills/maintain-development-notes/agents/openai.yaml',
    'skills/maintain-development-notes/references/note-schema.md'
)

foreach ($relativePath in $requiredFiles) {
    $path = Join-Path $rootPath $relativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $failures.Add("Missing required file: $relativePath")
    }
}

$textFiles = Get-ChildItem -LiteralPath $rootPath -Recurse -File | Where-Object {
    $_.FullName -notmatch '[\\/]\.git[\\/]'
}
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)
$windowsUsersPrefix = 'C:' + [char]92 + 'Users' + [char]92
$macUsersPrefix = '/' + 'Users' + '/'

foreach ($file in $textFiles) {
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    try {
        $content = $strictUtf8.GetString($bytes)
    }
    catch {
        $failures.Add("Not valid UTF-8: $($file.FullName.Substring($rootPath.Length + 1))")
        continue
    }

    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        $failures.Add("UTF-8 BOM is not allowed for new repository text: $($file.FullName.Substring($rootPath.Length + 1))")
    }

    if ($content.Contains($windowsUsersPrefix) -or $content.Contains($macUsersPrefix)) {
        $failures.Add("Possible personal absolute path: $($file.FullName.Substring($rootPath.Length + 1))")
    }

    if ($file.Name -ieq 'AGENTS.md' -and $file.Name -cne 'AGENTS.md') {
        $failures.Add("Non-standard AGENTS.md casing: $($file.FullName.Substring($rootPath.Length + 1))")
    }

    if ($file.Extension -eq '.md') {
        $matches = [regex]::Matches($content, '\[[^\]]+\]\((?!https?://|#)([^)#]+\.md)(?:#[^)]+)?\)')
        foreach ($match in $matches) {
            $link = $match.Groups[1].Value -replace '/', [System.IO.Path]::DirectorySeparatorChar
            $target = Join-Path $file.DirectoryName $link
            if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
                $failures.Add("Broken Markdown link in $($file.Name): $($match.Groups[1].Value)")
            }
        }
    }
}

$skillPath = Join-Path $rootPath 'skills/maintain-development-notes/SKILL.md'
if (Test-Path -LiteralPath $skillPath) {
    $skill = [System.IO.File]::ReadAllText($skillPath, $strictUtf8)
    if (-not $skill.StartsWith("---`n")) {
        $failures.Add('Skill frontmatter must start at the first byte.')
    }
    if ($skill -notmatch '(?m)^name: maintain-development-notes$') {
        $failures.Add('Skill name is missing or incorrect.')
    }
    if ($skill -notmatch '(?m)^description: .+$') {
        $failures.Add('Skill description is missing.')
    }
}

$requiredQuestionIds = @(
    'SCOPE-01',
    'PLATFORM-01',
    'SHELL-01',
    'SHELL-02',
    'NETWORK-01',
    'RESOURCE-01',
    'RESOURCE-02',
    'RESOURCE-03',
    'RESOURCE-04',
    'SUBAGENT-01',
    'SUBAGENT-02',
    'SUBAGENT-03',
    'SUBAGENT-04',
    'SUBAGENT-05',
    'SUBAGENT-06',
    'INSTALL-01',
    'ENCODING-01',
    'SAFETY-01',
    'GIT-01',
    'NOTES-01',
    'NOTES-02',
    'COMMUNICATION-01'
)

$interviewPath = Join-Path $rootPath 'references/interview-schema.md'
if (Test-Path -LiteralPath $interviewPath) {
    $interview = [System.IO.File]::ReadAllText($interviewPath, $strictUtf8)
    foreach ($questionId in $requiredQuestionIds) {
        if ($interview -notmatch "(?m)^## $([regex]::Escape($questionId))\b") {
            $failures.Add("Missing interview question: $questionId")
        }
    }
}

$adoptPath = Join-Path $rootPath 'workflows/ADOPT.md'
if (Test-Path -LiteralPath $adoptPath) {
    $adopt = [System.IO.File]::ReadAllText($adoptPath, $strictUtf8)
    foreach ($requiredPhrase in @(
        'Ask exactly one question ID at a time.',
        'Do not use timeouts, defaults, or silence as consent.',
        'Show the final diff and obtain a separate, explicit confirmation.'
    )) {
        if (-not $adopt.Contains($requiredPhrase)) {
            $failures.Add("ADOPT workflow is missing gate: $requiredPhrase")
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Repository validation passed ($($textFiles.Count) text files, $($requiredQuestionIds.Count) interview questions)."
