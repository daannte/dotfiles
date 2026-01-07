{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    awscli
    bat
    binwalk
    bun
    cmake
    vscode-langservers-extracted
    delta
    deno
    diff-so-fancy
    exiftool
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
    nmap
    openvpn
    pandoc
    pkg-config
    pnpm
    postgresql
    protobuf
    pwncat
    ripgrep
    ruff
    sqlite
    steghide
    tailwindcss-language-server
    texliveFull
    tmux
    tinymist
    typescript-language-server
    typst
    typstyle
    unrar
    yarn
    zsteg
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
      "ghostty"
      "iina"
      "karabiner-elements"
      "mos"
      "obsidian"
      "protonvpn"
      "proton-mail"
      "raycast"
      "signal"
      "steam"
      "zen"
      "zoom"
    ];
    brews = [
      "ente-cli"
      "pass-cli"
      "gcc"
      "sevenzip"
      "uv"
      "ty"
      "curl"
      "grep"
      "aria2"
      "ffmpeg"
      "git"
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
