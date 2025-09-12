#!/usr/bin/env bash
set -euo pipefail

# Directory of this script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOTSTRAP_DIR="$DOTFILES_DIR/bootstrap"

echo "🔧 Running shell bootstrap..."

# Run all scripts inside bootstrap/
for script in "$BOOTSTRAP_DIR"/*.sh; do
    echo "➡️  Running $(basename "$script")"
    "$script"
done

echo "✅ Shell bootstrap complete."
