#!/usr/bin/env pwsh
# verify-harness.ps1 — harness 痕迹文件格式合规校验
#
# 检查:
#   1. harness-records/traces/*.md 必须遵守 TRACE_SPEC 格式(头部含 Date / Lane / Topic / Outcome)
#   2. docs/decisions/ADR-*.md 必须含 ADR 标题 / 状态 / 背景章节
#   3. harness-records/friction/*.md 必须含 friction 标签
#   4. docs/HARNESS_BACKLOG.md 每条目必须含 YYYY-MM-DD 日期
#
# 退出码:0=全合规, 1=至少一条不合规。

[CmdletBinding()]
param(
    [switch]$Json
)

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path "$PSScriptRoot/..").Path
$issues = New-Object System.Collections.Generic.List[object]

# 1. traces
$traceDir = Join-Path $RepoRoot 'harness-records\traces'
if (Test-Path -LiteralPath $traceDir) {
    Get-ChildItem -LiteralPath $traceDir -Filter '*.md' -File -ErrorAction SilentlyContinue | ForEach-Object {
        $f = $_
        $content = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $content) { return }
        $missing = @()
        if ($content -notmatch '(?im)^\s*date\s*[:\xff1a]')    { $missing += 'Date' }
        if ($content -notmatch '(?im)^\s*lane\s*[:\xff1a]')    { $missing += 'Lane' }
        if ($content -notmatch '(?im)^\s*topic\s*[:\xff1a]')   { $missing += 'Topic' }
        if ($content -notmatch '(?im)^\s*outcome\s*[:\xff1a]') { $missing += 'Outcome' }
        if ($missing.Count -gt 0) {
            $issues.Add([pscustomobject]@{
                Kind='trace'; File=$f.FullName.Substring($RepoRoot.Length).TrimStart('/','\'); Missing=($missing -join '; ')
            })
        }
    }
}

# 2. ADRs
$decDir = Join-Path $RepoRoot 'docs\decisions'
if (Test-Path -LiteralPath $decDir) {
    Get-ChildItem -LiteralPath $decDir -Filter '*.md' -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'ADR-*' } | ForEach-Object {
        $f = $_
        $content = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $content) { return }
        $missing = @()
        if ($content -notmatch '(?im)^\s*#\s+ADR-')           { $missing += 'ADR title' }
        if ($content -notmatch '(?im)^\s*-\s*\*\*\s*status\s*\*\*?\s*[:\xff1a]') { $missing += 'Status line' }
        if (-not ($content -match '(?im)^\s*##\s*(背景|context|context and problem|context & problem)') -and
            -not ($content -match '(?im)^\s*-\s*\*\*\s*context\s*\*\*?\s*[:\xff1a]')) {
            $missing += 'Context section'
        }
        if ($missing.Count -gt 0) {
            $issues.Add([pscustomobject]@{
                Kind='adr'; File=$f.FullName.Substring($RepoRoot.Length).TrimStart('/','\'); Missing=($missing -join '; ')
            })
        }
    }
}

# 3. friction
$fricDir = Join-Path $RepoRoot 'harness-records\friction'
if (Test-Path -LiteralPath $fricDir) {
    Get-ChildItem -LiteralPath $fricDir -Filter '*.md' -File -ErrorAction SilentlyContinue | ForEach-Object {
        $f = $_
        $content = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $content) { return }
        $missing = @()
        if ($content -notmatch '(?i)\b(friction|摩擦|wrong|broken|fix|patch)\b') { $missing += 'friction indicator' }
        if ($missing.Count -gt 0) {
            $issues.Add([pscustomobject]@{
                Kind='friction'; File=$f.FullName.Substring($RepoRoot.Length).TrimStart('/','\'); Missing=($missing -join '; ')
            })
        }
    }
}

# 4. HARNESS_BACKLOG
$blPath = Join-Path $RepoRoot 'docs\HARNESS_BACKLOG.md'
if (Test-Path -LiteralPath $blPath) {
    $content = Get-Content -LiteralPath $blPath -Raw -ErrorAction SilentlyContinue
    if ($content) {
        if ($content -notmatch '\[2026-\d{2}-\d{2}\]') {
            $issues.Add([pscustomobject]@{
                Kind='backlog'; File='docs/HARNESS_BACKLOG.md'; Missing='no [YYYY-MM-DD] entry'
            })
        }
    }
}

if ($Json) {
    [pscustomobject]@{ IssueCount=$issues.Count; Issues=$issues } | ConvertTo-Json -Depth 4
} else {
    if ($issues.Count -eq 0) {
        Write-Host 'PASS: all harness artifacts conform (traces/decisions/friction/backlog)' -ForegroundColor Green
    } else {
        foreach ($it in $issues) {
            Write-Host ('  X [{0}] {1}: {2}' -f $it.Kind, $it.File, $it.Missing) -ForegroundColor Yellow
        }
        exit 1
    }
}
