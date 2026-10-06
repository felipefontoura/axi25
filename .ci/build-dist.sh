#!/usr/bin/env bash
#
# Build the distributable AXI25 zip that users download from GitHub Releases.
# The plugin lives in a git submodule (.obsidian/plugins/bojubot — the folder name must
# match manifest.id); this assembles a CLEAN copy of the working tree — verified branding,
# no git / dev / submodule internals.
#
#   Usage:  bash .ci/build-dist.sh [version]     # e.g. bash .ci/build-dist.sh 1.0.0
#
set -euo pipefail
# This script lives in .ci/; the vault root is one level up.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

PLUGIN=".obsidian/plugins/bojubot"
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

# 2. Brand guard — refuse to ship a plugin that isn't branded as AXI25. Branding is no
#    longer a bundle patch: it's the upstream `brand` config in data.json plus the manifest
#    identity. Verify both, so a stray stock-BojuBot build can never reach a user.
node -e "
const fs=require('fs');
const m=JSON.parse(fs.readFileSync('$PLUGIN/manifest.json'));
const d=JSON.parse(fs.readFileSync('$PLUGIN/data.json'));
const e=[];
if(m.id!=='bojubot')e.push('manifest.id='+m.id+' (must be bojubot: upstream hardcodes plugins/bojubot/)');
if(m.name!=='AXI25')e.push('manifest.name='+m.name);
if(m.author!=='Felipe Fontoura')e.push('manifest.author='+m.author);
if(!d.brand||d.brand.name!=='AXI25')e.push('data.brand.name='+(d.brand&&d.brand.name)+' (not white-labeled)');
if(d.brand&&d.brand.locked!==true)e.push('data.brand.locked is not true (Brand settings would be user-visible)');
if(e.length){console.error('  ✗ brand guard:\n    - '+e.join('\n    - '));process.exit(1)}
console.log('  ✓ brand guard: AXI25 (id=bojubot), white-labeled + locked');
"

# 3. Never ship a live session (the committed default is already blank; this is belt-and-suspenders).
node -e "const f='$PLUGIN/data.json',fs=require('fs');const d=JSON.parse(fs.readFileSync(f));if(d.lastActiveSessionId){d.lastActiveSessionId='';fs.writeFileSync(f,JSON.stringify(d,null,2)+'\n')}"

# 4. Refresh the Claude Code skills copy so the zip is consistent. The empty
#    GENERATED-DO-NOT-EDIT marker (its name is the message) warns anyone browsing the
#    copy; the real guard against a stale copy is .ci/verify.mjs's byte-for-byte check.
rm -rf .claude/skills && cp -R .agents/skills .claude/skills
touch .claude/skills/GENERATED-DO-NOT-EDIT

# 5. Files/dirs that must NOT reach the user.
EXCLUDES=(
  ".git" ".git/*" ".github/*" ".ci/*" "dist/*" "node_modules/*"
  ".gitmodules"                   # vault users get .gitignore + .gitattributes (keep .env out of backups)
  "AUDIT.md"                      # internal audit (mentions the origin vault)
  ".obsidian/workspace*.json"     # local UI layout
  "*-debug.log" "**/*-debug.log"
  ".DS_Store" "**/.DS_Store"
  ".claude/settings.local.json" ".claude/scheduled_tasks.lock"
  # Obsidian Git runtime-local files (created when the plugin runs) — never ship them;
  # gitignore alone doesn't help here since we zip the working tree, not the git index.
  ".obsidian/plugins/obsidian-git/data.json"
  ".obsidian/plugins/obsidian-git/obsidian_askpass.sh"
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
echo "  Users: unzip → open the folder in Obsidian → follow the panel wizard. See SETUP.md."
