#!/usr/bin/env bash

# options to be displayed
option0=""
option1=""
option2="靖 "
option3="靖 "
option4="福 "
option5="福 "

# options to be displyed
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5"

dir="$HOME/.config/rofi/themes/material"

selected="$(echo -e "$options" | rofi -theme $dir/screenshot.rasi -lines 2 -dmenu)"
case $selected in
    $option0)
        ~/Code/dotfiles/scripts/screenshot.sh;;
    $option1)
        ~/Code/dotfiles/scripts/screenshot.sh --area;;
    $option2)
        ~/Code/dotfiles/scripts/screenshot.sh --full-in-3;;
    $option3)
        ~/Code/dotfiles/scripts/screenshot.sh --area-in-3;;
    $option4)
        ~/Code/dotfiles/scripts/screenshot.sh --full-in-10;;
    $option5)
        ~/Code/dotfiles/scripts/screenshot.sh --area-in-10;;
esac