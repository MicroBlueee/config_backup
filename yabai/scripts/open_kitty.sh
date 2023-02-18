#!/usr/bin/env bash

# Detects if iTerm2 is running
if ! pgrep -f "kitty" > /dev/null 2>&1; then
    open -a "/Applications/kitty.app"
else
    # Create a new window
    script='tell application "kitty" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "iTerm" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "kitty")
        open -a "/Applications/kitty.app"
    }
fi
