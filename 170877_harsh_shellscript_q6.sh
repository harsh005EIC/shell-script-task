#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q6_function.sh

while true
do
read -p "Enter process name:(or eixt) " process
[[ "$process" == "exit" ]] && echo "Exiting..." && break

check_process_runnnig "$process"
done
