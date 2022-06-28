#!/bin/bash
# Screenshot wrapper
# Uses maim (which uses slop)
# "Friendship ended with scrot. Now maim is my best friend."

SCREENSHOTS_DIR=~/Pictures
TIMESTAMP="$(date +%Y.%m.%d-%H.%M.%S)"
#TIMESTAMP="$(date +%Y.%m.%d--%s)"
FILENAME=$SCREENSHOTS_DIR/$TIMESTAMP.screenshot.png
PHOTO_ICON_PATH=/usr/share/icons/Papirus-Dark/24x24/actions/stock_fullscreen.svg

countdown() {
    for sec in $(seq $1 -1 1); do
        dunstify -t 1000 --replace=699 -i $PHOTO_ICON_PATH "Screenshot" "Taking shot in: $sec"
        sleep 1
    done
    sleep 0.5
}

# -u option hides cursor
# -m option changes the compression level
#   -m 3 takes the shot faster but the file size is slightly bigger

if [[ "$1" = "--area" ]]; then
    # Area/window selection.
    notify-send "Screenshot" 'Select area to capture' -i $PHOTO_ICON_PATH
    maim -u -m 3 -s $FILENAME
    if [[ "$?" = "0" ]]; then # after screenshot message
        notify-send "Screenshot" "Screenshot saved" -i $PHOTO_ICON_PATH
        viewnior $FILENAME
    fi
elif [[ "$1" = "--full-in-3" ]]; then
    countdown '3'
    maim -u -m 3 $FILENAME
    if [[ "$?" = "0" ]]; then # after screenshot message
        notify-send "Screenshot" "Screenshot saved" -i $PHOTO_ICON_PATH
        viewnior $FILENAME
    fi
elif [[ "$1" = "--area-in-3" ]]; then
    countdown '3'
    maim -u -m 3 -s $FILENAME
    if [[ "$?" = "0" ]]; then # after screenshot message
        notify-send "Screenshot" "Screenshot saved" -i $PHOTO_ICON_PATH
        viewnior $FILENAME
    fi
elif [[ "$1" = "--full-in-10" ]]; then
    countdown '10'
    maim -u -m 3 $FILENAME
    if [[ "$?" = "0" ]]; then # after screenshot message
        notify-send "Screenshot" "Screenshot saved" -i $PHOTO_ICON_PATH
        viewnior $FILENAME
    fi
elif [[ "$1" = "--area-in-10" ]]; then
    countdown '10'
    maim -u -m 3 -s $FILENAME
    if [[ "$?" = "0" ]]; then # after screenshot message
        notify-send "Screenshot" "Screenshot saved" -i $PHOTO_ICON_PATH
        viewnior $FILENAME
    fi
elif [[ "$1" = "--clipboard" ]]; then
    notify-send "Screenshot" 'Select area to copy to clipboard' -i $PHOTO_ICON_PATH
    # Copy selection to clipboard
    #maim -u -m 3 -s | xclip -selection clipboard -t image/png
    maim -u -m 3 -s /tmp/maim_clipboard
    if [[ "$?" = "0" ]]; then # after screenshot
        xclip -selection clipboard -t image/png /tmp/maim_clipboard
        notify-send "Screenshot" "Copied selection to clipboard" -i $PHOTO_ICON_PATH
        rm /tmp/maim_clipboard
    fi
else
    # Full screenshot
    # add delay to prevent rofi menu from showing up in screenshot
    sleep 0.3
    maim -u -m 3 $FILENAME
    notify-send "Screenshot" "Screenshot saved" -i $PHOTO_ICON_PATH
    if [[ "$?" = "0" ]]; then # after screenshot message
        # Browse with viewnior
        viewnior $FILENAME
    fi
fi
