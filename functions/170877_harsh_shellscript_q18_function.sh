# File : 170877_harsh_shellscript_q18_function.sh
# Author : harsh kerai
# Date : 19 jan 2026
# Description : Write script which takes .c file as input and checks whether coding standards are applied .

check_cfile(){

	cfile="$1"

	if [[ -z "$cfile" ]]; then
		echo "C file cannot be empty input"
	return 1
	fi

	cfile="${cfile/#\~/$HOME}"

	if [[ "$cfile" != /* ]]; then
		if [[ -e "$HOME/$cfile" ]]; then
			cfile="$HOME/$cfile"
		else
			cfile="$(pwd)/$cfile"
		fi
	fi

	if [[ ! -e "$cfile" ]]; then
		echo "c file  "$cfile" does not exits"
	return 1
	fi

	if [[ "$cfile" != *.c ]]; then
		echo ".c files are allowed"
	return 1
	fi

	if [[ ! -s "$cfile" ]]; then
		echo "this "$cfile" file empty"
        return 1
	fi

if awk '

	BEGIN {
	in_block = 0
	in_string = 0
	}
{
	for (i = 1; i <= length($0); i++) {

	ch  = substr($0, i, 1)
	nxt = substr($0, i+1, 1)

	if (in_block) {
		if (ch == "*" && nxt == "/") {
		in_block = 0
		i++
		}
		continue
	}

	if (!in_string && ch == "/" && nxt == "*") {
		in_block = 1
		i++
		continue
		}

	if (ch == "\"" && substr($0, i-1, 1) != "\\") {
		in_string = !in_string
		continue
	}

	if (!in_string && ch == "/" && nxt == "/") {
	exit 1
	}
	}
}
END { exit 0 }
' "$cfile"
then
    echo "// comment NOT PRESENT"
else
    echo "// comment PRESENT"
fi


	code_without_comments=$(sed '/\/\*/,/\*\//d' "$cfile")
	if ! echo "$code_without_comments" | grep -q '[a-zA-Z]'; then
		echo "C file is not valid"
	return 1
	fi

return 0
}

