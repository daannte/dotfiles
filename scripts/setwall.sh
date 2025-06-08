#!/bin/bash

WALLPAPERS="$HOME/Pictures/wallpapers"
IMAGE=$(find "$WALLPAPERS" -type f \( -iname '*.jpg' -o -iname '*.png' \) | fzf --prompt="Pick a wallpaper: ")

# Exit if nothing selected
[ -z "$IMAGE" ] && echo "No image selected." && exit 1

wallpaper set "$IMAGE"
