# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Path to your oh-my-zsh installation.

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
alias zsh="nvim ~/.zshrc"
alias home="cd ~ && clear"
alias n="nvim"
alias ls="exa --icons"
alias cat="bat"
alias fetch="neofetch"
alias ga="git add -A"
alias gs="git status"
alias gcm="git commit -m"
alias gc="git clone"
alias gch="git checkout"
alias lg="lazygit"
alias gcz="git cz --disable-emoji"
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/Users/dantekirsman/.ghcup/env" ] && source "/Users/dantekirsman/.ghcup/env" # ghcup-env
