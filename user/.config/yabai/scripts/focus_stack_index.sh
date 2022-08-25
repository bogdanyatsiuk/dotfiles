#!/bin/bash

select="map(select(.\"stack-index\"==${1}))[0].id"
id=$(yabai -m query --windows --space | jq "$select")

yabai -m window --focus $id

