#!/bin/bash

bars=(
  "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"
)

clamp() {
  if [ "$1" -lt 0 ]; then
    echo 0
  elif [ "$1" -gt 31 ]; then
    echo 31
  else
    echo "$1"
  fi
}

cava -p ~/.config/cava/config | while IFS=';' read -ra values; do
  output=""

  for v in "${values[@]}"; do
    [[ "$v" =~ ^[0-9]+$ ]] || continue

    idx=$(clamp "$v")
    output+="${bars[$((idx / 4))]}"
  done

  echo "$output" >/tmp/mpdvisualiser
done
