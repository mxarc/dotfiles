#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar for multiple monitors
# check if eDP1, DP-1 and DP-2 are connected

#polybar -q laptop_screen -c $DIR/config.ini &
screen=$(cat $HOME/.screenLayout)

if [ "$screen" == "docked-1" ]; then
  polybar -q main_screen -c $DIR/config.ini &
elif [ "$screen" == "docked-2" ]; then
  polybar -q main_screen -c $DIR/config.ini &
  polybar -q second_screen -c $DIR/config.ini &
elif [ "$screen" == "docked-3" ]; then
  polybar -q main_screen -c $DIR/config.ini &
  polybar -q second_screen -c $DIR/config.ini &
  polybar -q laptop_screen -c $DIR/config.ini &
else
  polybar -q laptop_single -c $DIR/config.ini &
fi
notify-send -i menu "Polybar" "Lauching profile $screen"
