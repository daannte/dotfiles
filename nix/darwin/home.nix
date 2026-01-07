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
    (import ./home/mpv.nix {inherit pkgs;})
    ./home/starship.nix
    (import ./home/tmux.nix {inherit pkgs;})
    ./home/zsh.nix
    ./home/zathura.nix
  ];

  # Add any user-specific packages here if needed
  home.packages = with pkgs; [];
}
