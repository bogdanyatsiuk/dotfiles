#!/bin/bash

id=$(yabai -m query --windows --window | jq '.id')
yabai -m window --space $1
yabai -m window --focus $id
