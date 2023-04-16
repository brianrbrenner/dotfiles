#!/bin/sh
# Dependencies: xbacklight

dwm_backlight () {
    if [ "$IDENTIFIER" = "unicode" ]; then
      printf "%s☀ %.0f%s\n" "$(xbacklight)"
    else
      printf "%sBRT %.0f%s\n" "$(xbacklight)"
    fi
}

dwm_backlight
