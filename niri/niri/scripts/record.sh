#!/usr/bin/env bash

DOTS_DIR=".arch"

if pgrep wf-recorder >/dev/null; then
  TERMINATE_OPTIONS="Stop recording"
  TERMINATE_CHOICE=$(echo "$TERMINATE_OPTIONS" | fuzzel --dmenu -p " " --placeholder "recording ongoing")

  case "$TERMINATE_CHOICE" in
  Stop\ recording)
    notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/stop-button.png "Recording Stopped" "Stopped" -a 'Recorder' &
    pkill wf-recorder &
    ;;
  esac
else
  MONITORS_PROMPT="󰍹  "
  MONITORS_PLACEHOLDER="Select a monitor"

  getdate() {
    date '+%Y-%m-%d_%H.%M.%S'
  }

  getmonitors() {
    niri msg outputs | grep '^Output' | grep -oP '\(\K[^)]+'
  }

  getaudiooutput() {
    pactl list sources | grep 'Name' | grep 'monitor' | cut -d ' ' -f2
  }

  xdgvideo="$(xdg-user-dir VIDEOS)"
  if [[ $xdgvideo = "$HOME" ]]; then
    unset xdgvideo
  fi
  mkdir -p "${xdgvideo:-$HOME/Videos}"
  cd "${xdgvideo:-$HOME/Videos}" || exit

  MONITORS=$(getmonitors)
  FOCUSED_MONITOR=$(echo "$MONITORS" | fuzzel --dmenu -p "$MONITORS_PROMPT" --placeholder "$MONITORS_PLACEHOLDER")
  [ -z "$FOCUSED_MONITOR" ] && exit 0

  OPTIONS_PROMPT="󰻃  "
  OPTIONS_PLACEHOLDER="Select a mode"
  OPTIONS_MODE="Region\nRegion with sound\nFullscreen\nFullscreen with sound"
  OPTIONS_CHOICE=$(echo -e "$OPTIONS_MODE" | fuzzel --dmenu -p "$OPTIONS_PROMPT" --placeholder "$OPTIONS_PLACEHOLDER")
  [ -z "$OPTIONS_CHOICE" ] && exit 0

  case "$OPTIONS_CHOICE" in
  Region)
    if ! region="$(slurp 2>&1)"; then
      notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/cancel.png "Recording cancelled" "Selection was cancelled" -a 'Recorder'
      exit 1
    fi
    notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/record.png "Starting recording" 'recording_'"$(getdate)"'.mp4' -a 'Recorder'
    wf-recorder -o "$FOCUSED_MONITOR" --pixel-format yuv420p -f './recording_'"$(getdate)"'.mp4' -t --geometry "$region" &
    disown
    ;;
  Region\ with\ sound)
    if ! region="$(slurp 2>&1)"; then
      notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/cancel.png "Recording cancelled" "Selection was cancelled" -a 'Recorder'
      exit 1
    fi
    notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/record.png "Starting recording" 'recording_'"$(getdate)"'.mp4' -a 'Recorder'
    wf-recorder -o "$FOCUSED_MONITOR" --pixel-format yuv420p -f './recording_'"$(getdate)"'.mp4' -t --geometry "$region" --audio="$(getaudiooutput)" &
    disown
    ;;
  Fullscreen)
    notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/record.png "Starting recording" 'recording_'"$(getdate)"'.mp4' -a 'Recorder'
    wf-recorder -o "$FOCUSED_MONITOR" --pixel-format yuv420p -f './recording_'"$(getdate)"'.mp4' &
    disown
    ;;
  Fullscreen\ with\ sound)
    notify-send -i $HOME/"$DOTS_DIR"/.assets/icons/record.png "Starting recording" 'recording_'"$(getdate)"'.mp4' -a 'Recorder'
    wf-recorder -o "$FOCUSED_MONITOR" --pixel-format yuv420p -f './recording_'"$(getdate)"'.mp4' --audio="$(getaudiooutput)" &
    disown
    ;;
  esac
fi
