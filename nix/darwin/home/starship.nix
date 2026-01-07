{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$directory\n$character";
      right_format = "$git_branch";

      character = {
        format = "> ";
      };
      directory = {
        format = "$path/";
        truncation_length = 1;
        truncation_symbol = "";
        read_only = "󰌾 ";
        read_only_style = "fg:red";
      };
      git_branch = {
        truncation_length = 20;
        truncation_symbol = "";
        format = "$branch";
      };
    };
  };
}
