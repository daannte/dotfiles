{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$directory\n$character";
      right_format = "$git_branch";

      character = {
        format = "-> ";
      };
      directory = {
        format = "$path $read_only";
        truncation_symbol = "<";
        truncation_length = 3;
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
