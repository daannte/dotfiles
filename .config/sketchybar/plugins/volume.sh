source "$HOME/.config/sketchybar/icons.sh"

update() {
    VOLUME=$(osascript -e "output volume of (get volume settings)")
    MUTED=$(osascript -e "output muted of (get volume settings)")

    if [[ $MUTED != "false" ]]; then
        ICON="$VOLUME_MUTED_ICON"
        VOLUME=0
    else
        case ${VOLUME} in
            100) ICON="$VOLUME_HIGH_ICON" ;;
            [7-9][0-9]) ICON="$VOLUME_HIGH_ICON" ;;
            [3-6][0-9]) ICON="$VOLUME_MID_ICON" ;;
            [1-2][0-9]|[1-9]) ICON="$VOLUME_LOW_ICON" ;;
        esac
    fi


sketchybar -m \
    --set volume icon=$ICON \
    --set volume label="$VOLUME%"
}

mouse_clicked() {
  MUTED=$(osascript -e "output muted of (get volume settings)")
  if [[ $MUTED == "true" ]]; then
    osascript -e 'set volume output muted false'
  else
    osascript -e 'set volume output muted true'
  fi
  update
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
