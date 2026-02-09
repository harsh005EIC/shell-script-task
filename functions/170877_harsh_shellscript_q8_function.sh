# File : 170877_harsh_shellscript_q8_function.sh
# Author : harsh kerai
# Date : 12 jan 2026
# Description : Create a script that checks the size of a specified directory
#               and warns if it exceeds a certain limit (e.g., 100MB).

check_dir() {
	dir="$1"

	dir="${dir/#\~/$HOME}"

	if [[ "$dir" != /* ]]; then
		dir="$HOME/$dir"
	fi

	if [[ ! -e "$dir" ]]; then
		echo "this '$dir' dirctory not found"
	return 1
	fi

	if [[ ! -r "$dir" ]]; then
		echo "permission denied"
	return 1
	fi

	if [[ -f "$dir" && "$(basename "$dir")" != .* ]]; then
		echo "this $(basename "$dir") file  is not in dirctory"
	return 1
    fi
    # Return path
    echo "$dir"
}

compare_size() {
	dir="$1"
	size_limit=100

	size=$(du -sm "$dir" 2>/dev/null | cut -f1)

	if [[ "$size" -gt "$size_limit" ]]; then
		echo "The size of the  directory '$dir' is ${size}MB. The size  exceeds the ${size_limit}MB limit!"
	else
		echo "The size of the  directory '$dir' is ${size}MB. The size is within the ${size_limit}MB limit."
	fi
}

