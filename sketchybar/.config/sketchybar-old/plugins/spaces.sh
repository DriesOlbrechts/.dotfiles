#!/bin/bash

space_changed() {
	SPACE_INDEX=$(yabai -m query --spaces | jq '.[] | select(."has-focus" == true) | .index')
	sketchybar --set $NAME label="$SPACE_INDEX"
}

case "$SENDER" in
  "space_change") space_changed 
;;
  "display_change") space_changed
esac
