#!/usr/bin/env bash

options="on\noff"

choice=$(echo -e "$options" | fuzzel --dmenu --placeholder "toggle dnd" --lines 7)

case "$choice" in
"on")
  makoctl mode -a do-not-disturb
  ;;
"off")
  makoctl mode -r do-not-disturb
  ;;
esac

