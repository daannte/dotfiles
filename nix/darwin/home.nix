{
  username,
  pkgs,
  ...
}: {
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  imports = [
    ./home
  ];

  # Add any user-specific packages here if needed
  home.packages = with pkgs; [];
}
