{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    wget
    gh
    bat
    fd
    ripgrep
    delta
    diff-so-fancy
    gnupg
    unrar
    wget
    _7zz
  ];
}
