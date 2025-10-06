#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Update Homebrew, formulae, and packages
brew update
brew upgrade

# Brew Binary Installs
apps=(
    eza
    fontconfig
    starship
    z
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
)
brew install "${apps[@]}"

# Brew Cask Application Installs
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
casks=(
    alfred
    iterm2
    finicky
    gifox
    keeper-password-manager
    rectangle
    spotify
    discord
#    visual-studio-code
    cursor
    font-jetbrains-mono-nerd-font
    font-0xproto-nerd-font
    karabiner-elements
)
brew install --cask "${casks[@]}"

# Remove outdated versions from the cellar
brew cleanup
