#!/usr/bin/env sh

cur=$AEROSPACE_FOCUSED_WORKSPACE
prev=$AEROSPACE_PREV_WORKSPACE
bar_val=sketchybar --query space.$cur | jq '.icon.value | ltrimstr("$cur")'

space_val=$(${CONFIG_DIR}/windows_count.sh $cur --count)
$AEROSPACE_FOCUSED_WORKSPACE

if [[ $bar_val -eq $space_val ]]; then
    $(${CONFIG_DIR}/plugins/set_space_windows_count.sh $cur)
    $(${CONFIG_DIR}/plugins/set_space_windows_count.sh $prev)
fi
