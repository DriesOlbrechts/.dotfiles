#!/bin/bash

# config dir
EWW="eww -c $HOME/.config/eww/"
# monitor to focus back onto after done
FOC_MON_ID=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id')

# if daemon's not running do so
if [[ ! $(pidof eww) ]]; then
    ${EWW} daemon
    sleep 3
fi

# run bars on each monitor
MON_IDS=$(hyprctl monitors -j | jq -r '.[] | .id')
for MON_ID in $MON_IDS; do
    bar="bar$MON_ID"
    hyprctl dispatch focusmonitor $MON_ID
    $EWW open $bar
done

# focus back cause we're done
hyprctl dispatch focusmonitor $FOC_MON_ID
