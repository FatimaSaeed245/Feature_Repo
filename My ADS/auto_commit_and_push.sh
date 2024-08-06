#!/bin/bash

# Function to check if changes exist
check_changes() {
    echo "Checking for changes..."
    git status --porcelain | grep -E "^(M |U )"
}

# Function to auto commit and push changes
auto_commit_and_push() {
    if check_changes; then
        echo "Changes detected. Adding, committing, and pushing..."
        git add .
        git commit -m "Auto-commit changes" --quiet
        git push origin main --quiet
        echo "Changes successfully committed and pushed."
    else
        echo "No changes detected."
    fi
}

# Run auto commit and push in a loop
while true; do
    auto_commit_and_push
    echo "Waiting for next check..."
    sleep 10  # Adjust sleep time as needed (e.g., check every 10 seconds)
done
