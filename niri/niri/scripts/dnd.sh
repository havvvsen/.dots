#!/usr/bin/env  bash

if [[ $(swaync-client -D) = *false* ]]; then
    notify-send "Do Not Disturb" "DND activated" -i ~/.dots/.assets/icons/nix.png
    sleep 1
    swaync-client -d
else 
    swaync-client -d
    notify-send "Do Not Disturb" "DND deactivated" -i ~/.dots/.assets/icons/nix.png
fi



    
    
    
