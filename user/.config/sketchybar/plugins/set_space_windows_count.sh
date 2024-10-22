#!/usr/bin/env sh

sketchybar --set space.$1 icon="$1$(${CONFIG_DIR}/plugins/windows_count.sh $1)"
