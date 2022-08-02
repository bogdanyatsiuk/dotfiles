#!/bin/bash

space_number=$(yabai -m query --spaces --space | jq '.index')
yabai_mode=$(yabai -m config --space $space_number layout)

case "$yabai_mode" in
    bsp)
    sketchybar -m --set yabai_mode label=""
    ;;
    stack)
    sketchybar -m --set yabai_mode label="﯅"
    ;;
    float)
    sketchybar -m --set yabai_mode label=""
    ;;
esac
