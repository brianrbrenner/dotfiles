#!/bin/bash

pkill -f blueman-applet
pkill -f nm-applet
pkill -f flameshot
pkill -f pasystray

nitrogen --restore &
picom &
#xfce4-power-manager &
pasystray &
blueman-applet &
nm-applet --indicator &
flameshot &
