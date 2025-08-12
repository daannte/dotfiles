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
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key g new-window -n "dash" -c "#{pane_current_path}" "gh dash"

      bind v split-window -v
      bind - split-window -h
      bind f resize-pane -Z
      unbind '"'
      unbind %

      set -g renumber-windows on
      set -sg terminal-overrides ",*:RGB"

      set -g status-style fg=brightblack,bg=default
      set -g status-left ""
      set -g status-right ""

      set -g window-status-format "●"
      set -g window-status-current-format "●"
      set -g window-status-current-style "fg=magenta,nobold"
      set -g window-status-bell-style "fg=red,nobold"

      set -g pane-border-lines simple
      set -g pane-border-style fg=brightblack
      set -g pane-active-border-style fg=magenta
    '';
  };
}
