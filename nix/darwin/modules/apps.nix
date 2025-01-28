{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    bat
    cargo
    deno
    gh
    go
    lazygit
    neovim
    python313
    ripgrep
    rustc
    tmux
    zoxide
  ];

  environment.variables = {
    LANG = "en_CA.UTF-8";
    EDITOR = "nvim";
    # Java 18
    JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home";

    # Java 8 for battlecode
    # JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk1.8.0_351.jdk/Contents/Home/";
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
