{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    bat
    deno
    gh
    go
    lazygit
    neovim
    python313
    ripgrep
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
    casks = [
      "alfred"
      "discord"
      "firefox"
      "iina"
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
