# File : 170877_harsh_shellscript_q3_function.sh
# Author : harsh kerai
# Date : 8 jan 2026
# Description : Write a script to compare three numbers and print the largest one
#!/bin/bash
number_regex='^-?[0-9]+(\.[0-9]+)?$'

validate_num(){

	if [[ -z "$1" ]]; then
		echo "$1 is not valid"
        return 1

	elif ! [[ $1 =~ $number_regex ]]; then
		echo "$1 is not a valid number"
        return 1

	fi

	num="$1"
	digits=${num#[-+]}

	if (( ${#digits} > 10 )); then
	echo "Cannot process large no."
	return 1
	fi

	return 0

}

calculate() {
	if (( $(echo "$1 >= $2 && $1 >= $3" | bc) )); then
		echo "$1 is largest"
	elif (( $(echo "$2 >= $3" | bc) )); then
		echo "$2 is largest"
	else
		echo "$3 is largest"
	fi
}

