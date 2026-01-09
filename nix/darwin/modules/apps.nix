{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    bat
    bun
    cmake
    vscode-langservers-extracted
    delta
    diff-so-fancy
    fd
    gh
    gnupg
    imagemagick
    javaPackages.compiler.openjdk21
    jdt-language-server
    neovim
    lua-language-server
    luarocks
    nodejs_24
    node-gyp
    pandoc
    pkg-config
    pnpm
    postgresql
    protobuf
    ripgrep
    ruff
    sqlite
    tailwindcss-language-server
    texliveFull
    tmux
    tinymist
    typescript-language-server
    typst
    typstyle
    unrar
    yarn
  ];

  environment.variables = {
    LANG = "en_CA.UTF-8";
    EDITOR = "nvim";
    PATH = "$HOME/.cargo/bin:/Users/dante/.local/bin:$PATH";
  };

  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap" # Aerospace Tap
      "protonpass/tap"
    ];
    casks = [
      "aerospace"
      "anki"
      "curseforge"
      "discord"
      "docker-desktop"
      "firefox"
      "iina"
      "karabiner-elements"
      "mos"
      "obsidian"
      "protonvpn"
      "proton-mail"
      "raycast"
      "signal"
      "steam"
    ];
    brews = [
      "ente-cli"
      "pass-cli"
      "gcc"
      "sevenzip"
      "ty"
      "curl"
      "grep"
      "ffmpeg"
      "yt-dlp"
      "wireguard-tools"
      "wget"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
