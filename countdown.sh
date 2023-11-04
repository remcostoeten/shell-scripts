#!/bin/zsh
export ALARMFILE=~/Music/alarm.mp3

# Function to parse a time unit and convert it to seconds
parse_unit_to_seconds() {
    unit=$1
    value=${unit%[a-z]*}
    unit_type=${unit##*[0-9]}
    case $unit_type in
    s) echo $value ;;
    m) echo $((value * 60)) ;;
    h) echo $((value * 3600)) ;;
    *) echo 0 ;;
    esac
}

# Calculate the total time in seconds from the input arguments
total_seconds=0
for arg in "$@"; do
    seconds=$(parse_unit_to_seconds $arg)
    if [ $seconds -eq 0 ]; then
        echo "Invalid input. Please use 'X hours' or 'X minutes' or 'X seconds."
        exit 1
    fi
    total_seconds=$((total_seconds + seconds))
done

# Countdown loop
while [ $total_seconds -gt 0 ]; do
    if [ $total_seconds -eq 2 ]; then
        echo "Hi"
    fi

    echo "Time remaining: $total_seconds seconds"
    sleep 1
    total_seconds=$((total_seconds - 1))
done

# Open the default audio player to play the alarm MP3 file when the countdown reaches 0 seconds
if [ $total_seconds -eq 0 ]; then
    xdg-open $ALARMFILE
fi

# Display a notification when the countdown reaches 0
notify-send "Countdown Timer" "Time's up!"
