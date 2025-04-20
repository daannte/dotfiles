{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "family=Iosevka style=Light";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "18";
      disable_ligatures = "always";
      enable_audio_bell = false;
      hide_window_decorations = true;
      window_padding_width = 40;
      enabled_layouts = "splits";
      macos_quit_when_last_window_closed = true;
    };
    extraConfig = ''
      cursor_trail 10
      cursor_trail_start_threshold 0
      cursor_trail_decay 0.01 0.15
      cursor_shape block
      cursor_blink true
      modify_font cell_height 140%

      # Base 16 metal
      # background #000000
      # foreground #c1c1c1
      #
      # color0    #000000
      # color8    #333333
      #
      # color1    #875F5F
      # color9    #875F5F
      #
      # color2    #808E9C
      # color10   #808E9C
      #
      # color3    #8c7f70
      # color11   #8c7f70
      #
      # color4    #888888
      # color12   #888888
      #
      # color5    #999999
      # color13   #999999
      #
      # color6    #aaaaaa
      # color14   #aaaaaa
      #
      # color7    #c1c1c1
      # color15   #999999

      # Evergarden
      # foreground               #dddecf
      # background               #1D2428
      # selection_foreground     #dddecf
      # selection_background     #3d494d
      #
      # wayland_titlebar_color   #171c1f
      # macos_titlebar_color     #171c1f
      #
      # cursor                   #93C9A1
      # cursor_text_color        #171c1f
      #
      # url_color                #9bb5cf
      #
      # active_tab_foreground    #171c1f
      # active_tab_background    #93C9A1
      #
      # inactive_tab_foreground  #738a8b
      # inactive_tab_background  #171c1f
      #
      # # black
      # color0   #1c2225
      # color8   #313b40
      #
      # # red
      # color1   #e67e80
      # color9   #e67e80
      #
      # # green
      # color2   #b2c98f
      # color10  #b2c98f
      #
      # # yellow
      # color3   #dbbc7f
      # color11  #dbbc7f
      #
      # # blue
      # color4   #9bb5cf
      # color12  #9bb5cf
      #
      # # purple
      # color5   #e3a8d1
      # color13  #e3a8d1
      #
      # # aqua
      # color6   #93c9a1
      # color14  #93c9a1
      #
      # # white
      # color7   #dddecf
      # color15  #94aaa0

      background #181616
      foreground #c5c9c5
      selection_background #2D4F67
      selection_foreground #C8C093
      url_color #72A7BC
      cursor #C8C093

      # Tabs
      active_tab_background #12120f
      active_tab_foreground #C8C093
      inactive_tab_background  #12120f
      inactive_tab_foreground #a6a69c
      #tab_bar_background #15161E

      # normal
      color0 #0d0c0c
      color1 #c4746e
      color2 #8a9a7b
      color3 #c4b28a
      color4 #8ba4b0
      color5 #a292a3
      color6 #8ea4a2
      color7 #C8C093

      # bright
      color8  #a6a69c
      color9  #E46876
      color10 #87a987
      color11 #E6C384
      color12 #7FB4CA
      color13 #938AA9
      color14 #7AA89F
      color15 #c5c9c5


      # extended colors
      color16 #b6927b
      color17 #b98d7b
    '';
  };
}
