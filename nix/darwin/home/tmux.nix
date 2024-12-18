{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    prefix = "C-f";
    secureSocket = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    extraConfig = ''
      set -g renumber-windows on

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel


      unbind %
      bind ] split-window -v

      unbind '"'
      bind v split-window -h

      set -g mode-style "bg=default,fg=default"
      set -g status-position bottom
      set -sa terminal-overrides ",*:dim=\\E[2m"
      set -g status-justify centre
      set -g window-status-format "#[fg=magenta,bg=black] #I:#W #[bg=default,fg=black]"
      set -g window-status-current-format "#[bg=magenta,fg=black] #I:#W #[bg=default,fg=black]"
      set-option -g status-left ""
      set-option -g status-right ""

      set -g status-bg default
      set -g status-fg white
      set -g status-style "fg=white,bg=default"
    '';
  };
}
