#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"

sleep 1

APP_STATE=$(pgrep -x Music)
if [[ ! $APP_STATE ]]; then 
    sketchybar -m --set music drawing=off
    exit 0
fi

PLAYER_STATE=$(osascript -e "tell application \"Music\" to get player state as text")
if [[ $PLAYER_STATE == "stopped" ]]; then
    sketchybar --set music drawing=off
    exit 0
elif [[ $PLAYER_STATE == "playing" ]]; then
    icon=$PLAY_ICON
else
    icon=$PAUSE_ICON
fi

title=$(osascript -e 'tell application "Music" to get name of current track')

if [[ ${#title} -gt 20 ]]; then
    title=$(printf "$(echo $title | cut -c 1-20)...")
fi

artist=$(osascript -e 'tell application "Music" to get artist of current track')
if [[ ${#artist} -gt 20 ]]; then
    artist=$(printf "$(echo $artist | cut -c 1-20)...")
fi

sketchybar -m --set music icon="$icon"          \
    --set music label="${artist} - ${title}"    \
    --set music drawing=on
