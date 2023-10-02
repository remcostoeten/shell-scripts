#!/bin/bash

# Check if xmodmap is available
if ! command -v xmodmap &> /dev/null; then
    echo "xmodmap is not installed. Please install it and try again."
    exit 1
fi

# Remap the End key to Backspace
xmodmap -e "keycode 115 = BackSpace"
echo "End key remapped to Backspace."

# Remap the CapsLock key to function as Left Shift
xmodmap -e "keysym Caps_Lock = Shift_L"
echo "CapsLock key remapped to Left Shift."
