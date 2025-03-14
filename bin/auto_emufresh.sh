#!/bin/sh

LOGFILE="/mnt/extsd/app.log"
echo "Hiding empty systems!" > "$LOGFILE"


ROM_DIR="/mnt/extsd/ROMs"
EMU_DIR="/mnt/extsd/sections/emulators"
HIDDEN_DIR="$EMU_DIR/hidden"

is_empty() { # expects full dir path
	dir="$1"
	[ ! -d "$dir" ] && echo "no folder named $dir was found." && return 1

	for f in "$dir"/*; do
		if [ -e "$f" ] && [ "$f" != "/path/to/directory/." ] && [ "$f" != "/path/to/directory/.." ]; then
			echo "$dir is not empty."
			return 1
		fi
		echo "$dir is empty."
		return 0
	done


}

is_visible() { # expects basename of emu
	emu="$1"

	if [ -e "$EMU_DIR/$emu" ]; then
		echo "$emu is currently visible"
		return 0
	else
		echo "$emu is NOT currently visible"
		return 1
	fi
}

check_and_handle() { # expects basename of rom_subdir and basename of emufile
	rom_subdir="$1"
	emufile="$2"

	if is_empty "$ROM_DIR/$rom_subdir"; then
		if is_visible "$emufile"; then
			echo "moving $emufile to $HIDDEN_DIR"
			mv -f "$EMU_DIR/$emufile" "$HIDDEN_DIR/$emufile" 2>/dev/null
			echo ""
		fi
	else     ### rom subdir is not empty
		if ! is_visible "$emufile"; then
			echo "moving $emufile out of $HIDDEN_DIR"
			mv -f "$HIDDEN_DIR/$emufile" "$EMU_DIR/$emufile" 2>/dev/null
			echo ""
		fi
	fi
}

{

	mkdir -p "$HIDDEN_DIR"
	check_and_handle "ARCADE" "00 ARCADE"
	check_and_handle "NES" "01 NES"
	check_and_handle "SNES" "02 SNES"
	check_and_handle "N64" "03 N64"
	check_and_handle "GB" "04 GB"
	check_and_handle "GBC" "05 GBC"
	check_and_handle "GBA" "06 GBA"
	check_and_handle "GW" "07 GW"
	check_and_handle "VB" "08 VB"
	check_and_handle "POKE" "09 POKE"
	check_and_handle "SMS" "10 SMS"
	check_and_handle "SMD" "11 SMD"
	check_and_handle "DC" "12 DC"
	check_and_handle "GG" "13 GG"
	check_and_handle "PS" "14 PS"
	check_and_handle "PSP" "15 PSP"
	check_and_handle "TG16" "16 TG16"
	check_and_handle "NGPC" "17 NGPC"
	check_and_handle "WSC" "18 WSC"
	check_and_handle "PICO8" "19 PICO8"
	check_and_handle "APPS" "20 APPS"

} >> "$LOGFILE" 2>&1