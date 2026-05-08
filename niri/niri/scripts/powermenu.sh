#!/usr/bin/env bash

pkill fuzzel

OPTIONS="Lock\nSuspend\nHibernate\nReboot\nShutdown\nLogout"
PROMPT="  "
PLACEHOLDER="Choose an option"

CHOICE=$(echo -e "$OPTIONS" | fuzzel --dmenu -p "$PROMPT" --placeholder="$PLACEHOLDER")

case "$CHOICE" in
Lock)
  hyprlock
  ;;
Suspend)
  systemctl suspend
  ;;
Hibernate)
  systemctl hibernate
  ;;
Reboot)
  systemctl reboot
  ;;
Shutdown)
  systemctl poweroff
  ;;
Logout)
  niri msg action quit
  ;;
esac
