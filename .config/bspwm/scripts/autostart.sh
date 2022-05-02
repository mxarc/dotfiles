#!/usr/bin/env bash

# Enable shortcuts
pgrep -x sxhkd >/dev/null || sxhkd &
# Monitor
#~/.screenlayout/monitor.sh &
# Bar
~/.config/polybar/launch.sh &
# Notifications
/usr/bin/dunst &
# Polkit
if [[ ! $(pidof polkit-gnome-authentication-agent-1) ]]; then
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi
# Wallpaper
nitrogen --restore &
# Dex
dex -a -s /etc/xdg/autostart/:~/.config/autostart/
# Picom
picom --experimental-backend -b &
# Network Applet
nm-applet --indicator &
# Cursor
xsetroot -cursor_name left_ptr &
# Low battery notifier
~/.config/bspwm/scripts/low_bat_notifier.sh &
