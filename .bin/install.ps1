# AXI25 - optional maintenance script (Windows / PowerShell)
#
# You normally DON'T need this: the vault ships with real skill directories, so
# Obsidian + Claude Code, Codex, OpenCode and Pi all discover skills with zero setup.
# Run this only to REFRESH the .claude/skills copy after editing .agents/skills, or to
# repair a partial download. Uses only real folders (no symlinks) - fully Windows-safe.
#
#   Usage:  right-click > "Run with PowerShell"   (or)   pwsh .bin/install.ps1
#
$ErrorActionPreference = "Stop"
# This script lives in .bin/; the vault root is one level up.
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

function Ok($m)   { Write-Host "  [ok] $m" -ForegroundColor Green }
function Warn($m) { Write-Host "  [!]  $m" -ForegroundColor Yellow }

Write-Host ""
Write-Host "AXI25 - check & sync"
Write-Host "======================"

# 1. Canonical skills must exist.
if (-not (Test-Path ".agents/skills")) {
  Warn ".agents/skills is missing - the download looks incomplete. Re-extract the zip."
  exit 1
}
$count = (Get-ChildItem ".agents/skills" -Directory).Count
Ok "Canonical skills in .agents/skills ($count skills) - read natively by Codex, OpenCode, Pi"

# 2. Sync the Claude Code / Obsidian copy as a REAL directory (no symlinks/junctions).
if (Test-Path ".claude/skills") { Remove-Item ".claude/skills" -Recurse -Force }
if (-not (Test-Path ".claude")) { New-Item -ItemType Directory -Path ".claude" -Force | Out-Null }
Copy-Item ".agents/skills" ".claude/skills" -Recurse -Force
Ok ".claude/skills refreshed (real copy) - read by Claude Code + the ObsidiBot Obsidian wrapper"

# 3. Context files.
if (Test-Path "CLAUDE.md") { Ok "CLAUDE.md present" } else { Warn "CLAUDE.md missing (ObsidiBot reads it)" }
if (Test-Path "AGENTS.md") { Ok "AGENTS.md present" } else { Warn "AGENTS.md missing" }

# 4. Onboarding state.
if (Select-String -Path "90-system/references/user-profile.md" -Pattern "ONBOARDING PENDING" -Quiet) {
  Write-Host ""
  Ok "Fresh vault - open it in your agent and say:  onboarding"
}

Write-Host ""
Ok "Done. Lay users: just open the folder in Obsidian (see SETUP.md). Power users: docs/."
Write-Host ""
