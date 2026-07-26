#!/usr/bin/env pwsh
# verify-paths.ps1 — markdown / powerShell 中相对路径引用合规性
#
# 扫描两类引用:
#   1. markdown link 形式(含可选 <>): [text](relative/path)  /  [text](<...>)
#   2. 反引号包路径(末尾 .md/.html/.json/.ya?ml/.toml/.png/.jpe?g/.gif/.svg/.pdf/.txt/.ps1/.sh)
#
# 排除: 网络协议 / 锚点 / 绝对盘符 / / 开头 /
#   只读外部材料(textbook reference skills 个人情况与简历 原始资料 .superpowers docs/superpowers
#                 xv6-riscv-20230207 egos-2000 book-to-skill ExamPass-Assistant Agent原始资料
#                 tasks/ 个人情况与简历/playwright-mcp)
#   第三方上游镜像(面试/技术面试手册/* 面试/编程面试大全/* 保留 teach/)
#   模板化引用(顶层规则/项目地图类文档 + ADR 中 "teach/MISSION.md" 形式)
#   glob 模式 / 占位符 NNNN-... YYYY-MM-DD ... ch0X / chapterN / ...

[CmdletBinding()]
param(
    [string]$Root,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path "$PSScriptRoot/..").Path
$ScanRoot = if ($Root) { Join-Path $RepoRoot $Root } else { $RepoRoot }

$pathExts = '\.(md|markdown|html|json|ya?ml|toml|png|jpe?g|gif|svg|pdf|txt|ps1|sh)$'
$linkRe = [regex]'(?<!\!)\[[^\]]+\]\(<?([^)>]+?)>?\)'
$tickRe = [regex]'(?<!`)`([^`\r\n]+?)`(?!`)'

$topRuleFiles = @('AGENTS.md','CLAUDE.md','CONTRIBUTING.md','SOUL.md','RULES.md',
                   'FILETREE.md','README.md','map.md','WORKING-CONTEXT.md',
                   'docs/HARNESS.md','docs/CONTEXT_RULES.md','docs/FEATURE_INTAKE.md',
                   'docs/HARNESS_BACKLOG.md','docs/TRACE_SPEC.md','docs/COURSES.md',
                   'CHANGELOG.md')
