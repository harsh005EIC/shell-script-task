# File : 170877_harsh_shellscript_q10.sh
# Author : harsh kerai
# Date : 13 jan 2026
# Description : Create a script that generates a random password 
#		of a given length using alphanumeric and special characters.
#!/bin/bash

source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q10_function.sh

while true 
do
read -p "Enter the password length(or exit): " length
[[ "$length" == "exit" ]] && echo "exiting..." && break
check_input "$length" || continue

generate_password "$length"

done
