#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q4_function.sh

while true;do
read -r -p "Enter a string (or exit) : " str
[[ $str == "exit" ]] && echo "Exiting...." && break
check_rev_string "$str" || continue
done

