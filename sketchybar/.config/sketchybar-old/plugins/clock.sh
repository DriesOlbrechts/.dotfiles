update() {
  case "$NAME" in
    "hour")
      sketchybar --set $NAME label="$(date +%H)"
      ;;
    "minutes")
      sketchybar --set $NAME label="$(date +%M)"
      ;;
  esac
}

case "$SENDER" in
  "routine") update 
;;
esac
