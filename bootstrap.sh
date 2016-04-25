#!/usr/bin/env bash

# Das Bootstrap
#
# Main driver script for bootstrapping a new environment, including updating
# a stale dotfiles repo via git, symlinking all dotfiles to the home
# directory, sourcing...

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Install Homebrew & brew-cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap homebrew/versions
brew tap caskroom/versions

# Begin Installation Scripts
for SCRIPT in "$DOTFILES_DIR"/install/*.sh; do
    [ -f "$SCRIPT" ] && . "$SCRIPT"
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d ~/.oh-my-zsh/ ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh

# Install my powerlevel9k fork into zsh custom themes
cd ~/.oh-my-zsh/custom
git clone git@github.com:jordanweaver/powerlevel9k.git themes/powerlevel9k
