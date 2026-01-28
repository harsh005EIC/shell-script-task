#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q10_function.sh

while true 
do
read -p "Enter the password length(or exit): " length
[[ "$length" == "exit" ]] && echo "exiting..." && break
check_input "$length" || continue

generate_password "$length"

done
