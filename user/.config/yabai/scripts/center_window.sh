#!/bin/bash

disp_frame=$(yabai -m query --displays --display | jq '.frame')
wind_frame=$(yabai -m query --windows --window | jq '.frame')
disp_w="$(echo $disp_frame | jq -re ".w")"
disp_h="$(echo $disp_frame | jq -re ".h")"
wind_w="$(echo $wind_frame | jq -re ".w")"
wind_h="$(echo $wind_frame | jq -re ".h")"

ext_bar=30
w=`expr $disp_w - $wind_w`
h=`expr $disp_h - $wind_h - $ext_bar`
x=`expr $w / 2`
y=`expr $h / 2`
yabai -m window --move abs:$x:$y
# echo "X: $x, Y: $y"
