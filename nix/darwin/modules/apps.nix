{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    awscli
    bat
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
    rustc
    terraform
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
      "firefox"
      "iina"
      "karabiner-elements"
      "kitty"
      "mos"
      "obsidian"
      "pearcleaner"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
