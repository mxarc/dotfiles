#!/usr/bin/env bash

dir="$HOME/.config/rofi/themes/material"

rofi_command="rofi -theme $dir/monitor_menu.rasi"

# Options
laptop=""
single_external=""
double_external=""
laptop_and_single_external=" "
laptop_and_monitors=" "

# Variable passed to rofi
options="$laptop\n$single_external\n$double_external\n$laptop_and_single_external\n$laptop_and_monitors"

chosen="$(echo -e "$options" | $rofi_command -p "Monitor layout" -dmenu -selected-row 0)"
case $chosen in
$laptop)
    $HOME/Code/dotfiles/scripts/layouts/laptop
    ;;
$single_external)
    $HOME/Code/dotfiles/scripts/layouts/monitor
    ;;
$double_external)
    $HOME/Code/dotfiles/scripts/layouts/double_monitor
    ;;
$laptop_and_single_external)
    $HOME/Code/dotfiles/scripts/layouts/monitor_laptop
    ;;
$laptop_and_monitors)
    $HOME/Code/dotfiles/scripts/layouts/triple_monitor
    ;;
esac
