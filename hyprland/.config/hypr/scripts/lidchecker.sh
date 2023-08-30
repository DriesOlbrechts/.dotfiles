#!/bin/bash

STATE="$(cat /proc/acpi/button/lid/LID/state)"
if [[ "$STATE" == *"closed" ]]; then
	hyprctl keyword monitor 'eDP-1, disable'
fi

