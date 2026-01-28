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
    grep -iE "panic|segmentation fault" "$LOG_FILE"
elif $panic_found; then
    grep -i "panic" "$LOG_FILE"
elif $segfault_found; then
    grep -i "segmentation fault" "$LOG_FILE"
fi

read -p "continue or exit:" check
[[ "$check" == "exit" ]] && echo "Exiting...." && break

done
