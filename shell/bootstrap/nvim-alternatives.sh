#!/usr/bin/env bash
set -euo pipefail

NVIM_PATH="$(command -v nvim || true)"

if [ -z "$NVIM_PATH" ]; then
    echo "⚠️  Neovim not found in PATH, skipping alternatives setup."
    exit 0
fi

echo "🔗 Configuring alternatives for vi/vim → $NVIM_PATH"

sudo update-alternatives --install /usr/bin/vi vi "$NVIM_PATH" 60
sudo update-alternatives --install /usr/bin/vim vim "$NVIM_PATH" 60
sudo update-alternatives --set vi "$NVIM_PATH"
sudo update-alternatives --set vim "$NVIM_PATH"

echo "✅ vi and vim now point to Neovim."
