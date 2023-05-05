#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Update Homebrew, formulae, and packages
brew update
brew upgrade

# Brew Binary Installs
apps=(
    z
)
brew install "${apps[@]}"

# Brew Cask Application Installs
brew install homebrew/cask/brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
casks=(
    alfred
    dash
    dropbox
    iterm2
    sourcetree
    spotify
    things
)
brew install --cask "${casks[@]}"

# Remove outdated versions from the cellar
brew cleanup
