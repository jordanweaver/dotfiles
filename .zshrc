# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="» "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=7

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment to hide the “user@hostname” in the window title
# DEFAULT_USER=jweaver

# Uncomment following line if you want to enable command auto-correction
# ENABLE_CORRECTION="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=14

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github python osx zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

########################
# CUSTOM STARTUP ITEMS #
########################


for DOTFILE in ~/.{aliases,exports,functions,path}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Archey Terminal Splash
archey --color --offline

# Z
. ~/devo/repos/z/z.sh

# use bash ctrl-U behavior
bindkey '^U' backward-kill-line

# edm auto-completion
autoload bashcompinit
bashcompinit
source ~/.edm-completion.bash

export VIRTUAL_ENV_DISABLE_PROMPT=1

source ~/.fonts/*.sh
