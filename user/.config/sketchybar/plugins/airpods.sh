#!/usr/bin/env bash

name="AirPods"
device=$(system_profiler SPBluetoothDataType -json -detailLevel basic | jq '.SPBluetoothDataType | .[0] | .device_connected' | grep "${name}" -A 12 -B 1)

get_level() {
    if [[ $1 -le 5 ]];  then
        echo "‼️${1}%"
    elif [[ "$1" -le 10 ]]; then
        echo "❗️${1}%"
    elif [[ "$1" -le 20 ]]; then
        echo "⚠️${1}%"
    elif [[ ! -z "${2}" ]]; then
        echo "${1}%"
    else
        echo ""
    fi
}

ALLWAYS_SHOW=""

if [[ ! -z $1 ]]; then # toggle always show
    ALLWAYS_SHOW=1
fi

if [ "$device" = "" ]; then
    sketchybar -m --set $name drawing=off
else
    sketchybar -m --set $name drawing=on

    llevel=$(echo $device | grep -Eo "batteryLevelLeft\":\s\"[0-9]{1,}" | grep -o '\d*')
    rlevel=$(echo $device | grep -Eo "batteryLevelRight\":\s\"[0-9]{1,}" | grep -o '\d*')
    clevel=$(echo $device | grep -Eo "batteryLevelCase\":\s\"[0-9]{1,}" | grep -o '\d*')

    left=$(get_level $llevel $ALLWAYS_SHOW)
    right=$(get_level $rlevel $ALLWAYS_SHOW)
    case=$(get_level $clevel $ALLWAYS_SHOW)

    if [[ ! -z "$left" ]]; then
        left="􀲌${left}"
    fi
    if [[ ! -z "$right" ]]; then
        right="􀲋${right}"
    fi
    if [[ ! -z "$case" ]]; then
        case="􀹨${case}"
    fi

    sketchybar -m --set $name label="$left $right $case"
fi

# cat devices.json | grep "AirPods" -A 10 | grep "batteryLevelLeft" | grep -o '\d*'
# echo $dev

# cat devices.json | grep "AirPods" -A 10 | grep "batteryLevelLeft"

# key=$(echo $dev | jq "[.[] | keys]|flatten|map(select(startswith(\"${name}\")))[0]")
# device=$(echo $dev | jq "map(select(has(${key})))[0] | .${key}" | sed -e "s/^\"//" -e "s/%\"$//")
# left=$(echo $device | jq '.device_batteryLevelLeft' | sed -e "s/^\"//" -e "s/%\"$//")
# right=$(echo $device | jq '.device_batteryLevelRight' | sed -e "s/^\"//" -e "s/%\"$//")
# case=$(echo $device | jq '.device_batteryLevelCase' | sed -e "s/^\"//" -e "s/%\"$//")

# echo $left
# echo $right
# echo $case
