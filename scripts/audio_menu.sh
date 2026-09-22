#!/usr/bin/env bash

sinks=$(pactl list sinks | awk '
  /^Sink #[0-9]+/ { name=""; desc="" }
  /^\s+Name:/ { name=$2 }
  /^\s+Description:/ { 
    # Extract everything after "Description: "
    sub(/^\s+Description:\s*/, ""); 
    desc=$0 
    print desc " (" name ")"
  }
')

selection=$(echo "$sinks" | fuzzel --dmenu)
[ -z "$selection" ] && exit 0

sink_name=$(echo "$selection" | sed -n 's/.*(\(.*\))$/\1/p')
pactl set-default-sink "$sink_name"

# Optional: Move all currently playing audio streams to the newly selected sink
# pactl list sink-inputs short | awk '{print $1}' | while read -r input_id; do
#     pactl move-sink-input "$input_id" "$sink_name"
# done
