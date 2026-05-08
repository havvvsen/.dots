#!/usr/bin/env bash

OPTIONS="dnd\nadb connect\ncolor picker\nscreen record\nscreenshot\neasyeffects bypass\nqr code\nwlsunset"
CHOICE=$(echo -e "$OPTIONS" | fuzzel --dmenu -p "> " --placeholder "choose an action" --lines 7)

case "$CHOICE" in
"dnd")
    $HOME/.config/niri/scripts/dnd.sh
    ;;
"adb connect")
	~/.config/niri/scripts/adb.sh
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
"wlsunset")
	~/.config/niri/scripts/wlsunset.sh
	;;
esac
