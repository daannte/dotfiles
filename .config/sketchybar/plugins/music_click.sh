#!/usr/bin/env bash

music_state=$(osascript -e "tell application \"music\" to get player state as text")

if [[ $music_state == "paused" ]]; then
  osascript -e 'tell application "music" to play'
elif [[ $music_state == "playing" ]]; then
  osascript -e 'tell application "music" to pause'
fi

