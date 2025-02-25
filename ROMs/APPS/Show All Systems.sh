#!/bin/sh

EMU_DIR="/mnt/extsd/sections/emulators"
HIDDEN_DIR="$EMU_DIR/hidden"

for emu in "$HIDDEN_DIR"/*; do
	emu=$(basename "$emu")
	mv -f "$HIDDEN_DIR/$emu" "$EMU_DIR/$emu" 2>/dev/null
done