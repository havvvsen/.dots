#!/usr/bin/env bash

OPTIONS="hex\nrgb\nhsl\nhsv\ncmyk"
PROMPT="  "
CHOICE=$(echo -e "$OPTIONS" | fuzzel --dmenu -p "$PROMPT" --placeholder "choose a format")

case "$CHOICE" in
"hex")
	hyprpicker -a -f hex
	;;
"rgb")
	hyprpicker -a -f rgb
	;;
"hsl")
	hyprpicker -a -f hsl
	;;
"hsv")
	hyprpicker -a -f hsv
	;;
"cmyk")
	hyprpicker -a -f cmyk
	;;
esac
