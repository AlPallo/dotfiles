#!/usr/bin/env bash
set -euo pipefail

# Directory of this script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOTSTRAP_DIR="$DOTFILES_DIR/bootstrap"

echo "🔧 Running shell bootstrap..."

# Explicit list of scripts in the order you want to run them
BOOTSTRAP_SCRIPTS=(
    "bootstrap-configs.sh"
    "nvim-alternatives.sh"
)

# Keep track of executed scripts
EXECUTED=()

for script in "${BOOTSTRAP_SCRIPTS[@]}"; do
    local_path="$BOOTSTRAP_DIR/$script"
    if [ -f "$local_path" ]; then
        echo "➡️  Running $script"
        "$local_path"
        EXECUTED+=("$script")
    else
        echo "⚠️  Expected bootstrap script $script not found!"
    fi
done

# Check for scripts that exist in bootstrap/ but were not executed
for script in "$BOOTSTRAP_DIR"/*.sh; do
    name="$(basename "$script")"
    if [[ ! " ${EXECUTED[*]} " =~ " $name " ]]; then
        echo "⚠️  Script $name exists in bootstrap/ but was not executed in bootstrap.sh"
    fi
done

# Add source line to ~/.bashrc if not already present
BASHRC="$HOME/.bashrc"
SOURCE_LINE="source $DOTFILES_DIR/conf.sh"

if ! grep -Fxq "$SOURCE_LINE" "$BASHRC"; then
	echo "" >>"$BASHRC"
	echo "# Load dotfiles config" >>"$BASHRC"
	echo "$SOURCE_LINE" >>"$BASHRC"
	echo "🔗 Added '$SOURCE_LINE' to $BASHRC"
else
	echo "🔗 '$SOURCE_LINE' already exists in $BASHRC, skipping"
fi

# Reload bashrc for current session
source "$HOME/.bashrc"

source "$HOME/.bashrc"
echo "✅ Shell bootstrap complete."
