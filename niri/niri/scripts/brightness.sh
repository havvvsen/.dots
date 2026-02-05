#!/usr/bin/env bash
set +e

usage="Usage: $0 [+] or [-]"

if [ "$#" -ne 1 ]; then
    echo "No direction parameter provided"
    echo "$usage"
    exit 1
fi

arg="$1"

if [ "$arg" == "help" ] || [ "$arg" == "--help" ] || [ "$arg" == "-h" ]; then
    echo "$usage"
    exit 0
fi

if [ "$arg" != "+" ] && [ "$arg" != "-" ]; then
    echo "Direction parameter must be '+' or '-'"
    echo $usage 
    exit 1
fi

direction=$arg

monitor_data=$(niri msg outputs | grep '^Output' | grep -oP '\(\K[^)]+')

focused_name=$(echo $monitor_data | niri msg focused-output | grep '^Output' | grep -oP '\(\K[^)]+')

if [ "$focused_name" == "eDP-1" ]; then
    if [ "$direction" == "-" ]; then
      swayosd-client --monitor "$(niri msg focused-output | grep '^Output' | grep -oP '\(\K[^)]+')" --brightness lower
    else
      swayosd-client --monitor "$(niri msg focused-output | grep '^Output' | grep -oP '\(\K[^)]+')" --brightness raise
    fi
else
  focused_id=1
    ddcutil --sleep-multiplier=.2 --display=$focused_id setvcp 10 $direction 3
fi
