#!/usr/bin/env bash
#
# Build the distributable AXI25 zip that buyers download.
# The plugin lives in a git submodule (.obsidian/plugins/axi25); this assembles a
# CLEAN copy of the working tree — verified branding, no git / dev / submodule internals.
#
#   Usage:  bash .ci/build-dist.sh [version]     # e.g. bash .ci/build-dist.sh 1.0.0
#
set -euo pipefail
# This script lives in .ci/; the vault root is one level up.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

PLUGIN=".obsidian/plugins/axi25"
VERSION="${1:-$(node -e "process.stdout.write(require('./package.json').version)" 2>/dev/null || echo 1.0.0)}"
OUT="dist/axi25-${VERSION}.zip"
mkdir -p dist

# 1. The plugin submodule MUST be checked out — otherwise the zip ships an empty
#    plugin folder. (In CI: actions/checkout with 'submodules: recursive'.)
if [ ! -f "$PLUGIN/main.js" ] || [ ! -f "$PLUGIN/manifest.json" ]; then
  echo "  ✗ $PLUGIN is empty — the plugin submodule is not checked out." >&2
  echo "    Local:  git submodule update --init --recursive" >&2
  echo "    CI:     actions/checkout with 'submodules: recursive'" >&2
  exit 1
fi

# 2. Brand guard — refuse to ship a plugin that isn't fully branded (drift / leaks).
node "$PLUGIN/.build/apply-brand.mjs" --check

# 3. Never ship a live session (the committed default is already blank; this is belt-and-suspenders).
node -e "const f='$PLUGIN/data.json',fs=require('fs');const d=JSON.parse(fs.readFileSync(f));if(d.lastActiveSessionId){d.lastActiveSessionId='';fs.writeFileSync(f,JSON.stringify(d,null,2)+'\n')}"

# 4. Refresh the Claude Code skills copy so the zip is consistent.
rm -rf .claude/skills && cp -R .agents/skills .claude/skills

# 5. Files/dirs that must NOT reach the buyer.
EXCLUDES=(
  ".git" ".git/*" ".github/*" ".ci/*" "dist/*" "node_modules/*"
  ".gitmodules" ".gitignore" ".gitattributes"
  "AUDIT.md"                      # internal audit (mentions the origin vault)
  ".obsidian/workspace*.json"     # local UI layout
  "*-debug.log" "**/*-debug.log"
  ".DS_Store" "**/.DS_Store"
  ".claude/settings.local.json" ".claude/scheduled_tasks.lock"
  # plugin submodule: strip git + dev tooling, keep only the loadable plugin
  "$PLUGIN/.git" "$PLUGIN/.build/*" "$PLUGIN/.build"
  "$PLUGIN/.gitignore" "$PLUGIN/.markdownlint-cli2.jsonc"
)

# 6. Assemble the zip from the working tree. 'zip' is REQUIRED: the old 'git archive'
#    fallback silently dropped submodule contents (→ empty plugin), so we refuse it.
if ! command -v zip >/dev/null 2>&1; then
  echo "  ✗ 'zip' not found. Install it — 'git archive' is NOT a safe fallback here" >&2
  echo "    (it drops submodule contents, shipping an empty plugin)." >&2
  exit 1
fi
rm -f "$OUT"
ARGS=(); for e in "${EXCLUDES[@]}"; do ARGS+=("-x" "$e"); done
zip -r -q "$OUT" . "${ARGS[@]}"

echo "  ✓ Built $OUT"
echo "  Buyers: unzip → open the folder in Obsidian → follow the panel wizard. See SETUP.md."
