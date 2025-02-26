#!/bin/sh

LOGFILE="/mnt/extsd/app.log"
echo "Launching RetroArch!" > "$LOGFILE"

/mnt/extsd/retroarch/retroarch -v -c /mnt/extsd/retroarch/retroarch.cfg >> $LOGFILE 2>&1
