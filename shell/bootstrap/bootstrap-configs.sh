#!/usr/bin/env bash
set -euo pipefail
export GIT_PS1_SHOWCONFLICTSTATE=${GIT_PS1_SHOWCONFLICTSTATE:-0}

# Directory of the dotfiles repo
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
echo "$DOTFILES_DIR"

echo "🔗 Setting up config symlinks..."

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Function to create or update symlinks
link_config() {
	local src="$1"
	local dest="$2"
	echo "LINK SOURCE $src"
	echo "LINK DESTINATION $dest"

	if [ -L "$dest" ]; then
		echo "♻️  Updating existing symlink $dest → $src"
		ln -sfn "$src" "$dest"
	elif [ -e "$dest" ]; then
		echo "⚠️  $dest exists and is not a symlink, skipping"
	else
		echo "➡️  Creating symlink $dest → $src"
		ln -sfn "$src" "$dest"
	fi
}

link_config "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_config "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"

echo "✅ Config symlinks setup complete."
