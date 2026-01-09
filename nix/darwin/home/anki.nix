{pkgs, ...}: {
  programs.anki = {
    enable = true;
    addons = with pkgs.ankiAddons; [
      anki-connect
      passfail2
      review-heatmap
      yomichan-forvo-server

      (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
        pname = "Study Time Stats";
        version = "2.1.4";
        src = pkgs.fetchFromGithub {
          owner = "iamjustkoi";
          repo = "StudyTimeStats";
          rev = finalAttrs.version;
          sparseCheckout = [ "src/addon" ];
          hash = "sha256-dafc1eea8b509a0a9309e058af7f86324c2a2f465d1e60c57a7ef21a0c7fbe4c";
        };
        sourceRoot = "${finalAttrs.src.name}/src/addon";
      }))
    ];
    minimalistMode = true;
  };
}
