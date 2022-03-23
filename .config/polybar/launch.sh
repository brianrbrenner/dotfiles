#!/usr/bin/env bash

# Terminate already running bar instances
kill -9 $(pgrep polybar)
# Launch main 

# Wait until the processes have been shut down
while pgrep polybar -x >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c $(dirname $0)/config.ini &

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar main_external -c $(dirname $0)/config.ini &
fi

polybar main 2> ~/polybar.log || cat ~/polybar.log

