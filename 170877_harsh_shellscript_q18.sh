# File : 170877_harsh_shellscript_q18.sh
# Author : harsh kerai
# Date : 19 jan 2026
# Description : Write script which takes .c file as input and checks whether coding standards are applied .

#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q18_function.sh

while true
do

read -p "input c file for checking coding standard (or exit):" cfile
[[ "$cfile" == "exit" ]] && echo "Exiting...." && break

check_cfile "$cfile" || continue

echo -e "this $cfile file follow coding standards "

done
