#!/bin/bash

choice=$(printf " Shutdown\n󰜉 Reboot\n󰍃 Logout\n󰤄 Suspend" |
  rofi -dmenu -p "Power" \
    -theme ~/.config/rofi/dmenuConfig.rasi \
    -normal-window)

case "$choice" in
" Shutdown")
  sudo shutdown -h now
  ;;
"󰜉 Reboot")
  sudo reboot
  ;;
"󰍃 Logout")
  hyprctl dispatch exit
  ;;
"󰤄 Suspend")
  systemctl suspend
  ;;
esac
