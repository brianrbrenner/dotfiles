#!/bin/bash

pkill -f pasystray
pkill -f blueman-applet
pkill -f nm-applet
pkill -f xfce4-power-manager

xfce4-power-manager &
pasystray --notify=all &
blueman-applet &
nm-applet --indicator &

