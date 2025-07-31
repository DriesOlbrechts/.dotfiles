space_index=$(yabai -m query --spaces | jq '.[] | select(."has-focus" == true) | .index')
space=(
	ignore_association=on
	script="$PLUGIN_DIR/spaces.sh"
	label=$space_index
	label.align=center
	label.padding_right=12
)
  sketchybar --add item space_item right \
	  		 --set space_item "${space[@]}" \
			 --subscribe space_item space_change \
			 --subscribe space_item display_change
