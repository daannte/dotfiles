#!/usr/bin/env sh

SPACE_ICONS=("􀀀" "􀀀" "􀀀" "􀀀" "􀀀" "􀀀" "􀀀" "􀀀" "􀀀" "􀀀")

SPACE_CLICK_SCRIPT='[ "$BUTTON" = "right" ] && (yabai -m space --destroy $SID; sketchybar --trigger space_change) || yabai -m space --focus $SID 2>/dev/null'

SPACE=(
  icon.padding_left=16
  label.padding_right=32
  icon.color=$DARK_NAVY
  icon.font="$FONT_ICON"
  icon.highlight_color=$SKY_BLUE
  label.drawing=off
  script="$PLUGIN_DIR/space.sh"
  click_script="$SPACE_CLICK_SCRIPT"
)

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left
  sketchybar --set space.$sid associated_space=$sid
  sketchybar --set space.$sid icon=${SPACE_ICONS[i]}
  sketchybar --set space.$sid "${SPACE[@]}"
done
