#!/usr/bin/env sh

for sid in $(aerospace list-workspaces --all);
do
    # sketchybar --set space.$sid icon="$sid$(${CONFIG_DIR}/plugins/windows_count.sh $sid)"
    $(${CONFIG_DIR}/plugins/set_space_windows_count.sh $sid)
done
