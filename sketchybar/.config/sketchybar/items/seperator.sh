seperator=(
	label="───"
	label.font.size=8
	label.padding_right=12
)

sepname="sep$RANDOM"
sketchybar --add item $sepname "$1" \
		   --set $sepname "${seperator[@]}"
