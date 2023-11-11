# Prompt
setopt PROMPT_SUBST
# PROMPT='$([[ $PWD != $HOME ]] && echo "%F{blue}%~%f ")%F{yellow}>%f '
PROMPT='%F{blue}%~%f
%F{yellow}>%f '

precmd() { print "" }

eval "$(zoxide init zsh)"

# Oh my zsh stuff
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Aliases
alias zsh="nvim ~/.zshrc"
alias n="nvim"
alias ls="eza --icons -1"
alias cat="bat"
alias fetch="pfetch"
alias lg="lazygit"
alias gcz="git cz --disable-emoji"
alias clock="tty-clock -c -s"
alias ani="ani-cli"
alias ybr="yabai --stop-service && yabai --start-service"
