{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    awscli
    bat
    basedpyright
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
    go
    gopls
    gnupg
    imagemagick
    jdk23
    neovim
    lua-language-server
    luarocks
    nest-cli
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
    yarn
    zoxide
    zsteg
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
      "anki"
      "battery-toolkit"
      "discord"
      "docker-desktop"
      "firefox"
      "ghostty"
      "iina"
      "karabiner-elements"
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
