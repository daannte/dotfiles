{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    alejandra
    pkg-config
    cmake
    protobuf
    pandoc
  ];
}
