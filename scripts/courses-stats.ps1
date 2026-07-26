#!/usr/bin/env pwsh
# courses-stats.ps1 — 各课程 lessons / learning-records 计数

[CmdletBinding()]
param([switch]$Json)

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path "$PSScriptRoot/..").Path

function Stat-Course {
    param([string]$CourseDir)
    $lessons = 0; $records = 0
    foreach ($l in @('lessons','teach\lessons','teach_副本\lessons','from-zero\lessons','book-course\lessons')) {
        $p = Join-Path $CourseDir $l
        if (Test-Path -LiteralPath $p) {
            $lessons += (Get-ChildItem -LiteralPath $p -File -Recurse -ErrorAction SilentlyContinue |
                         Where-Object { $_.Name -like '*.html' -or $_.Name -like '*.md' } | Measure-Object).Count
        }
    }
    foreach ($r in @('learning-records','teach\learning-records','teach_副本\learning-records')) {
        $p = Join-Path $CourseDir $r
        if (Test-Path -LiteralPath $p) {
            $records += (Get-ChildItem -LiteralPath $p -Filter '*.md' -File -ErrorAction SilentlyContinue | Measure-Object).Count
        }
    }
    return [pscustomobject]@{ Course=$CourseDir; Lessons=$lessons; Records=$records }
}

$rows = @()
foreach ($name in @('面试\技术面试手册','面试\编程面试大全','面试\面向对象面试问答','面试\工程领导力资源',
                    'operating_systems','advanced_oop','learn-code','数据结构与算法','agent开发',
                    '多媒体','skill开发')) {
    $p = Join-Path $RepoRoot $name
    if (Test-Path -LiteralPath $p) {
        $rows += Stat-Course $p
    }
}

if ($Json) {
    $rows | ConvertTo-Json -Depth 3
} else {
    $rows | ForEach-Object { Write-Host ('{0,-32}  lessons={1,-5}  records={2}' -f $_.Course, $_.Lessons, $_.Records) }
}
