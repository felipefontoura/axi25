#!/usr/bin/env bash
#
# Build the distributable AXI25 zip that buyers download.
# Produces a clean archive: no git, no node_modules, no internal/dev files.
#
#   Usage:  bash .ci/build-dist.sh [version]     # e.g. bash .ci/build-dist.sh 1.0.0
#
set -euo pipefail
# This script lives in .ci/; the vault root is one level up.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

VERSION="${1:-$(node -e "process.stdout.write(require('./package.json').version)" 2>/dev/null || echo 1.0.0)}"
OUT="dist/axi25-${VERSION}.zip"
mkdir -p dist

# Refresh the Claude Code skills copy so the zip is consistent.
rm -rf .claude/skills && cp -R .agents/skills .claude/skills

# Files/dirs that must NOT reach the buyer.
EXCLUDES=(
  ".git/*" ".github/*" ".ci/*" "dist/*" "node_modules/*"
  "AUDIT.md"                      # internal audit (mentions the origin vault)
  ".gitignore" ".gitattributes"   # dev-only; buyers get a plain folder
  ".obsidian/workspace*.json"     # local UI layout
  "*-debug.log" "**/*-debug.log"
  ".DS_Store" "**/.DS_Store"
  ".claude/settings.local.json" ".claude/scheduled_tasks.lock"
)

rm -f "$OUT"
if command -v zip >/dev/null 2>&1; then
  ARGS=(); for e in "${EXCLUDES[@]}"; do ARGS+=("-x" "$e"); done
  zip -r -q "$OUT" . "${ARGS[@]}"
else
  echo "  'zip' not found — falling back to 'git archive' (commit first)."
  git archive --format=zip -o "$OUT" HEAD
fi

echo "  ✓ Built $OUT"
echo "  Buyers: unzip → open the folder in Obsidian → follow the panel wizard. See SETUP.md."
