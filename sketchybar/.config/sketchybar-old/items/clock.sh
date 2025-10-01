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

sketchybar --add item minutes right \
		   	--set minutes "${minutes[@]}" \
			--add item seperator right \
		   	--set hour ":" \
			--add item hour right \
		   	--set hour "${hour[@]}" \
