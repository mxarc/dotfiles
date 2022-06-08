#!/usr/bin/env bash

dir="$HOME/.config/rofi/themes/material"

rofi_command="rofi -theme $dir/monitor_menu.rasi"

# Options
laptop="laptop"
single_external="single external"
double_external="double external"
laptop_and_monitors="all monitors"

# Variable passed to rofi
options="$laptop\n$single_external\n$double_external\n$laptop_and_monitors"

chosen="$(echo -e "$options" | $rofi_command -p "Monitor layout" -dmenu -selected-row 0)"
case $chosen in
$laptop)
    notify-send "aa" "monitor profile is $SCREEN_CURRENT_PROFILE"
    ;;
$single_external)
    smonitor
    ;;
$double_external)
    smonitor2
    ;;
$laptop_and_monitors)
    smonitor3
    ;;
esac
