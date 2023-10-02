#!/bin/bash

# Simulate ctrl + g
xdotool key ctrl+g

# Wait 500ms
sleep 0.5

# Simulate pressing 1
xdotool key 1

# Wait 250ms
sleep 0.25

# Simulate pressing enter
xdotool key Return

# Wait 250ms
sleep 0.25

# Insert text 'use client'
xdotool type "'use client';"

# Wait 250ms
sleep 0.25

# Simulate pressing enter
xdotool key Return

