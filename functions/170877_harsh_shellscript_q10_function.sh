# File : 170877_harsh_shellscript_q10_function.sh
# Author : harsh kerai
# Date : 13 jan 2026
# Description : Create a script that generates a random password
#               of a given length using alphanumeric and special characters.

check_input(){

	length="$1"

	if [[ -z "$length" ]]; then
		echo "Password length cannot be empty."
	return 1
	fi

	if [ "$length" -le 0 ]; then
		echo "Password length must be greater than 0."
	return 1
	fi

	if ! [[ "$length" =~ ^[0-9]+$ ]]; then
		echo "Invalid input provided, this is not a numeric value."
	return 1
	fi
}

generate_password(){
length="$1"
chars='A-Za-z0-9!@#$%^&*()_+{}|:<>?~'
password=$(tr -dc "$chars" < /dev/urandom | head -c "$length")
echo "password: $password"
}
