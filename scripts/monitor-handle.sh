#!/usr/bin/env sh

if [[ "$1" == "init" ]]; then
    hyprctl keyword monitor "eDP-1, preferred, auto, 1"
fi

# Thank you @CodeWithCypert for the code!
if hyprctl monitors | grep -q 'HDMI-A-2'; then
    if [[ "$1" == "close" ]]; then
        hyprctl keyword monitor "eDP-1, disable"
        notify-send -a "Lid Status" "Lid is closing"
    elif [[ "$1" == "open" ]]; then
        hyprctl keyword monitor "eDP-1, preferred, auto, 1"
        notify-send -a "Lid Status" "Lid is opening"
    fi
fi