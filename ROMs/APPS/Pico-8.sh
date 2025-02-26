#!/bin/sh

LOGFILE="/mnt/extsd/app.log"
echo "Launching Pico-8!" > "$LOGFILE"

if [ -z "$1" ]; then
	cd /mnt/extsd/bin
	./pico8_dyn -splore >> "$LOGFILE" 2>&1
else
	cd /mnt/extsd/bin
	./pico8_dyn -run "$1" >> "$LOGFILE" 2>&1
fi