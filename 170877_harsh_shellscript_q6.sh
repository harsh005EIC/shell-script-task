# File : 170877_harsh_shellscript_q6.sh
# Author : harsh kerai
# Date : 9 jan 2026
# Description : Create a script that checks if a specific process 
#		(given as an argument) is running and prints a message if it is not.
#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q6_function.sh

while true
do
read -p "Enter process name:(or eixt) " process
[[ "$process" == "exit" ]] && echo "Exiting..." && break

check_process_runnnig "$process"
done
