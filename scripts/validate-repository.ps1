[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot),
    [switch]$PassThru
)

$ErrorActionPreference = 'Stop'
$rootPath = (Resolve-Path -LiteralPath $Root).Path
$failures = [System.Collections.Generic.List[string]]::new()
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)
$texts = @{}

function Add-Failure([string]$Code, [string]$Message) {
    $failures.Add("[$Code] $Message")
}

function Test-Within([string]$Parent, [string]$Target) {
    $relative = [System.IO.Path]::GetRelativePath($Parent, $Target)
    return -not ([System.IO.Path]::IsPathRooted($relative) -or $relative -match '^\.\.([\\/]|$)')
}

$requiredFiles = @(
    'README.md', 'README.zh-CN.md', 'LICENSE', 'CHANGELOG.md',
    'examples/README.md', 'examples/AGENTS.windows-powershell-zh-CN.md',
    'reference/AGENTS.md', 'reference/AGENTS.zh-CN.md',
    'references/rule-catalog.md', 'references/interview-schema.md',
    'workflows/ADOPT.md', 'workflows/UPDATE.md', 'tests/policy-scenarios.md',
    'scripts/validate-repository.ps1', 'scripts/test-validator.ps1'
)
$skillNames = @('adopt-agent-policy', 'maintain-development-notes')
foreach ($name in $skillNames) {
    $requiredFiles += "skills/$name/SKILL.md", "skills/$name/agents/openai.yaml"
}
foreach ($name in @('adoption', 'update', 'interview', 'profile', 'model-selection')) {
    $requiredFiles += "skills/adopt-agent-policy/references/$name.md"
}
$requiredFiles += 'skills/maintain-development-notes/references/note-schema.md'
foreach ($relative in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $rootPath $relative) -PathType Leaf)) {
        Add-Failure 'MISSING_FILE' $relative
    }
}

