#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q1_function.sh

while true; do
    echo
    read -p "Enter the first number (or exit): " num1
    [[ $num1 == "exit" ]] && echo "Exiting..." && break
    validate_num1 "$num1" || continue

    read -p "Enter the second number (or exit): " num2
    [[ $num2 == "exit" ]] && echo "Exiting..." && break

    validate_num2 "$num2" || continue

    calculate "$num1" "$num2"
done
