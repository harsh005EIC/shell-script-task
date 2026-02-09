# File : 170877_harsh_shellscript_q12_function.sh
# Author : harsh kerai
# Date : 16 jan 2026
# Description : Write a script that generates a disk usage report
#               for all mounted file systems and saves it to a file.

check_valid_file(){
	if [[ -z "$1" ]]; then
		echo "output path cannot be empty"
	return 1
	fi

	output_file="$1"
	output_file="${output_file/#\~/$HOME}"

	if [[ "$output_file" != /* ]]; then
	output_file="$HOME/$output_file"
	fi

	if [[ "$output_file" != *.txt ]]; then
		echo "not valid file path. enter .txt file"
	return 1
	fi

	return 0
}

check_dir_path(){

	output_file="$1"
	dir_path=$(dirname "$output_file")

	if [[ ! -d "$dir_path" ]]; then
		echo "invalid file path"
	return 1
	fi

	return 0
}

generate_report(){

	output_file="$1"
	df -hT > "$output_file" 2>/dev/null

	if [[ $? -eq 0 ]]; then
		echo "Disk usage report generated and saved to $output_file."
	else
		echo "Failed to generate disk usage report."
	fi
}
