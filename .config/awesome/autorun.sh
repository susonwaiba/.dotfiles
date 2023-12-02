#!/bin/bash

setxkbmap -option caps:escape

# xrandr -s 1920x1080

# compton &
picom &
sleep 1;
/home/suson/.config/awesome/onescreenLayout.sh # for one monitor
# /home/suson/.config/awesome/screenLayoutTwoMonitor.sws.sh # for two monitor on sws
# /home/suson/.config/awesome/onescreenLayout.office.sh # for one monitor on office
# sleep 1;
# nitrogen --restore
sleep 1;
libinput-gestures-setup start &
dbus-launch &
# sleep 1;
# /usr/bin/teams &
# /usr/bin/discord &
# /usr/bin/discord &
# /usr/bin/flameshot &
