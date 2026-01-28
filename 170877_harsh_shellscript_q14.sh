#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q14_function.sh

while true
do
read -p "Enter the text file path(or exit): " input_file
[[ "$input_file" == "exit" ]] && echo "Exiting...." && break

validation "$input_file" || continue

echo "Word frequency analysis:"

word_freq "$input_file"

done
