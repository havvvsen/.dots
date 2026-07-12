#!/usr/bin/env bash

OPTIONS="dnd\nwlsunset\ncolor picker\nscreen record\nscreenshot\neasyeffects bypass\nqr code\nadb connect"
CHOICE=$(echo -e "$OPTIONS" | fuzzel --dmenu -p "> " --placeholder "choose an action" --lines 7)

case "$CHOICE" in
"dnd")
	~/.config/niri/scripts/dnd.sh
	;;
"wlsunset")
	~/.config/niri/scripts/wlsunset.sh
	;;
"color picker")
	~/.config/niri/scripts/colorpicker.sh
	;;
"screen record")
	~/.config/niri/scripts/record.sh
	;;
"screenshot")
	~/.config/niri/scripts/screenshot.sh
	;;
"easyeffects bypass")
	if [ "$(easyeffects --bypass 3)" = "0" ]; then
		easyeffects --bypass 1
	else
		easyeffects --bypass 2
	fi
	;;
"qr code")
	~/.config/swaync/scripts/qr.sh
	;;
"adb connect")
	~/.config/niri/scripts/adb.sh
	;;
esac
