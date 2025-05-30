{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    awscli
    bat
    basedpyright
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
    lua-language-server
    nodejs_24
    pkg-config
    pnpm
    ripgrep
    ruff
    tailwindcss-language-server
    texliveFull
    tmux
    tinymist
    typescript-language-server
    typst
    typstyle
    zoxide
  ];

  environment.variables = {
    LANG = "en_CA.UTF-8";
    EDITOR = "nvim";
    PATH = "$HOME/go/bin:$HOME/.cargo/bin:/Users/dante/.local/bin:$PATH";
  };

  homebrew = {
    enable = true;
    taps = [
      "mhaeuser/mhaeuser" # Battery Toolkit Tap
      "nikitabobko/tap" # Aerospace Tap
    ];
    casks = [
      "aerospace"
      "alfred"
      "battery-toolkit"
      "discord"
      "docker"
      "firefox"
      "iina"
      "karabiner-elements"
      "kitty"
      "mos"
      "obsidian"
      "pearcleaner"
      "protonvpn"
      "steam"
      "virtualbox"
      "zen"
      "zoom"
    ];
    brews = [
      "gcc"
      "lima"
      "sevenzip"
      "uv"
      "curl"
      "grep"
      "aria2"
      "ffmpeg"
      "git"
      "fzf"
      "yt-dlp"
      "wireguard-tools"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
