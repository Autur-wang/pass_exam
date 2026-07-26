#!/usr/bin/env pwsh
# verify-scaffold.ps1 — Teach scaffold 合规性校验
#
# 规则:每门课程的 <course>/teach/ 必须包含下述文件/子目录才算完整。
#
#   必备文件:
#     MISSION.md  MISSION-FORMAT.md
#     NOTES.md    GLOSSARY.md   GLOSSARY-FORMAT.md
#     RESOURCES.md  RESOURCES-FORMAT.md
#     LEARNING-RECORD-FORMAT.md  SKILL.md
#   必备目录:
#     learning-records/  lessons/  reference/
#
# 退出码: 0=全合规, 1=至少一门课缺项。
#
# 用法:  pwsh -File scripts/verify-scaffold.ps1
#        pwsh -File scripts/verify-scaffold.ps1 -Course operating_systems   # 只校验单课

[CmdletBinding()]
param(
    [string[]]$Course,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'

$RepoRoot = (Resolve-Path "$PSScriptRoot/..").Path

$RequiredFiles = @(
    'MISSION.md', 'MISSION-FORMAT.md',
    'NOTES.md', 'GLOSSARY.md', 'GLOSSARY-FORMAT.md',
    'RESOURCES.md', 'RESOURCES-FORMAT.md',
    'LEARNING-RECORD-FORMAT.md', 'SKILL.md'
)
$RequiredDirs = @('learning-records', 'lessons', 'reference')

# 1. 自动发现课程: 含 teach/ 子目录的一级目录
if (-not $Course) {
    $Course = Get-ChildItem -Path $RepoRoot -Directory -Force |
        Where-Object { Test-Path (Join-Path $_.FullName 'teach') -PathType Container } |
        ForEach-Object { $_.Name }
}

$results = @()

foreach ($c in $Course) {
    $coursePath = Join-Path $RepoRoot $c
    if (-not (Test-Path $coursePath)) {
        $results += [pscustomobject]@{ Course=$c; Status='MISSING_COURSE'; MissingFiles=@(); MissingDirs=@() }
        continue
    }
    $teach = Join-Path $coursePath 'teach'
    if (-not (Test-Path $teach)) {
        $results += [pscustomobject]@{ Course=$c; Status='MISSING_TEACH_DIR'; MissingFiles=@(); MissingDirs=@() }
        continue
    }

    $missingFiles = @()
    foreach ($f in $RequiredFiles) {
        $p = Join-Path $teach $f
        if (-not (Test-Path $p)) { $missingFiles += $f }
    }
    $missingDirs = @()
    foreach ($d in $RequiredDirs) {
        $p = Join-Path $teach $d
        if (-not (Test-Path $p -PathType Container)) { $missingDirs += $d }
    }

    $status = if (-not $missingFiles -and -not $missingDirs) { 'OK' } else { 'INCOMPLETE' }
    $results += [pscustomobject]@{
        Course=$c; Status=$status
        MissingFiles=$missingFiles; MissingDirs=$missingDirs
    }
}

if ($Json) {
    $results | ConvertTo-Json -Depth 3
} else {
    $pass = 0; $fail = 0
    $results | ForEach-Object {
        $line = '{0,-28} {1,-15} missing-files=[{2}] missing-dirs=[{3}]' -f $_.Course,$_.Status, ($_.MissingFiles -join ','), ($_.MissingDirs -join ',')
        if ($_.Status -eq 'OK') { Write-Host $line -ForegroundColor Green; $pass++ } else { Write-Host $line -ForegroundColor Yellow; $fail++ }
    }
    Write-Host ''
    Write-Host 'PASS='$pass' FAIL='$fail
    if ($fail -gt 0) { exit 1 }
}
