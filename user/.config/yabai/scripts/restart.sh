#!/bin/bash

# ~/dotfiles/scripts/runservice.sh yabai
# ~/dotfiles/scripts/runservice.sh sketchybar
launchctl stop homebrew.mxcl.yabai
launchctl start homebrew.mxcl.yabai

osascript -e 'display notification "yabai restarted" with title "Karabiner"'
