# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh
export ZSH="/Users/louis/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

# Source zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias vim="nvim"
alias cdd="cd ~/Developer"

# nvm - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# z - Directory jumping
. "$HOME/z.sh"
