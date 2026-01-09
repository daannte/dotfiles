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
    ./home/extras.nix
    ./home/git.nix
    ./home/mpv.nix
    ./home/starship.nix
    ./home/tmux.nix
    ./home/zsh.nix
    ./home/zathura.nix
  ];

  # Add any user-specific packages here if needed
  home.packages = with pkgs; [];
}
