#!/usr/bin/env bash

# options to be displayed
option0="full screen"
option1="area"

# options to be displyed
options="$option0\n$option1"

selected="$(echo -e "$options" | rofi -lines 3 -dmenu -p "screenshoot")"
case $selected in
    $option0)
        ~/Code/dotfiles/scripts/screenshot.sh;;
    $option1)
        ~/Code/dotfiles/scripts/screenshot.sh -s;;
esac