#!/bin/bash

declare -A monitors
highest_resolution=0
highest_res_monitor=""
lower_res_monitor=""

monitor_count=$(xrandr | grep connected | awk 'END {print NR}')

if [[ $monitor_count -eq 1 ]]; then
	hyprctl keyword monitor eDP-1,preferred,0x0,1
	hyprctl keyword monitor ,preferred,auto,1
else
	while read -r name resolution; do
	  # Extract width and height from resolution string
	  width=${resolution%%x*}
	  height=${resolution#*x}
	  height=${height%%+*}

	  # Calculate total number of pixels (assuming fixed pixel aspect ratio)
	  pixels=$((width * height))

	  # Update highest resolution and monitor if current one is greater
	  if [[ $pixels -gt $highest_resolution ]]; then
		highest_resolution=$pixels
		highest_res_monitor="$name"

	  else
		lower_res_monitor="$name"
	  fi
		monitors["$name"]="${width}x${height}"
	done < <(xrandr | grep connected | awk '{print $1, $3}')

	hyprctl keyword monitor $highest_res_monitor,preferred,auto,1
	hyprctl keyword monitor $lower_res_monitor,preferred,auto,1,mirror,$highest_res_monitor
fi



