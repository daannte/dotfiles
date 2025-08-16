{...}: {
  programs.git = {
    enable = true;
    ignores = [".DS_Store"];
    extraConfig = {
      user = {
        name = "Dante";
        email = "coho.funny_6i@icloud.com";
        signingKey = "1D380ADC748F68FA";
      };
      commit = {
        gpgSign = true;
        verbose = true;
        template = "~/.config/git/template";
      };
      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        autocrlf = "input";
      };
      diff = {
        context = 3;
        renames = "copies";
        interHunkContext = 10;
      };
      pager = {
        diff = "diff-so-fancy | $PAGER";
        branch = false;
        tag = false;
      };
      diff-so-fancy = {
        markEmptyLines = false;
      };
      interactive = {
        diffFilter = "diff-so-fancy --patch";
        singleKey = true;
      };
      color = {
        ui = "auto";
      };
      push = {
        autoSetupRemote = true;
        default = "current";
      };
      pull = {
        default = "current";
        rebase = true;
      };
      rebase = {
        autoStash = true;
      };
      fetch = {
        prune = true;
      };
      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,green,red";
      };
    };
  };
}
