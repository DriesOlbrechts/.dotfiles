#!/bin/bash

HOSTNAME = "$(hostname)"
if [[ "$HOSTNAME" == "fedora" ]]; then
	STATE="$(cat /proc/acpi/button/lid/LID0/state)"
else	
	STATE="$(cat /proc/acpi/button/lid/LID/state)"
fi

COUNT="$(xrandr -q| grep -c "connected")"
if [[ "$COUNT" != 1 ]]; then
	if [[ "$STATE" == *"closed" ]]; then
		hyprctl keyword monitor 'eDP-1, disable' && wpaperd
	fi
fi
