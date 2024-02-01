#!/bin/bash

setxkbmap -option caps:escape &
# compton &
picom &
# sleep 1;
# xrandr &
# xrandr -s 1920x1080 &
# /home/suson/.config/awesome/screen-layout-one.sh & # for one monitor
# /home/suson/.config/awesome/screen-layout-one-sws.sh & # for one monitor on sws
# /home/suson/.config/awesome/screen-layout-two-laptop.sh & # for one monitor on laptop
/home/suson/.config/awesome/screen-layout-two-laptop-same.sh & # for one monitor on laptop
# sleep 1;
# nitrogen --restore
# sleep 1;
libinput-gestures-setup start &
dbus-launch &
# sleep 1;
nm-applet --no-agent &
# /usr/bin/teams &
# /usr/bin/discord &
/usr/bin/flameshot &

eval "$(ssh-agent -s)" &
