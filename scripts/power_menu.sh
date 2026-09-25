#!/usr/bin/env bash

shutdown="SHUTDOWN"
reboot="REBOOT"
logout="LOGOUT"

selection=$(cat <<EOF | fuzzel --dmenu
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
