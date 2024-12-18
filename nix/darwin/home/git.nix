{...}: {
  programs.git = {
    enable = true;
    ignores = [".DS_Store"];
    extraConfig = {
      user = {
        name = "Dante";
        email = "dkirsman@proton.me";
      };
      init = {
        defaultBranch = "main";
      };
      color = {
        ui = "auto";
      };
      pull = {
        ff = "only";
      };
      fetch = {
        prune = true;
      };
    };
  };
}
