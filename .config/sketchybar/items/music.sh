MUSIC=(
    update_freq=5
    label.color=$SKY_BLUE
    icon.color=$SKY_BLUE
    script="$PLUGIN_DIR/music.sh"
    click_script="$PLUGIN_DIR/music_click.sh"
)

# Add event
sketchybar -m --add event song_update com.apple.iTunes.playerInfo

# Add Music Item
sketchybar --add item music center
sketchybar --set music "${MUSIC[@]}" \
           --subscribe music song_update \
