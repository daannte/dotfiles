#!/bin/sh
source "$HOME/.config/sketchybar/icons.sh"

LABEL=$(date '+%d %B %H:%M')
sketchybar --set $NAME icon="$CLOCK_ICON" label="$LABEL" 