function Test-TopRuleFile {
    param([string]$FullPath)
    $rel = $FullPath.Substring($RepoRoot.Length).TrimStart([char]'/','\').Replace('\','/')
    if ($topRuleFiles -contains $rel) { return $true }
    if ($rel -match '^docs/decisions/') { return $true }
    return $false
}

function Test-IsPathCandidate {
    param([string]$p)
    if ([string]::IsNullOrWhiteSpace($p)) { return $false }
    if ($p -match '^(https?:|mailto:|ftp:|file:|#)') { return $false }
    if ($p.StartsWith('#')) { return $false }
    if ($p -match '^[A-Za-z]:[\\/]') { return $false }
    if ($p.StartsWith('/')) { return $false }
    return $true
}

function Resolve-Ref {
    param([string]$SourceFile,[string]$RefPath)
    $clean = $RefPath.Split('#')[0].Split('?')[0]
    if ([string]::IsNullOrWhiteSpace($clean)) { return $null }
    $srcDir = Split-Path -Parent $SourceFile
    $abs = if ([System.IO.Path]::IsPathRooted($clean)) { $clean } else { Join-Path $srcDir $clean }
    try { $abs = [System.IO.Path]::GetFullPath($abs) } catch { return [pscustomobject]@{AbsPath=$abs; Exists=$false} }
    return [pscustomobject]@{ AbsPath=$abs; Exists=(Test-Path -LiteralPath $abs) }
}

function Get-FilesLiteralSafe {
    param([string]$Path)
    try {
        return [System.IO.Directory]::EnumerateFiles($Path, '*', [System.IO.SearchOption]::AllDirectories) |
            ForEach-Object { Get-Item -LiteralPath $_ }
    } catch {
        Write-Warning "scan failed at $Path : $_"
        return @()
    }
}

$files = Get-FilesLiteralSafe -Path $ScanRoot | Where-Object {
    $n = $_.Name
    ($n -like '*.md' -or $n -like '*.ps1')
} | Where-Object {
    $p = $_.FullName
    if ($p -match '[\\/]textbook[\\/]')    { return $false }
    if ($p -match '[\\/]reference[\\/]')   { return $false }
    if ($p -match '[\\/]skills[\\/]')      { return $false }
    if ($p -match '[\\/]\.git[\\/]')       { return $false }
    if ($p -match '[\\/]xv6-riscv-20230207[\\/]') { return $false }
    if ($p -match '[\\/]egos-2000[\\/]')   { return $false }
    if ($p -match '[\\/]book-to-skill[\\/]')      { return $false }
    if ($p -match '[\\/]ExamPass-Assistant[\\/]') { return $false }
    if ($p -match '[\\/]个人情况与简历[\\/]')     { return $false }
    if ($p -match '\\.playwright-mcp[\\/]')        { return $false }
    if ($p -match '[\\/]\.superpowers[\\/]')      { return $false }
    if ($p -match '[\\/]docs[\\/]superpowers[\\/]') { return $false }
    if ($p -match '[\\/]原始资料[\\/]')   { return $false }
    if ($p -match '[\\/]tasks[\\/]')      { return $false }
    if ($p -match '面试[\\/]技术面试手册[\\/]') {
        if ($p -notmatch '面试[\\/]技术面试手册[\\/]teach[\\/]') { return $false }
    }
    if ($p -match '面试[\\/]编程面试大全[\\/]') {
        if ($p -notmatch '面试[\\/]编程面试大全[\\/]teach[\\/]') { return $false }
    }
    return $true
}

function Test-IsTemplateRef {
    param([string]$Ref)
    if ($Ref -match '/N{2,}[-_]')        { return $true }
    if ($Ref -match '\bNNNN\b')          { return $true }
    if ($Ref -match '\bYYYY-[Mm]')       { return $true }
    if ($Ref -match '\bYYYY-MM-DD')      { return $true }
    if ($Ref -match '\.{3}')             { return $true }
    if ($Ref -match '/ch0?X')            { return $true }
    if ($Ref -match '/chapterN/')        { return $true }
    if ($Ref -match 'chapter[0-9A-Z]') { return $true }    # chapterN 或 chapterN/README.md
    if ($Ref -match '/chapter[0-9A-Z]')       { return $true }    # chapterN 变体
    return $false
}

function Test-IsCommandPrefix {
    param([string]$Ref)
    if ($Ref -match '^(pwsh|ls|cat|cd|rm|cp|mv|open|rg|grep|find|tree|mkdir|echo|sort|head|tail|touch|chmod|curl|wget|Start-Process)\s+') {
        return $true
    }
    if ($Ref -match '^relative/path`?$') { return $true }
    return $false
}

$entries = New-Object System.Collections.Generic.List[object]

foreach ($file in $files) {
    $relSrc = $file.FullName.Substring($RepoRoot.Length).TrimStart([char]'/','\')
    $isTopRule = Test-TopRuleFile $file.FullName
    $content = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $content) { continue }

    foreach ($m in $linkRe.Matches($content)) {
        $ref = $m.Groups[1].Value
        if (-not (Test-IsPathCandidate $ref)) { continue }
        if ($ref -match '[\*\[\]\?]') { continue }
        if (Test-IsTemplateRef $ref) { continue }
        if (Test-IsCommandPrefix $ref) { continue }
        if ($isTopRule -and $ref -match '^teach[\\/]') { continue }
        $r = Resolve-Ref -SourceFile $file.FullName -RefPath $ref
        if ($null -eq $r) { continue }
        $entries.Add([pscustomobject]@{ Kind='md-link'; SourceFile=$relSrc; RefPath=$ref; AbsPath=$r.AbsPath; Exists=$r.Exists })
    }

    foreach ($m in $tickRe.Matches($content)) {
        $ref = $m.Groups[1].Value.Trim()
        if (-not (Test-IsPathCandidate $ref)) { continue }
        if ($ref -notmatch '[\\/]')        { continue }
        if ($ref -notmatch $pathExts)      { continue }
        if ($ref -match '[<>]')            { continue }
        if ($ref -match '[\*\[\]\?]')      { continue }
        if (Test-IsTemplateRef $ref) { continue }
        if (Test-IsCommandPrefix $ref) { continue }
        if ($isTopRule -and $ref -match '^teach[\\/]') { continue }
        $r = Resolve-Ref -SourceFile $file.FullName -RefPath $ref
        if ($null -eq $r) { continue }
        $entries.Add([pscustomobject]@{ Kind='backtick'; SourceFile=$relSrc; RefPath=$ref; AbsPath=$r.AbsPath; Exists=$r.Exists })
    }
}

$missing = $entries | Where-Object { -not $_.Exists }

if ($Json) {
    [pscustomobject]@{ TotalRefs=$entries.Count; Missing=$missing.Count; Results=$entries } | ConvertTo-Json -Depth 4
} else {
    $total = $entries.Count
    $miss  = $missing.Count
    Write-Host ('Scanned=' + $total + '  Missing=' + $miss)
    if ($missing.Count -gt 0) {
        $missing | Sort-Object SourceFile,RefPath | ForEach-Object {
            $line = '  X ' + $_.SourceFile + ': `' + $_.RefPath + '`'
            Write-Host $line -ForegroundColor Yellow
        }
        exit 1
    }
    Write-Host ('PASS: ' + $total + ' ref paths all exist') -ForegroundColor Green
}

