#!/usr/bin/env bash

rows=(
  " OS|$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
  "󰇄 Host|$(hostname)"
  " User|$(whoami)"
  "󰏖 Packages|$(qlist -I | wc -l) (emerge)"
  " Space|$(df -h / | awk 'NR==2 {print $4 " free / " $2 " total"}')"
  "󰒋 Kernel|$(uname -r)"
  " Uptime|$(uptime -p | sed 's/^up //')"
)

max=0
for row in "${rows[@]}"; do
  value="${row#*|}"
  ((${#value} > max)) && max=${#value}
done

width=$((max + 14))

{
  printf '┌'
  printf '%*s' "$width" '' | sed 's/ /─/g'
  printf '┐\n'
} >~/.config/fastfetch/temp/topbar

for row in "${rows[@]}"; do
  key="${row%%|*}"
  value="${row#*|}"

  word="$key $value"

  printf "│ %s%*s│" "$word" $(((width - ${#word}) - 1)) "" \
    > "$HOME/.config/fastfetch/temp/${key}.txt" #printf '│ %-*s │\n' "$width" "$key $value" \
done

{
  printf '└'
  printf '%*s' "$width" '' | sed 's/ /─/g'
  printf '┘\n'
} >~/.config/fastfetch/temp/bottombar

fastfetch
