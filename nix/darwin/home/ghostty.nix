{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    settings = {
      font-family = "Cartograph CF";
      font-size = 20;
      font-feature = "-calt, -liga, -dlig";

      window-decoration = "none";
      window-padding-x = 40;
      window-padding-y = 40;
      window-height = 25;
      window-width = 100;

      adjust-cell-height = "35%";
      cursor-style-blink = true;
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = true;

      theme = "gruvbox";
    };
    themes = {
      catpuccin = {
        background = "1e1e2e";
        foreground = "cdd6f4";
        cursor-color = "f5e0dc";
        cursor-text = "11111b";
        palette = [
          "0=#45475a"
          "1=#f38ba7"
          "2=#a6e3a1"
          "3=#f9e2af"
          "4=#89b4fa"
          "5=#f5c2e7"
          "6=#94e2d5"
          "7=#a6adc8"
          "8=#585b70"
          "9=#f38ba8"
          "10=#a6e3a1"
          "11=#f9e2af"
          "12=#89b4fa"
          "13=#f5c2e7"
          "14=#94e2d5"
          "15=#bac2de"
        ];
        selection-background = "353749";
        selection-foreground = "cdd6f2";
        split-divider-color = "313244";
      };
      gruvbox = {
        background = "#32302f";
        foreground = "#d4be98";
        cursor-color = "#d4be98";
        palette = [
          "0=252423"
          "1=#ea6962"
          "2=#a9b665"
          "3=#d8a657"
          "4=#7daea3"
          "5=#d3869b"
          "6=#89b482"
          "7=#d4be98"
          "8=#32302f"
          "9=#ea6962"
          "10=#a9b665"
          "11=#d8a657"
          "12=#7daea3"
          "13=#d3869b"
          "14=#89b482"
          "15=#d4be98"
        ];
        selection-background = "#45403d";
        selection-foreground = "#d4be98";
      };
    };
  };
}
