#!/bin/bash

status=$(mpc status)
song_line=$(mpc current)

time_info=$(echo "$status" | grep -o '[0-9]\+:[0-9]\+/[0-9]\+:[0-9]\+')
percent=$(echo "$status" | grep -o '([0-9]\+%)' | tr -d '()%')

# fallback if nothing playing
if [ -z "$percent" ]; then
  echo "No music"
  exit
fi

bar_len=20
filled=$((percent * bar_len / 100))

bar=""
for i in $(seq 1 $bar_len); do
  if [ $i -le $filled ]; then
    bar+="█"
  else
    bar+="░"
  fi
done

echo "$song_line"
echo "$bar $percent%"
echo "$time_info"
