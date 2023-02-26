#!/bin/bash

export IDENTIFIER="unicode"

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
# module import
. "$DIR/dwm_backlight.sh"
. "$DIR/dwm_battery_two.sh"
. "$DIR/dwm_date.sh"
. "$DIR/dwm_pulse.sh"
. "$DIR/dwm_xbps.sh"

BATF="$DIR/battery.txt"
DATEF="$DIR/date.txt"

while true; do
  dwm_battery_two > $BATF
  dwm_date > $DATEF
  sleep 60s
done &

while true; do
  DATE=$(< $DATEF)
  BRT=$(dwm_backlight)
  VOL=$(dwm_pulse)
  XBPS=$(dwm_xbps)
  BAT=$(< $BATF)
  xsetroot -name "| $DATE | $BRT | $VOL | $XBPS | $BAT"

  sleep 1s
done &
