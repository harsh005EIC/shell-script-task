# File : 170877_harsh_shellscript_q4_function.sh
# Author : harsh kerai
# Date : 8 jan 2026
# Description : Write a script to check if a given string is a palindrome.

#!/bin/bash

check_rev_string() {

	if [[ -z "$1" ]]; then
		echo "This is an empty string"
	return 1
	fi

	str=$(printf "%s" "$1" | tr -d '[:space:]' | tr 'A-Z' 'a-z')
	rev_str=$(printf "%s" "$str" | rev)

	if [[ "$str" == "$rev_str" ]]; then
		printf "The string '%s' is a palindrome.\n" "$1"
	else
 		printf "The string '%s' is not a palindrome.\n" "$1"
	fi

	return 0
}

