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

      # Wireguard for home-server
      home-up = "wg-quick up Dante-Mac";
      home-down = "wg-quick down Dante-Mac";

      # Git
      ga = "git add";
      gap = "ga --patch";
      gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
      gl = "git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'";
      gs = "git status --short";
      gc = "git commit";
      gu = "git pull";
      gp = "git push";
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
