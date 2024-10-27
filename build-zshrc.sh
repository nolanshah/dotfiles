#!/bin/bash

CONFIGS=(
    "alias ll='ls -alhF'"
)
TARGET_FILE="$HOME/.zshrc"

GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# Check if the target file exists, or create it if it doesn't
if [ ! -f "$TARGET_FILE" ]; then
    touch "$TARGET_FILE"
    echo "created $TARGET_FILE"
fi

# Loop through each config and add it to the target file if not already present
for CONFIG in "${CONFIGS[@]}"; do
    if ! grep -qxF "$CONFIG" "$TARGET_FILE"; then
        echo "$CONFIG" >> "$TARGET_FILE"
        echo -e "${GREEN}added:${RESET} $CONFIG"
    else
        echo -e "${YELLOW}already exists:${RESET} $CONFIG"
    fi
done

echo -e "${GREEN}done.${RESET}"
