#!/usr/bin/env bash

# Das Bootstrap
#
# Main driver script for bootstrapping a new environment, including updating
# a stale dotfiles repo via git, symlinking all dotfiles to the home
# directory, sourcing...

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$(dirname "${BASH_SOURCE}")";

# Install Homebrew & brew-cask
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

for SCRIPT in "$DOTFILES_DIR"/install/*.sh; do
      [ -f "$SCRIPT" ] && . "$SCRIPT"
done

# Move Rectangle config to Application Support if it exists
RECTANGLE_SRC="$DOTFILES_DIR/init/RectangleConfig.json"
RECTANGLE_DEST="$HOME/Library/Application Support/Rectangle/RectangleConfig.json"

if [ -f "$RECTANGLE_SRC" ]; then
    mkdir -p "$(dirname "$RECTANGLE_DEST")"
    cp "$RECTANGLE_SRC" "$RECTANGLE_DEST"
    echo "Copied RectangleConfig.json to $RECTANGLE_DEST"
fi

Run macOS defaults/settings script if it exists
if [ -f "$DOTFILES_DIR/.macos" ]; then
    echo "Running .macos script..."
    bash "$DOTFILES_DIR/.macos"
fi
