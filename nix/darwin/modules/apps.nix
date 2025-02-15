{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    awscli
    bat
    basedpyright
    cargo
    deno
    gh
    go
    lazygit
    neovim
    nodejs_23
    python312
    python313
    ripgrep
    ruff
    rustc
    terraform
    texliveFull
    tmux
    zoxide
  ];

  environment.variables = {
    LANG = "en_CA.UTF-8";
    EDITOR = "nvim";
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
    ];
    brews = [];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
