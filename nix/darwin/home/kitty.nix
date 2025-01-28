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
            modify_font cell_height 120%

            # Gruvbox
            # background  #282828
            # foreground  #d4be98
            #
            # # Black
            # color0   #867970
            # color8   #867970
            #
            # # Red
            # color1   #d67b76
            # color9   #d67b76
            #
            # # Green
            # color2   #a3ae6d
            # color10  #a3ae6d
            #
            # # Yellow
            # color3   #cba364
            # color11  #cba364
            #
            # # Blue
            # color4   #82a9a0
            # color12  #82a9a0
            #
            # # Magenta
            # color5   #cb8e9e
            # color13  #cb8e9e
            #
            # # Cyan
            # color6   #8daf87
            # color14  #8daf87
            #
            # # White
            # color7   #d7c5a7
            # color15  #d7c5a7

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

      foreground               #dddecf
      background               #1c2225
      selection_foreground     #dddecf
      selection_background     #3d494d

      wayland_titlebar_color   #171c1f
      macos_titlebar_color     #171c1f

      cursor                   #93C9A1
      cursor_text_color        #171c1f

      url_color                #9bb5cf

      active_tab_foreground    #171c1f
      active_tab_background    #93C9A1

      inactive_tab_foreground  #738a8b
      inactive_tab_background  #171c1f

      # black
      color0   #1c2225
      color8   #313b40

      # red
      color1   #e67e80
      color9   #e67e80

      # green
      color2   #b2c98f
      color10  #b2c98f

      # yellow
      color3   #dbbc7f
      color11  #dbbc7f

      # blue
      color4   #9bb5cf
      color12  #9bb5cf

      # purple
      color5   #e3a8d1
      color13  #e3a8d1

      # aqua
      color6   #93c9a1
      color14  #93c9a1

      # white
      color7   #dddecf
      color15  #94aaa0
    '';
  };
}
