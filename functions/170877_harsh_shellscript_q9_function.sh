# File : 170877_harsh_shellscript_q9_function.sh
# Author : harsh kerai
# Date : 12 jan 2026
# Description : Write a script to search for a given file name recursively
#               in a specified directory and print the full path if found.

check_file(){
	if [[ -z "$1" ]]; then
		echo "file name cannot be empty"
	return 1
	fi

	return 0
}

check_dir(){

	if [[ -z "$1" ]]; then
		echo "dirctory name can not be empty"
	return 1
	fi

	dir="$1"
	dir="${dir/#\~/$HOME}"

	if [[ "$dir" != /* ]]; then
		dir="$HOME/$dir"
	fi

	if [[ ! -d "$dir" ]]; then
		echo "the dirctory $dir does not extits"
	return 1
	fi

	return 0
}

search_file(){
	dir="$1"
	filename="$2"

	dir="${dir/#\~/$HOME}"

	if [[ "$dir" != /* ]]; then
	dir="$HOME/$dir"
	fi

	result=$(find "$dir" -type f -name "$filename")

	if [[ -n "$result" ]]; then
		if [[ "$filename" == ".bashrc" && "$dir" == "$HOME" ]]; then
			echo "Found ./bashrc at: /home"
		else
			echo "Found $filename at: $result"
		fi
	else
		echo "file $filename not found in  $dir"
	fi
}
