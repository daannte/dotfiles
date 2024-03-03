# Prompt
# setopt PROMPT_SUBST
# PROMPT='$([[ $PWD != $HOME ]] && echo "%F{blue}%~%f ")
# %F{yellow}>%f '

precmd() { print "" }

# Oh my zsh stuff
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Aliases
alias n="nvim"
alias vim="nvim"
alias ls="eza --icons -1"
alias cp="cp -iv"
alias cat="bat"
alias ani="ani-cli"
alias ybr="yabai --stop-service && yabai --start-service"
alias skhdr="skhd --stop-service && skhd --start-service"
alias ytaudio="yt-dlp -f 'ba' -x --audio-format mp3"

# shell stuff
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
