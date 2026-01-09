{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Maple Mono";
      font-size = 20;
      font-feature = "-calt, -liga, -dlig";
      
      window-decoration = "none";
      window-padding-x = 40;
      window-padding-y = 40;

      adjust-cell-height = "35%";
      cursor-style-blink = true;
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = true;

      theme = "catpuccin";
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
    };
  };
}
