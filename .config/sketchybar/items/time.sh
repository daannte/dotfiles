TIME=(
  update_freq=1
  icon.font="$FONT_ICON"
  icon.color=$SKY_BLUE
  icon.padding_left=10
  background.color=$ITEM_BACKGROUND
  background.corner_radius=10
  label.padding_right=15
  label.color=$SKY_BLUE
  script="$PLUGIN_DIR/time.sh"
)

sketchybar --add item time right
sketchybar --set time "${TIME[@]}"
