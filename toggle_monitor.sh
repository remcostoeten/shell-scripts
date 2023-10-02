#!/bin/bash

# Check if the DP-0 monitor is connected
if xrandr | grep "DP-0 connected"; then
    # If DP-0 is off (i.e., not currently in use), turn it on and set it to the left of DP-2
    if ! xrandr | grep "DP-0 connected [0-9]*x[0-9]*+"; then
        xrandr --output DP-2 --primary --auto --output DP-0 --left-of DP-2 --auto
    else
        # If DP-0 is already on, then turn it off and only use DP-2
        xrandr --output DP-0 --off
    fi
fi

