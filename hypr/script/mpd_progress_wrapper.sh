#!/bin/bash

while true; do
  ~/.config/hypr/scripts/mpd_progress.sh >/tmp/mpdlock
  sleep 1
done
