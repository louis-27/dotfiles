# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh
export ZSH="/Users/louis/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" # Powerlevel10k theme: https://github.com/romkatv/powerlevel10k

# Plugins
plugins=(git)

# Source zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias vim="nvim"
alias vw="vim ~/vimwiki/index.wiki"
alias dot="cd ~/dotfiles"
alias cdd="cd ~/Developer"
alias lg="lazygit"

# nvm - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# z - Directory jumping
. "$HOME/z.sh"

# pnpm
export PNPM_HOME="/Users/louis/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
