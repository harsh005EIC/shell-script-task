#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q18_function.sh

while true
do

read -p "input c file for checking coding standard (or exit):" cfile
[[ "$cfile" == "exit" ]] && echo "Exiting...." && break

check_cfile "$cfile" || continue

echo -e "this $cfile file follow coding standards "

done
