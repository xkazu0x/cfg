#!/usr/bin/env bash

entries=$(cliphist list)
clear_entry="CLEAR CLIPBOARD HISTORY"

choice=$({
  echo "$clear_entry"
  printf '%s\n' "$entries" | cut -f2-
} | fuzzel --dmenu)

[ -z "$choice" ] && exit 0

if [ "$choice" = "$clear_entry" ]; then
  cliphist wipe
else
  printf '%s\n' "$entries" | grep -F $'\t'"$choice" | head -n1 | cliphist decode | wl-copy
fi
