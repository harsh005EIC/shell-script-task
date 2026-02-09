# File : 170877_harsh_shellscript_q8.sh
# Author : harsh kerai
# Date : 12 jan 2026
# Description : Create a script that checks the size of a specified directory
#		and warns if it exceeds a certain limit (e.g., 100MB).
#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q8_function.sh

while true
do

read -p "Enter directory name or path:(or exit)" dir
[[ "$dir" == "exit" ]] && echo "Exiting...." && break

check_dir "$dir" || continue
compare_size "$dir"
done
