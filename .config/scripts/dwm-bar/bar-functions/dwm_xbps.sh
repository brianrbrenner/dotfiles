#!/bin/bash

dwm_xbps() {
  updates=$(xbps-install -Mun 2> /dev/null | wc -l)

  printf "%s" "$SEP1"
  if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then
      echo "  $updates"
  else
      echo ""
  fi
  printf "%s\n" "$SEP2"
}
