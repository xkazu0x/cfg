#!/usr/bin/env bash

entries=$(cliphist list)

choice=$(
  {
    echo "Clear clipboard history"
    printf '%s\n' "$entries" | cut -f2-
  } | fuzzel --dmenu
)

[ -z "$choice" ] && exit 0

if [ "$choice" = "Clear clipboard history" ]; then
  cliphist wipe
else
  printf '%s\n' "$entries" | grep -F $'\t'"$choice" | head -n1 | cliphist decode | wl-copy
fi
