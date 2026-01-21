#!/usr/bin/env bash
# Dependencies: gpu-screen-recorder, noctalia-shell, pipewire (all from NixOS)

set -euo pipefail

RECORD_DIR="${HOME}/Videos/Recordings/"
OUT_FILE="${RECORD_DIR}/Recording_$(date +%F_%H-%M-%S).mkv"
MONITOR="$(hyprctl activeworkspace -j | jq -r '.monitor')"
BIRTATE_MODE="qp"
FPS="30"
QUALITY="very_high"


echo
figlet "Screen Recording Utility" | lolcat
echo
echo A Bash script by Patin Muangjan
echo
echo Current Monitor: "$MONITOR"
echo Bitrate Mode: "$BIRTATE_MODE"
echo Quality: "$QUALITY"
echo Current FPS: "$FPS" FPS

if pgrep -x  "gpu-screen-reco" > /dev/null; then
    pkill -SIGINT gpu-screen-reco
    noctalia-shell ipc call toast send "{\"title\": \"Recorder\", \"body\": \"Recording saved to somewhere in $RECORD_DIR folder\", \"icon\": \"media-record\", \"duration\": \"6000\"}"
    exit
else
  noctalia-shell ipc call toast send "{\"title\": \"Recording\", \"body\": \"Recording on $MONITOR\", \"icon\": \"video\", \"duration\": \"6000\"}"
  gpu-screen-recorder -w "$MONITOR" -f "$FPS" -a default_output -o "$OUT_FILE" -bm "$BIRTATE_MODE" -q "$QUALITY" & disown
fi