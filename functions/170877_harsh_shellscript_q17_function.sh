check_file(){
cfile="$1"
if [[ -z "$cfile" ]]; then
    echo -e "c file\ninput cannot be empty"
    return 1
fi
cfile="${cfile/#\~/$HOME}"
if [[ "${cfile##*.}" != "c" ]]; then
    echo "only .c file take as i/p"
    return 1
fi
if [[ ! -f "$cfile" ]]; then
    echo -e "$(basename "$cfile") file\ndoes not exits"
    return 1
fi
if [[ ! -s "$cfile" ]]; then
    echo -e "that file in log file\nempty"
    return 0
fi

return 0
}

compile_and_generate_logfile(){
cfile="$1"
cfile="${cfile/#\~/$HOME}"
logfile="$(basename "$cfile" .c).log"

# Compile
gcc "$cfile" -o temp_exec 2>/dev/null
if [[ $? -ne 0 ]]; then
    echo -e "log file\ninput cannot be empty"
    return 1
fi

./temp_exec > "$logfile"
echo "o/p stored in log file"

rm -f temp_exec
}
