#!/bin/bash

dwm_xbps() {
  updates=$(xbps-install -Mun 2> /dev/null | wc -l)

  if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then
      printf "%s" "$SEP1"
      echo "  $updates"
      printf "%s\n" "$SEP2"
  else
      echo ""
  fi
}

