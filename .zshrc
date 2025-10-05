eval "$(brew shellenv)"
eval "$(direnv hook zsh)"

export PATH="$PATH:/opt/homebrew/opt/postgresql@13/bin"
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zshrc_custom
# Created by `pipx` on 2025-09-15 21:17:35
export PATH="$PATH:/Users/jordanweaver/.local/bin"
