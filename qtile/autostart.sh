#!/bin/sh
# Called when qtile is started up

picom --config /home/martin/.config/picom/picom.conf &
feh --bg-scale /home/martin/Pictures/wallpapers/valley.jpg &
nm-applet &
