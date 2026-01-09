{ ... }: {
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
