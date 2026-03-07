{...}: {
  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap" # Aerospace Tap
      "protonpass/tap"
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
      "ente-cli"
      "pass-cli"
      "ty"
      "ffmpeg"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
