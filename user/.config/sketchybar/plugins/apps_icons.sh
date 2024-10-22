#!/usr/bin/env sh

source ~/.config/sketchybar/icon_map.sh

sketchybar --remove "/win\./"

focused_id=$(aerospace list-windows --focused --format "%{window-id}")

windows=$(aerospace list-windows --workspace focused --format "%{window-id}@%{app-name}")
while IFS= read -r wind; do
    if [ -z "$wind" ]; then
        continue
    fi

    IFS='@'
    read -r wind_id app_name <<< "$wind"
    __icon_map "${app_name}"

    if [[ $wind_id = $focused_id ]]; then
        color=0xffffffff
    else
        color=0x90ffffff
    fi

    sketchybar --add item "win.${wind_id}" e                           \
        --set "win.${wind_id}" icon.font="sketchybar-app-font:Regular:19.0" \
        icon="${icon_result}" \
        icon.color="${color}" \
        icon.padding_left=5   \
        icon.padding_right=5  \
        label.padding_left=0  \
        label.padding_right=0 \
        click_script="aerospace focus --window-id ${wind_id}"
done <<< "$windows"
