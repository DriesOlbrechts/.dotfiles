#!/bin/bash

STATE="$(cat /proc/acpi/button/lid/LID/state)"

COUNT="$(xrandr -q| grep -c "connected")"
if [[ "$COUNT" != 1 ]]; then
	if [[ "$STATE" == *"closed" ]]; then
		hyprctl keyword monitor 'eDP-1, disable' && wpaperd
	fi
fi
