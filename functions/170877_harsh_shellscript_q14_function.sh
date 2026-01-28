validation() {
    local input_file="$1"

    if [[ -z "$input_file" ]]; then
        echo "file path can not empty"
        return 1
    fi

    # expand ~
    input_file="${input_file/#\~/$HOME}"

    if [[ "$input_file" != /* ]]; then
        input_file="$HOME/$input_file"
    fi

    if [[ "${input_file##*.}" != "txt" ]]; then
        echo "only .txt files are allowed"
        return 1
    fi

    if [[ ! -e "$input_file" ]]; then
        echo -e "the file\n$input_file\ndoes not exits"
        return 1
    fi

    if [[ ! -r "$input_file" ]]; then
        echo "cant read this file"
        return 1
    fi

    if [[ ! -s "$input_file" ]]; then
        echo -e "the file\n$input_file\nis empty"
        return 1
    fi

    # SUCCESS → return path
    echo "$input_file"
    return 0
}

word_freq(){
inout_file="$1" 
input_file="${input_file/#\~/$HOME}"

    if [[ "$input_file" != /* ]]; then
        input_file="$HOME/$input_file"
    fi
tr '[:upper:]' '[:lower:]' < "$input_file" \
| tr -c '[:alpha:]' '\n' \
| grep -v '^$' \
| sort \
| uniq -c \
| sort -nr \
| awk '{printf "%s - %d occurrences\n", $2, $1}'
}
