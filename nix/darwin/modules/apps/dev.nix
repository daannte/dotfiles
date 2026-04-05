{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    protobuf
    pandoc
  ];
}
