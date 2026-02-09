# File : 170877_harsh_shellscript_q2.sh
# Author : harsh kerai
# Date : 7 jan 2026
# Description : Create a script that checks if a given number is even or odd.
#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q2_function.sh

while true; do
    echo
    read -p "Enter the first number (or exit): " num1
    [[ $num1 == "exit" ]] && echo "Exiting..." && break
    validate_num1 "$num1" || continue

    calculate "$num1"
done
