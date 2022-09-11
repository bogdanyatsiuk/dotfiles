#!/bin/bash

~/dotfiles/scripts/runservice.sh yabai
~/dotfiles/scripts/runservice.sh sketchybar

osascript -e 'display notification "yabai restarted" with title "Karabiner"'
