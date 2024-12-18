{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    dotDir = ".zsh";
    shellAliases = {
      n = "nvim";
      vim = "nvim";
      ls = "eza --icons";
      cp = "cp -iv";
      cat = "bat";
      ani = "ani-cli";
      lg = "lazygit";
      ytaudio = "yt-dlp -f 'ba' -x --audio-format mp3";
      switch = "darwin-rebuild switch --flake ~/nix";
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      path = "$ZDOTDIR/.zsh_history";
      save = 512;
      share = true;
    };
    initExtra = ''
      bindkey -v
    '';
  };
}
