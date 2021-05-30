#!/bin/sh

# Name of the file which stores the current state
state_file=$HOME/.config/keyboard_layout/current_layout
layouts_file=$HOME/.config/keyboard_layout/my_layouts

# Make sure that the file exists, initialize with 0 if necessary
[ -f "$state_file" ] || printf '0/n' > "$state_file"

# Read the next keyboard to use
read state < "$state_file"
echo init state: $state

# Increment the current state.
# Could also use state=$(( (state + 1) % 6 ))
if [ "$state" -ge $(wc -l "$layouts_file" | awk '{ print $1 }') ]
then
    state=1
else
    state=$((state + 1))
fi
echo new state: $state

new_layout=$(head -n "$state" "$HOME/.config/keyboard_layout/my_layouts" | tail -1)
echo $new_layout
setxkbmap $new_layout


# Update the state file for the next time the script runs.
printf '%s\n' "$state" > "$state_file"
