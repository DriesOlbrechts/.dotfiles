#!/bin/bash

hour=(
	label="$(date +%H)"
	script="$PLUGIN_DIR/clock.sh"
	update_freq=30
)
minutes=(
	label="$(date +%M)"
	script="$PLUGIN_DIR/clock.sh"
	update_freq=30
)

sketchybar --add item hour left \
		   --set hour "${hour[@]}" \
		   --add item minutes left \
		   --set minutes "${minutes[@]}"
