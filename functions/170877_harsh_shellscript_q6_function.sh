# File : 170877_harsh_shellscript_q6_function.sh
# Author : harsh kerai
# Date : 9 jan 2026
# Description : Create a script that checks if a specific process
#               (given as an argument) is running and prints a message if it is not.

#1/bin/bash
check_process_runnnig(){
	if [[ -z "$1" ]]; then
		echo "invalid input"
	return 1
	fi

	if pgrep -x "$1" > /dev/null; then
		echo "Process "$1" is running."
	return 0

	else
		echo "Process "$1" is not running."
	return 1
	fi
}
