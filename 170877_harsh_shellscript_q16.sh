# File : 170877_harsh_shellscript_q16.sh
# Author : harsh kerai
# Date : 23 jan 2026
# Description : Write a script to  Read the Kernel log file to find the kernel panic 
#		segmentation fault messages with full line with timestamp.
#!/bin/bash

while true 
do

	LOG_FILE="/var/log/kern.log"

	if [[ ! -f "$LOG_FILE" ]]; then
		echo "Kernel log file not found"
	continue
	fi

	read -p "Enter fault type (panic / segfault): " input

	input=$(echo "$input" | xargs | tr 'A-Z' 'a-z')

	if [[ -z "$input" ]]; then
		echo "cannot take empty i/p"
	continue
	fi

# Flags
panic_found=false
segfault_found=false

# Check input
	[[ "$input" == *panic* ]] && panic_found=true
	[[ "$input" == *segfault* ]] && segfault_found=true

	if ! $panic_found && ! $segfault_found; then
		echo "there is no fault $input"
	continue
	fi

# Search logs
	if $panic_found && $segfault_found; then
		grep -iE "panic - not syncing|segfault" "$LOG_FILE"
	elif $panic_found; then
		grep -i "panic - not syncing" "$LOG_FILE"
	elif $segfault_found; then
		grep -i "segfault" "$LOG_FILE"
	fi

read -p "continue or exit:" check
[[ "$check" == "exit" ]] && echo "Exiting...." && break

done
