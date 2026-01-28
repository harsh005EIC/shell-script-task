#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q12_function.sh

while true
do

read -p "Enter the output file to save the disk usage report (or exit): " output_file
[[ "$output_file" == "exit" ]] && echo "Exiting..." && break
check_valid_file "$output_file" || continue

check_dir_path "$output_file" || continue

generate_report "$output_file" 

done
