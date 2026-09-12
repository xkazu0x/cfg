#!/usr/bin/env bash

declare -A sink_names
declare -A sink_descriptions
menu=""

# Build: sink_name -> sink_description
while IFS=$'\t' read -r name description; do
  sink_descriptions["$name"]="$description"
done < <(pactl list sinks | awk '
    /^[[:space:]]*Name:/ {
      name = $0
      sub(/^[^:]*:[[:space:]]*/, "", name)
    }
    /^[[:space:]]*Description:/ {
      description = $0
      sub(/^[^:]*:[[:space:]]*/, "", description)
      print name "\t" description
    }
  '
)

# Get sink names and IDs, then create the fuzzel menu
while IFS=$'\t' read -r id name _; do
    description="${sink_descriptions[$name]:-$name}"
    label="$description [$name]"
    menu+="$label"$'\n'
    sink_names["$label"]="$name"
done < <(pactl list short sinks)

[[ -z "$menu" ]] && exit 1

selected=$(printf '%s' "$menu" | fuzzel --dmenu --width=64)

[[ -z "$selected" ]] && exit 0

pactl set-default-sink "${sink_names[$selected]}"
