{config, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    dotDir = "${config.xdg.configHome}/zsh";
    shellAliases = {
      n = "nvim";
      vim = "nvim";
      ls = "eza --icons";
      cp = "cp -iv";
      mv = "mv -iv";
      cat = "bat";
      ytaudio = "yt-dlp -f 'ba' -x --audio-format mp3";
      switch = "sudo darwin-rebuild switch --flake ~/dotfiles/nix/darwin";

      # Wireguard for home-server
      home-up = "wg-quick up Dante-Mac";
      home-down = "wg-quick down Dante-Mac";

      # Texthooker
      text = "open ~/Documents/japanese/texthooker/index.html";

      # Git
      ga = "git add";
      gap = "ga --patch";
      gr = "git reset";
      gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
      gds = "git diff --staged";
      gl = "git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'";
      gs = "git status --short";
      gc = "git commit";
      gce = "git commit --amend";
      gca = "git commit --amend --no-edit";
      gu = "git pull";
      gp = "git push";
      gb = "git branch";
      gba = "gb --all";
      gbn = "git switch -c";
      gsw = "git switch";
      gpr = "!f() { git fetch origin pull/$1/head:pr/$1 && git switch pr/$1; }; f";
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
