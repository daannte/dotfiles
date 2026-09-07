{...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Dante";
        email = "github.6p8ng@kironmail.com";
      };
      ui = {
        default-command = "st";
      };
    };
  };
}
