{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bat
    fd
    ripgrep
    delta
    diff-so-fancy
    gnupg
    unrar
    wget
    curl
    grep
    sevenzip
  ];
}
