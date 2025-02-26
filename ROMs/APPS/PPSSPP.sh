#!/bin/sh

LOGFILE="/mnt/extsd/app.log"
echo "Launching PPSSPP!" > "$LOGFILE"

/mnt/extsd/bin/ppsspp/PPSSPPSDL >> "$LOGFILE" 2>&1
