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
	update_freq=60
	script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item month right \
			--set month "${month[@]}" \
			--add item date right \
			--set date "${date[@]}" \
			--add item day right \
			--set day "${day[@]}" \
