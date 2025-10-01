
update() {
  case "$NAME" in
    "day")
      sketchybar --set $NAME label="$(date +%a)"
      ;;
    "date")
      sketchybar --set $NAME label="$(date +%d)"
      ;;
    "month")
      sketchybar --set $NAME label="$(date +%b)"
      ;;
  esac
}

case "$SENDER" in
  "routine") update 
;;
esac
