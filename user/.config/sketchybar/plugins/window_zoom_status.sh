#!/usr/bin/env sh

window=$(yabai -m query --windows --window)
zoom_status=""

if $(echo "$window" | jq '."has-fullscreen-zoom"')
then 
    zoom_status="ćFć"
elif $(echo "$window" | jq '."has-parent-zoom"')
then 
    zoom_status="ćPć"
fi

sketchybar -m --set window_zoom label=$zoom_status
