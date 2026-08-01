{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    settings = {
      font-family = "SF Mono Medium";
      font-size = 18;
      font-feature = "-calt, -liga, -dlig";

      window-decoration = "none";
      window-padding-x = 40;
      window-padding-y = 40;
      window-height = 25;
      window-width = 130;

      adjust-cell-height = "35%";
      cursor-style-blink = true;
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = true;

      theme = "cendre";
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
          "8=#4a4a4a"
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
      cendre = {
        background = "#231f1d";
        foreground = "#e6d5c2";
        cursor-color = "#ea9875";
        cursor-text = "#231f1d";
        palette = [
          "0=#2d2725"
          "1=#d1766e"
          "2=#99af6b"
          "3=#fcba81"
          "4=#58bdff"
          "5=#9480ba"
          "6=#4e89a2"
          "7=#a09384"
          "8=#73665b"
          "9=#d25780"
          "10=#43b16a"
          "11=#f4a21c"
          "12=#8bcfff"
          "13=#a692cd"
          "14=#20c9cb"
          "15=#e6d5c2"
        ];
        selection-background = "#3d2b23";
        selection-foreground = "#e6d5c2";
      };
    };
  };
}
