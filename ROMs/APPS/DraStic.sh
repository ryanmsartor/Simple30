#!/bin/sh

LOGFILE="/mnt/extsd/app.log"
echo "Launching PPSSPP!" > "$LOGFILE"

export HOME=/mnt/extsd/bin/drastic
cd "$HOME"

./drastic32 >> "$LOGFILE" 2>&1
