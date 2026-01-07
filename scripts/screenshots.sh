#!/usr/bin/env bash

echo Hyprland Screenshot Ultility

set -e

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILENAME="Screenshot $(date '+%Y-%m-%d %H%M%S').png"
FILEPATH="$DIR/$FILENAME"

MODE="$1"

notify() {
  notify-send -a "Screenshots" "Screenshot Taken" "$FILEPATH"
}

copy_clipboard() {
  wl-copy < "$FILEPATH"
}

case "$MODE" in
  full)
    grim -c -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" "$FILEPATH"
    ;;

  region)
    grim -g "$(slurp)" "$FILEPATH"
    ;;

  window)
    GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    grim -g "$GEOM" "$FILEPATH"
    ;;

  *)
    echo "Usage: screenshot.sh {full|region|window}"
    exit 1
    ;;
esac

copy_clipboard
notify
