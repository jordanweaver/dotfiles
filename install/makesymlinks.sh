#!/usr/bin/env bash

###############################
### CREATE DOTFILE SYMLINKS ###
###############################

OLD_DOTS_DIR=~/dotfiles_old

# list of files/folders to symlink in homedir
files=("aliases aliases_macos exports finicky.js functions macos gitconfig gitignore_global")

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

# handle .config file(s)
CONFIG_FILES=("starship.toml")  # add paths relative to .config

for cfg in "${CONFIG_FILES[@]}"; do
    target="$HOME/.config/$cfg"
    source="$DOTFILES_DIR/.config/$cfg"

    # ensure parent directory exists
    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target to $OLD_DOTS_DIR"
        mkdir -p "$OLD_DOTS_DIR/.config/$(dirname "$cfg")"
        mv -v "$target" "$OLD_DOTS_DIR/.config/$cfg"
    fi

    echo "Creating symlink to $cfg in ~/.config"
    ln -sfv "$source" "$target"
done