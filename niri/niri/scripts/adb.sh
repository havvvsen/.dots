#!/usr/bin/env bash
set -euo pipefail

ANDROID_LOGO="$HOME/.dots/.assets/icons/android.png"

# Check dependencies
for cmd in adb fuzzel grep awk; do
	if ! command -v "$cmd" >/dev/null 2>&1; then
		notify-send -i "$ANDROID_LOGO" "ADB script" "Error: '$cmd' is not installed or not in PATH." >&2
		exit 2
	fi
done

# Get mdns output and extract ip:port pairs (robust regex)
mdns_output="$(adb mdns services 2>/dev/null || true)"

# Extract ip:port occurrences (IPv4:port) and remove dups
mapfile -t addrs < <(
	printf '%s\n' "$mdns_output" |
		grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+' |
		sort -u
)

if [ "${#addrs[@]}" -eq 0 ]; then
	notify-send -i "$ANDROID_LOGO" "ADB script" "No ADB mdns services found. Make sure Wireless debugging is enabled on the phone." >&2
	exit 1
fi

# Let the user pick via fuzzel
choice="$(printf '%s\n' "${addrs[@]}" | fuzzel --dmenu --prompt "󰀲  " --placeholder "connect to ADB")" || true

# If user cancelled or nothing chosen
if [ -z "${choice:-}" ]; then
	exit 0
fi

if adb connect "$choice"; then
	notify-send -i "$ANDROID_LOGO" "ADB script" "Connected successfully to $choice"
	exit 0
else
	notify-send -i "$ANDROID_LOGO" "ADB script" "Failed to connect to $choice" >&2
	exit 3
fi
