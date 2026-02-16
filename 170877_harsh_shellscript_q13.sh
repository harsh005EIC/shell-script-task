# File : 170877_harsh_shellscript_q13.sh
# Author : harsh kerai
# Date : 22 jan 2026
# Description : Create a script that tracks and logs user logins and logout events, appending the data to a log file.
#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q13_function.sh
while true
do
read -p "Enter the log file path(or exit): " log_file
[[ "$log_file" == "exit" ]] && echo "Exiting...." && break

check_valid_log_file "$log_file" || continue

check_dir_path "$log_file" || continue

save_log_data "$log_file"

done
