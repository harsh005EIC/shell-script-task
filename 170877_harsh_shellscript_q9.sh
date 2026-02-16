# File : 170877_harsh_shellscript_q9.sh
# Author : harsh kerai
# Date : 21 jan 2026
# Description : Write a script to search for a given file name recursively
#		in a specified directory and print the full path if found.
#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q9_function.sh
while true 
do

read -p "enter the file name to search for(or exit): " filename
[[ "$filename" == "exit" ]] && echo "Exiting..." && break
check_file "$filename" || continue

read -p "Enter the directory to search(or exit): " dir
[[ "$dir" == "exit" ]] && echo "Exiting..." && break
check_dir "$dir" || continue

search_file "$dir" "$filename"

done
