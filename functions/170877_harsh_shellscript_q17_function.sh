# File : 170877_harsh_shellscript_q17_function.sh
# Author : harsh kerai
# Date : 23 jan 2026
# Description : Generate the log file for any c program.

check_file(){

	cfile="$1"

	if [[ -z "$cfile" ]]; then
		echo "c file input cannot be empty"
	return 1
	fi

	cfile="${cfile/#\~/$HOME}"

	if [[ "$cfile" != *.c ]]; then
		echo "only .c file take as i/p"
	return 1
	fi

	if [[ ! -f "$cfile" ]]; then
		echo "$(basename "$cfile") file does not exits"
	return 1
	fi

	if [[ ! -s "$cfile" ]]; then
		echo "that file in log file empty"
	return 0
	fi

return 0
}

compile_and_generate_logfile(){

	cfile="$1"
	cfile="${cfile/#\~/$HOME}"
	logfile="$(basename "$cfile" .c).log"

	if ! gcc "$cfile" -o temp_exec 2>/dev/null; then
		echo "Compilation failed"
	return 1
	fi

	./temp_exec > "$logfile"
	echo "o/p stored in log file"

	rm -f temp_exec
}
