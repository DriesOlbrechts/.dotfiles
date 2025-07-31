#!/bin/bash

day=(
	label="$(date +%a)"
	label.font="$FONT:Semibold:14"
	update_freq=60
	script="$PLUGIN_DIR/calendar.sh"
)
date=(
	label="$(date +%d)"
	update_freq=60
	script="$PLUGIN_DIR/calendar.sh"
)
month=(
	label="$(date +%b)"
	label.padding_right=16
	update_freq=60
	script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item day left \
		   --set day "${day[@]}" \
		   --add item date left \
		   --set date "${date[@]}" \
		   --add item month left \
		   --set month "${month[@]}"
