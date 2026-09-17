#!/usr/bin/env bash

selection=$(cat <<EOF | fuzzel --dmenu
Shutdown
Reboot
Logout
EOF
)

case "$selection" in
  *"Shutdown")
    shutdown now ;;
  *"Reboot")
    reboot ;;
  *"Logout")
    niri msg action quit ;;
esac
