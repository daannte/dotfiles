# Options
setopt auto_list
setopt hist_find_no_dups
setopt hist_ignore_dups

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Aliases
alias n="nvim"
alias vim="nvim"
alias ls="eza --icons"
alias cp="cp -iv"
alias cat="bat"
alias ani="ani-cli"
alias ryb="yabai --stop-service && yabai --start-service"
alias rskhd="skhd --stop-service && skhd --start-service"
alias rzsh='source ~/.zshrc'
alias ytaudio="yt-dlp -f 'ba' -x --audio-format mp3"

# History
HISTFILE=~/.zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
bindkey -v

# shell stuff
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
