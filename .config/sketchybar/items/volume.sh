VOLUME=(
  update_freq=30
  label.padding_right=15
  label.color=$SKY_BLUE
  icon.color=$SKY_BLUE
  script="$PLUGIN_DIR/volume.sh"
)

sketchybar --add item volume right
sketchybar --set volume "${VOLUME[@]}" \
           --subscribe volume volume_change mouse.clicked
