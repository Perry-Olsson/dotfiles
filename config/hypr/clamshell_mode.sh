#!/bin/bash

# Check if the lid is open or closed
if [ "$1" = "open" ]; then
    # Commands for when the lid is opened (e.g., re-enable internal monitor)
    # For example, to re-enable a monitor named eDP-1:
    # hyprctl keyword monitor "eDP-1, preferred, auto, auto"
    hyprctl keyword monitor "eDP-1, preferred, auto, auto" 
elif [ "$1" = "close" ]; then
    # Commands for when the lid is closed (e.g., disable internal monitor and suspend)
    # For example, to disable a monitor named eDP-1:
    # hyprctl keyword monitor "eDP-1, disable"
    hyprctl keyword monitor "eDP-1, disable"
    # To lock the screen when the lid closes (requires hyprlock):
    # hyprlock
fi

