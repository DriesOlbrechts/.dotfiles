#!/bin/bash
edit_action () {
    wl-paste | swappy -f -
}
COPY=(wl-copy -t image/png)
if [ $1 = "area" ]
then
    grim -g "$(slurp)" - | "${COPY}"
elif [ $1 = "screen" ]
then
    grim - | "${COPY}"
fi

wl-paste > /tmp/ss-dunst.png
ACTION=$(dunstify --action="default,Edit" -i /tmp/ss-dunst.png   "Screenshot copied to clipboard!")

case "$ACTION" in
"default")
    edit_action
    ;;
esac
