{...}: {
  programs.git = {
    enable = true;
    ignores = [".DS_Store"];
    extraConfig = {
      user = {
        name = "Dante";
        email = "dkirsman@gmail.com";
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
