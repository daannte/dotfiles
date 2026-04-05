{...}: {
  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap" # Aerospace Tap
    ];
    casks = [
      "aerospace"
      "anki"
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
      "tailscale-app"
      "zoom"
    ];
    brews = [
      "neovim"
      "ty"
      "ffmpeg"
      "postgresql"
      "tree-sitter-cli"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