$textExtensions = @('.md', '.ps1', '.yaml', '.yml', '.json', '.txt')
$files = @(Get-ChildItem -LiteralPath $rootPath -Recurse -File -Force | Where-Object {
    $_.FullName -notmatch '[\\/]\.git[\\/]' -and
    ($_.Extension -in $textExtensions -or $_.Name -in @('LICENSE', '.gitattributes', '.gitignore'))
})
foreach ($file in $files) {
    $relative = [System.IO.Path]::GetRelativePath($rootPath, $file.FullName).Replace('\', '/')
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    try { $content = $strictUtf8.GetString($bytes) }
    catch {
        Add-Failure 'ENCODING' "$relative is not valid UTF-8"
        continue
    }
    if ($content.Length -gt 0 -and $content[0] -eq [char]0xFEFF) {
        Add-Failure 'BOM' "$relative has a UTF-8 BOM"
    }
    # Normalize only the in-memory comparison, never the source or backup bytes.
    $texts[$relative] = $content.Replace("`r`n", "`n")
    $privatePrefixes = @(
        ('C:' + [char]92 + 'Users' + [char]92),
        ('/' + 'Users' + '/'),
        ('/' + 'home' + '/')
    )
    foreach ($prefix in $privatePrefixes) {
        if ($content.Contains($prefix)) { Add-Failure 'PRIVATE_PATH' "$relative contains a personal path prefix" }
    }
    if ($file.Name -ieq 'AGENTS.md' -and $file.Name -cne 'AGENTS.md') {
        Add-Failure 'CASING' "$relative has nonstandard instruction-file casing"
    }
    if ($file.Extension -ne '.md') { continue }
    foreach ($link in [regex]::Matches($content, '\[[^\]\r\n]*\]\((?<path>[^)\r\n]+)\)')) {
        $href = $link.Groups['path'].Value.Trim()
        if ($href -match '^(?:[a-zA-Z][a-zA-Z0-9+.-]*:|#|//)') { continue }
        $localPath = [uri]::UnescapeDataString(($href -split '#', 2)[0])
        if (-not $localPath) { continue }
        $target = [System.IO.Path]::GetFullPath((Join-Path $file.DirectoryName $localPath))
        if (-not (Test-Within $rootPath $target)) {
            Add-Failure 'LINK_ESCAPE' "$relative -> $href"
        }
        elseif (-not (Test-Path -LiteralPath $target)) {
            Add-Failure 'LINK_MISSING' "$relative -> $href"
        }
        if ($relative -match '^skills/([^/]+)/') {
            $skillRoot = Join-Path $rootPath "skills/$($Matches[1])"
            if (-not (Test-Within $skillRoot $target)) {
                Add-Failure 'SKILL_ESCAPE' "$relative has an install-breaking reference: $href"
            }
        }
    }
}

# The catalog is a deliberately simple Markdown table with a fixed column schema.
$catalogRows = @{}
$catalog = $texts['references/rule-catalog.md']
foreach ($match in [regex]::Matches([string]$catalog, '(?m)^\| (?<id>[A-Z]+-\d{3}) \| (?<rule>\d+|-) \| (?<module>[a-z-]+) \| (?<status>active|deprecated) \| (?<trigger>[^|\n]+) \| (?<behavior>[^|\n]+) \|$')) {
    $id = $match.Groups['id'].Value
    if ($catalogRows.ContainsKey($id)) { Add-Failure 'CATALOG_DUPLICATE' $id }
    $catalogRows[$id] = @{
        Rule = $match.Groups['rule'].Value
        Module = $match.Groups['module'].Value
        Status = $match.Groups['status'].Value
    }
}
$knownIds = @(
    'CORE-001', 'START-001', 'START-002', 'NOTES-001', 'WRITE-001',
    'SUB-001', 'SUB-002', 'SUB-003', 'SUB-004', 'SUB-005', 'SUB-006', 'SUB-007',
    'BROWSER-001', 'MEDIA-001', 'ENV-001', 'SHELL-001', 'SHELL-002',
    'FRICTION-001', 'NET-001', 'FILE-001', 'FILE-002',
    'GIT-001', 'GIT-002', 'GIT-003', 'RES-001', 'RES-002', 'VERIFY-001', 'COMM-001',
    'ARTIFACT-001'
)
foreach ($id in $knownIds) {
    if (-not $catalogRows.ContainsKey($id)) { Add-Failure 'CATALOG_MISSING' $id }
}
foreach ($id in $catalogRows.Keys) {
    $row = $catalogRows[$id]
    if ($row.Status -eq 'deprecated' -and $row.Rule -ne '-') { Add-Failure 'DEPRECATED_RULE' $id }
    $modulePath = "references/modules/$($row.Module).md"
    if (-not $texts.ContainsKey($modulePath)) { Add-Failure 'MODULE_MISSING' $modulePath }
    elseif ($row.Status -eq 'active' -and $texts[$modulePath] -notmatch [regex]::Escape($id)) {
        Add-Failure 'MODULE_COVERAGE' "$modulePath does not identify $id"
    }
}
if ($catalogRows.ContainsKey('SUB-004') -and $catalogRows['SUB-004'].Status -ne 'deprecated') {
    Add-Failure 'DEPRECATED_RULE' 'SUB-004 must remain deprecated'
}
foreach ($id in $knownIds | Where-Object { $_ -ne 'SUB-004' }) {
    if ($catalogRows.ContainsKey($id) -and $catalogRows[$id].Status -ne 'active') {
        Add-Failure 'ACTIVE_RULE' "$id was unexpectedly retired"
    }
}

$referenceMaps = @{}
$referenceSequences = @{}
foreach ($relative in @('reference/AGENTS.md', 'reference/AGENTS.zh-CN.md')) {
    $reference = [string]$texts[$relative]
    $map = @{}
    $sequence = [System.Collections.Generic.List[string]]::new()
    $paragraphs = [regex]::Matches($reference, '(?m)^(?<number>\d+)\. (?<body>.+)$')
    $expectedNumber = 1
    foreach ($paragraph in $paragraphs) {
        $number = [int]$paragraph.Groups['number'].Value
        if ($number -ne $expectedNumber) { Add-Failure 'NUMBERING' "$relative expected $expectedNumber, got $number" }
        $expectedNumber++
        $ids = [regex]::Matches($paragraph.Groups['body'].Value, '\[(?<id>[A-Z]+-\d{3})\]')
        if ($ids.Count -eq 0) { Add-Failure 'RULE_WITHOUT_ID' "$relative paragraph $number" }
        foreach ($idMatch in $ids) {
            $id = $idMatch.Groups['id'].Value
            if ($map.ContainsKey($id)) { Add-Failure 'REFERENCE_DUPLICATE' "$relative $id" }
            $map[$id] = $number
            $sequence.Add($id)
            if (-not $catalogRows.ContainsKey($id)) { Add-Failure 'UNCATALOGED_ID' "$relative $id" }
            elseif ($catalogRows[$id].Status -ne 'active') { Add-Failure 'DEPRECATED_REFERENCE' "$relative $id" }
            elseif ($catalogRows[$id].Rule -ne [string]$number) { Add-Failure 'RULE_MAPPING' "$relative $id is not in the catalog paragraph" }
        }
    }
    foreach ($id in $catalogRows.Keys) {
        if ($catalogRows[$id].Status -eq 'active' -and -not $map.ContainsKey($id)) {
            Add-Failure 'REFERENCE_MISSING' "$relative $id"
        }
    }
    if ($reference -match '(?i)\b(?:luna|terra|sol)\b|Cargo.*-j\s*2') {
        Add-Failure 'LOCAL_DEFAULT' "$relative contains maintainer-specific defaults"
    }
    if ($reference -match '\b[A-Z]+-\d{2}\b|\$adopt-agent-policy|interview\.md') {
        Add-Failure 'RUNTIME_INTERVIEW' "$relative embeds interview execution details"
    }
    $referenceMaps[$relative] = $map
    $referenceSequences[$relative] = $sequence -join '|'
}
if ($referenceSequences['reference/AGENTS.md'] -ne $referenceSequences['reference/AGENTS.zh-CN.md']) {
    Add-Failure 'BILINGUAL_PARITY' 'Active IDs must appear in the same order in both reference languages'
}

$questionIds = @(
    'SCOPE-01', 'LANGUAGE-01', 'WORKFLOW-01', 'SHELL-01', 'SHELL-02', 'NETWORK-01',
    'RESOURCE-01', 'RESOURCE-02', 'RESOURCE-03', 'RESOURCE-04',
    'SUBAGENT-01', 'SUBAGENT-02', 'SUBAGENT-03', 'SUBAGENT-04', 'SUBAGENT-05',
    'SUBAGENT-06', 'SUBAGENT-07', 'SUBAGENT-08', 'SUBAGENT-09',
    'INSTALL-01', 'ENCODING-01', 'SAFETY-01', 'GIT-01', 'GIT-02', 'GIT-03', 'GIT-04',
    'NOTES-01', 'NOTES-02', 'NOTES-03', 'MEDIA-01', 'COMMUNICATION-01'
)
$interview = [string]$texts['skills/adopt-agent-policy/references/interview.md']
$questions = @{}
foreach ($section in [regex]::Matches($interview, '(?ms)^## (?<id>[A-Z]+-\d{2}) - [^\n]+\n(?<body>.*?)(?=^## |\z)')) {
    $id = $section.Groups['id'].Value
    if ($questions.ContainsKey($id)) { Add-Failure 'QUESTION_DUPLICATE' $id }
    $questions[$id] = $true
    if ($section.Groups['body'].Value -notmatch '(?m)^- Requirement: .+' -or
        $section.Groups['body'].Value -notmatch '(?m)^- Ask: .+') {
        Add-Failure 'QUESTION_SHAPE' "$id needs applicability and a decision prompt"
    }
}
foreach ($id in $questionIds) {
    if (-not $questions.ContainsKey($id)) { Add-Failure 'QUESTION_MISSING' $id }
}
if ($questions.ContainsKey('PLATFORM-01')) { Add-Failure 'FACT_INTERVIEW' 'Detect platform instead of asking for confirmation' }

# Check the simple scalar metadata used by this package, not arbitrary YAML syntax.
foreach ($name in $skillNames) {
    $skill = [string]$texts["skills/$name/SKILL.md"]
    $front = [regex]::Match($skill, '\A---\n(?<body>.*?)\n---(?:\n|\z)', 'Singleline')
    if (-not $front.Success) { Add-Failure 'SKILL_FRONTMATTER' $name }
    elseif ($front.Groups['body'].Value -notmatch "(?m)^name: $([regex]::Escape($name))$") {
        Add-Failure 'SKILL_NAME' $name
    }
    $description = [regex]::Match($front.Groups['body'].Value, '(?m)^description: (?<value>.+)$')
    if (-not $description.Success -or $description.Groups['value'].Length -gt 1024) {
        Add-Failure 'SKILL_DESCRIPTION' $name
    }
    $ui = [string]$texts["skills/$name/agents/openai.yaml"]
    foreach ($field in @('display_name', 'short_description', 'default_prompt')) {
        $value = [regex]::Match($ui, "(?m)^  ${field}: `"(?<value>[^`"\n]+)`"$").Groups['value'].Value
        if (-not $value) { Add-Failure 'SKILL_UI' "$name $field" }
        if ($field -eq 'short_description' -and ($value.Length -lt 25 -or $value.Length -gt 64)) {
            Add-Failure 'SKILL_UI_LENGTH' $name
        }
        if ($field -eq 'default_prompt' -and -not $value.Contains('$' + $name)) {
            Add-Failure 'SKILL_PROMPT' "$name must be named in its prompt"
        }
    }
    if ($ui -notmatch '(?m)^  allow_implicit_invocation: (true|false)$') { Add-Failure 'SKILL_POLICY' $name }
}

if ($failures.Count -gt 0) {
    throw "Repository validation failed ($($failures.Count) issues):`n$($failures -join "`n")"
}
$result = [pscustomobject]@{
    TextFiles = $files.Count
    ActiveRules = $referenceMaps['reference/AGENTS.md'].Count
    Questions = $questions.Count
    Skills = $skillNames.Count
}
if ($PassThru) { $result }
else { Write-Host "Repository validation passed ($($result.TextFiles) text files, $($result.ActiveRules) active IDs, $($result.Questions) question topics, $($result.Skills) Skills)." }
