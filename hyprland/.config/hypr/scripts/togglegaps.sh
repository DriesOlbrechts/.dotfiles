GAPS=$(hyprctl getoption general:gaps_out -j | jq -r ".int")

if [ $GAPS -eq 0 ]; then
    ROUNDING=10
    GAPSOUT=10
    GAPSIN=5
else

    ROUNDING=0
    GAPSOUT=0
    GAPSIN=0
fi

hyprctl --batch "keyword decoration:rounding $ROUNDING ; keyword general:gaps_out $GAPSOUT ; keyword general:gaps_in $GAPSIN"
