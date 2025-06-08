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
      lg = "lazygit";
      ytaudio = "yt-dlp -f 'ba' -x --audio-format mp3";
      switch = "sudo darwin-rebuild switch --flake ~/dotfiles/nix/darwin";
      icat = "kitty icat";
      home-up = "wg-quick up Dante-Mac";
      home-down = "wg-quick down Dante-Mac";
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      path = "$ZDOTDIR/.zsh_history";
      save = 512;
      share = true;
    };
    initContent = ''
      bindkey -v
    '';
  };
}
