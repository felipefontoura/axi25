#!/usr/bin/env bash
#
# AXI25 — optional maintenance script (macOS / Linux)
#
# You normally DON'T need this: the vault ships with real skill directories, so
# Obsidian + Claude Code, Codex, OpenCode and Pi all discover skills with zero setup.
# Run this only to REFRESH the .claude/skills copy after editing .agents/skills, or to
# repair a partial download. Safe to run multiple times. Creates NOTHING outside this folder.
#
#   Usage:  bash .bin/install.sh
#
set -euo pipefail

# This script lives in .bin/; the vault root is one level up.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

ok()   { printf '  \033[32m✓\033[0m %s\n' "$*"; }
warn() { printf '  \033[33m!\033[0m %s\n' "$*"; }

echo ""
echo "AXI25 — check & sync"
echo "======================"

# 1. Canonical skills must exist.
if [ ! -d ".agents/skills" ]; then
  warn ".agents/skills is missing — the download looks incomplete. Re-extract the zip."
  exit 1
fi
ok "Canonical skills in .agents/skills ($(find .agents/skills -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ') skills) — read natively by Codex, OpenCode, Pi"

# 2. Sync the Claude Code / Obsidian copy as a REAL directory (no symlinks — Windows-safe).
rm -rf ".claude/skills"
mkdir -p ".claude"
cp -R ".agents/skills" ".claude/skills"
ok ".claude/skills refreshed (real copy) — read by Claude Code + the AXI25 Obsidian plugin"

# 3. Anchor / context files.
[ -f "CLAUDE.md" ] && ok "CLAUDE.md present" || warn "CLAUDE.md missing (AXI25 reads it)"
[ -f "AGENTS.md" ] && ok "AGENTS.md present" || warn "AGENTS.md missing"

# 4. Onboarding state.
if grep -q "ONBOARDING PENDING" 90-system/references/user-profile.md 2>/dev/null; then
  echo ""
  ok "Fresh vault — open it in your agent and say:  onboarding"
fi

echo ""
ok "Done. Lay users: just open the folder in Obsidian (see SETUP.md). Power users: docs/."
echo ""
