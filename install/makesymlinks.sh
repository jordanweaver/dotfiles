#!/usr/bin/env bash

###############################
### CREATE DOTFILE SYMLINKS ###
###############################

OLD_DOTS_DIR=~/dotfiles_old

# list of files/folders to symlink in homedir
files=("aliases bash_profile exports functions gitconfig gitignore_global ipython macos path zshrc creds")

##########

# create dotfiles_old in homedir
echo -n "Creating $OLD_DOTS_DIR for backup of any existing dotfiles in ~ ..."
mkdir -p $OLD_DOTS_DIR
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $DOTFILES_DIR directory ..."
cd $DOTFILES_DIR
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $OLD_DOTS_DIR"
    mv ~/.$file $OLD_DOTS_DIR
    echo "Creating symlink to .$file in home directory."
    ln -sfv $DOTFILES_DIR/.$file ~/.$file
done
