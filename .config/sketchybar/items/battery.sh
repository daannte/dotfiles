BATTERY=(
  update_freq=1
  icon.font="$FONT_ICON"
  icon.color=$SKY_BLUE
  label.color=$SKY_BLUE
  label.padding_right=10
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right
sketchybar --set battery "${BATTERY[@]}"

