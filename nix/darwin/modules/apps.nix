{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    awscli
    bat
    basedpyright
    cargo
    cmake
    delta
    deno
    fd
    gh
    go
    gopls
    jdk23
    neovim
    lazygit
    nodejs_23
    pkg-config
    python312
    python313
    ripgrep
    ruff
    rustc
    rustup
    terraform
    texliveFull
    tmux
    tinymist
    typst
    typstyle
    zoxide
  ];

  environment.variables = {
    LANG = "en_CA.UTF-8";
    EDITOR = "nvim";
    PATH = "$HOME/go/bin:$PATH";
  };

  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap"
    ];
    casks = [
      "aerospace"
      "alfred"
      "discord"
      "docker"
      "firefox"
      "iina"
      "karabiner-elements"
      "kitty"
      "mos"
      "obsidian"
      "pearcleaner"
      "steam"
      "whisky"
      "zen-browser"
      "zoom"
    ];
    brews = [
      "gcc"
      "sevenzip"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
