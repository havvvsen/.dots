EXTERNAL_MONITOR=HDMI-A-2

swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 600 'niri msg output ${EXTERNAL_MONITOR} off' \
  resume 'niri msg output ${EXTERNAL_MONITOR} on' \
  before-sleep 'swaylock -f'
