#!/bin/bash

yabai --restart-service
skhd --restart-service

osascript -e 'display notification "yabai restarted" with title "Karabiner"'
