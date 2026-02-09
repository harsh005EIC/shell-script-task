# File : 170877_harsh_shellscript_q7_function.sh
# Author : harsh kerai
# Date : 12 jan 2026
# Description : Write a script that adds a new user to the system (requires root privileges) and sets
#               a default password.

check_user(){

	if [ -z "$1" ]
	then
		echo "username can not be empty"
	return 1
	fi

	if id "$1" &>/dev/null; then
		echo "User '$1' already exists."
	return 1
	fi

	if [[ "$1" == *" "* ]]
	then 
		echo "username cant contain spaces"
	return 1
	fi

}
