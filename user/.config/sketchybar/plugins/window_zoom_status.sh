#!/usr/bin/env sh

window=$(yabai -m query --windows --window)
zoom_status=""

if $(echo "$window" | jq '."has-fullscreen-zoom"')
then 
    zoom_status="〔F〕"
elif $(echo "$window" | jq '."has-parent-zoom"')
then 
    zoom_status="〔P〕"
fi

sketchybar -m --set window_zoom label=$zoom_status
