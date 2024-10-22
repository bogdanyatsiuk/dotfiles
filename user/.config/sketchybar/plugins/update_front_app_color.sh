#!/usr/bin/env sh

focused_id=$(aerospace list-windows --focused --format "%{window-id}")

for wind_id in $(aerospace list-windows --workspace focused --format "%{window-id}");
do
    if [[ $wind_id = $focused_id ]]; then
        color=0xffffffff
    else
        color=0x90ffffff
    fi

    sketchybar --set "win.${wind_id}" icon.color="${color}"
done
