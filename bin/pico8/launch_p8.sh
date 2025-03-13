#!/bin/sh

LOGFILE="/mnt/extsd/app.log"
echo "Launching Pico-8!" > "$LOGFILE"

P8_DIR=/mnt/extsd/bin/pico8

if [ -f "$P8_DIR/pico8_dyn" ]; then

	export HOME="$P8_DIR"
	export LD_LIBRARY_PATH="$P8_DIR:$LD_LIBRARY_PATH"
	cd "$P8_DIR"
	
	if [ -z "$1" ]; then
		./pico8_dyn -splore >> "$LOGFILE" 2>&1
	else
		./pico8_dyn -run "$1" >> "$LOGFILE" 2>&1
	fi

else
	cd /mnt/extsd/retroarch
	./retroarch -v -c /mnt/extsd/retroarch/retroarch.cfg -L /mnt/extsd/retroarch/cores/fake08_libretro.so "$1"
fi