#!/usr/bin/env bash

pkill fuzzel

options="Snip\nScreen\nWindow"

choice=$(echo -e "$options" | fuzzel --dmenu -p "> ")

case "$choice" in 
Screen)
  niri msg action screenshot-screen
  ;;
Snip)
  niri msg action screenshot
  ;;
Window)
  niri msg action screenshot-window
  ;;
esac
