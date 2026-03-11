#!/usr/bin/env bash

echo Hyprland Screenshot Ultility

set -e

GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILENAME="Screenshot $(date '+%Y-%m-%d %H%M%S').png"
FILEPATH="$DIR/$FILENAME"

MODE="$1"

notify() {
    noctalia-shell ipc call toast send "{\"title\": \"Screenshots\", \"body\": \"Screenshot saved to $FILEPATH\", \"icon\": \"camera\", \"duration\": \"6000\"}"
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
    grim -g "$GEOM" "$FILEPATH"
    ;;

  *)
    echo "Usage: screenshot.sh {full|region|window}"
    exit 1
    ;;
esac

copy_clipboard
notify
