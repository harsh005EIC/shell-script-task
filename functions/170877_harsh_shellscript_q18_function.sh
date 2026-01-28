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

    if grep -q "//" "$cfile"; then
        echo "// comments are not allowed. only multi line comments are allowed"
        return 1
    fi

    # Remove multi-line comments (robust)
    code_without_comments=$(sed '/\/\*/,/\*\//d' "$cfile")

    # Check if code remains
    if ! echo "$code_without_comments" | grep -q '[a-zA-Z]'; then
        echo "C file is not valid"
        return 1
    fi

    return 0
}

