# Prompt
# setopt PROMPT_SUBST
# PROMPT='$([[ $PWD != $HOME ]] && echo "%F{blue}%~%f ")%F{yellow}>%f '
PROMPT='$([[ $PWD != $HOME ]] && echo "%F{blue}%~%f ")
%F{yellow}>%f '
#
precmd() { print "" }

# Oh my zsh stuff
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Aliases
alias zsh="nvim ~/.zshrc"
alias n="nvim"
alias vim="nvim"
alias ls="eza --icons -1"
alias cat="bat"
alias fetch="pfetch"
alias lg="lazygit"
alias gcz="git cz --disable-emoji"
alias clock="tty-clock -c -s"
alias ani="ani-cli"
alias ybr="yabai --stop-service && yabai --start-service"
alias ytaudio="yt-dlp -f 'ba' -x --audio-format mp3"
alias music="ncmpcpp"

# shell stuff
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
