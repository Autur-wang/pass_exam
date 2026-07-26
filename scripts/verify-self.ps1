#!/usr/bin/env pwsh
# verify-self.ps1 — 一次性跑所有 verify-* 校验脚本
$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path "$PSScriptRoot/..").Path
Set-Location $RepoRoot
$fail = 0
foreach ($s in @('verify-scaffold.ps1','verify-paths.ps1','verify-harness.ps1')) {
    $p = Join-Path $PSScriptRoot $s
    if (-not (Test-Path -LiteralPath $p)) {
        Write-Host ('SKIP: ' + $s + ' not found') -ForegroundColor DarkGray
        continue
    }
    Write-Host ''
    Write-Host ('==== ' + $s + ' ====') -ForegroundColor Cyan
    pwsh -NoProfile -File $p
    if ($LASTEXITCODE -ne 0) { $fail++ }
}
Write-Host ''
if ($fail -gt 0) {
    Write-Host ('FAIL: ' + $fail + ' verifiers failed') -ForegroundColor Red
    exit 1
} else {
    Write-Host 'PASS: all verifiers green' -ForegroundColor Green
}
