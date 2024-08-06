#!/bin/bash

# Function to check if changes exist
check_changes() {
    #git status --porcelain | grep "M "  # Adjust if needed for untracked files
     git status --porcelain | grep -E "^(M |U )"
}

# Function to auto commit and push changes
auto_commit_and_push() {
    if check_changes; then
        git add .
        git commit -m "Auto-commit changes" --quiet
        git push origin main --quiet
    fi
}

# Run auto commit and push in a loop
while true; do
    auto_commit_and_push
    sleep 10  # Adjust sleep time as needed (e.g., check every 10 seconds)
done
