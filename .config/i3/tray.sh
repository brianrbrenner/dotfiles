#!/bin/bash

pkill -f blueman-applet
pkill -f nm-applet
pkill -f flameshot
pkill -f pasystray

nitrogen --restore &
picom &
pasystray &
blueman-applet &
nm-applet --indicator &
flameshot &
