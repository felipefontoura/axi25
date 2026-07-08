#!/usr/bin/env bash
#
# Check out the private plugin submodule (axi25-plugin) with a read-only deploy key.
#
# Why a separate step (not actions/checkout's `ssh-key`): passing ssh-key to
# actions/checkout forces the MAIN repo (axi25) onto SSH too — and the deploy key only
# grants access to axi25-plugin, so the main checkout fails ("Repository not found").
# So we let actions/checkout fetch the main repo via the workflow token, and set up the
# key here for the submodule alone.
#
set -euo pipefail

if [ -z "${AXI25_PLUGIN_DEPLOY_KEY:-}" ]; then
  echo "  ✗ AXI25_PLUGIN_DEPLOY_KEY is not set (add it as a repo secret)." >&2
  exit 1
fi

mkdir -p ~/.ssh && chmod 700 ~/.ssh
printf '%s\n' "$AXI25_PLUGIN_DEPLOY_KEY" > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
ssh-keyscan -t ed25519,rsa github.com >> ~/.ssh/known_hosts 2>/dev/null

git submodule sync --recursive
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519 -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes" \
  git submodule update --init --recursive

echo "  ✓ plugin submodule checked out"
