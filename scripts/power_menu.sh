#!/usr/bin/env bash

shutdown="Shutdown"
reboot="Reboot"
logout="Logout"

selection=$(cat <<EOF | fuzzel --dmenu --lines=3
$shutdown
$reboot
$logout
EOF
)

case "$selection" in
  *"$shutdown")
    shutdown now ;;
  *"$reboot")
    reboot ;;
  *"$logout")
    niri msg action quit ;;
esac
