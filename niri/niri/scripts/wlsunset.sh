#!/usr/bin/env bash

pkill fuzzel

options="day\nnight\noff"

choice=$(echo -e "$options" | fuzzel --dmenu -p "> ")

case "$choice" in
day)
	pkill wlsunset 2>/dev/null
	wlsunset -t 6500 -T 6501 -S 07:00 -s 19:00 -g 0.7 &

	;;
night)
	pkill wlsunset 2>/dev/null
	wlsunset -t 3500 -T 3501 -S 07:00 -s 19:00 -g 0.7 &

	;;
off)
	pkill wlsunset 2>/dev/null
	;;
esac
