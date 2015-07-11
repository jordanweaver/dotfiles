#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Update Homebrew, formulae, and packages
brew update
brew upgrade -all

# Brew Binary Installs
apps=(
    archey
    git
    wget
    z
)
brew install "${apps[@]}"

# Brew Cask Application Installs
brew install caskroom/cask/brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
casks=(
    alfred
    atext
    cmake
    cyberduck
    dash
    dropbox
    evernote
    flux
    google-chrome
    google-drive
    iterm2
    mactex
    magicprefs
    mendeley-desktop
    menumeters
    remote-desktop-manager
    sourcetree
    spectacle
    spotify
    sublime-text3
    things
    viscosity
    vlc
    vmware-fusion
)
brew cask install "${casks[@]}"

# Remove outdated versions from the cellar
brew cleanup
