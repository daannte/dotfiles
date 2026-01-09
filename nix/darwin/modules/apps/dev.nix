{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    alejandra
    protobuf
    pandoc
  ];
}
