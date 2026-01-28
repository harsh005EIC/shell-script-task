#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q17_function.sh
while true
do
read -p "Enter C file path(or exit): " cfile
[[ "$cfile" == "exit" ]] && echo "exiting...." && break
check_file "$cfile" || continue

compile_and_generate_logfile "$cfile" || continue

done
