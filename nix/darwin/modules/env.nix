{ ... }: {
  environment.variables = {
    LANG = "en_CA.UTF-8";
    EDITOR = "nvim";
    PATH = "$HOME/.cargo/bin:/Users/dante/.local/bin:$PATH";
  };
}
