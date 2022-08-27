#!/usr/bin/env sh

counter=1
while [ $counter -le $1 ]
do
num=$(~/.config/sketchybar/plugins/windows_count.sh ${counter})
sketchybar --set space.${counter} icon="${counter}${num}"
((counter++))
done

