# Install mpv_websocket manually: https://github.com/kuroahna/mpv_websocket

{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    config = {
      input-ipc-server = "/tmp/mpv-socket";
    };
    scripts = with pkgs.mpvScripts; [
      (mpvacious.overrideAttrs (old: rec {
        postPatch = ''
          substituteInPlace utils/forvo.lua \
          --replace-fail "'curl" "'${pkgs.lib.getExe pkgs.curl}"
          substituteInPlace platform/nix.lua \
          --replace-fail "'curl" "'${pkgs.lib.getExe pkgs.curl}" \
          --replace-fail "'wl-copy" "'/usr/bin/pbcopy" \
          --replace-fail "'xclip" "'/usr/bin/pbcopy"
        '';
      }))
    ];
    scriptOpts = {
      subs2srs = {
        deck_name = "Mining";
        model_name = "Lapis";
        sentence_field = "Sentece";
        audio_field = "SentenceAudio";
        image_field = "Picture";
        note_tag = "subs2srs";
        menu_font_size = 24;
        menu_font_name = "Noto Serif CJK JP";
        ankiconnect_url = "127.0.0.1:8765";
        snapshot_format = "avif";
        snapshot_quality = 50;
        snapshot_width = -2;
        snapshot_height = 480;
        audio_padding = 0.5;
        opus_container = "m4a";
      };
    };
  };
}
