check_valid_log_file()
{

local log_file="$1"

if [[ -z "$log_file" ]]; then
    echo "output file path not empty"
    return 1
fi

log_file="${log_file/#\~/$HOME}"
if [[ "$log_file" != /* ]]; then
    log_file="$HOME/$log_file"
fi

if [[ "${log_file##*.}" != "log" ]]; then
    echo "Enter valid file type"
    return 1
fi

return 0
}

check_dir_path(){
log_file="$1"
log_file="${log_file/#\~/$HOME}"
if [[ "$log_file" != /* ]]; then
    log_file="$HOME/$log_file"
fi

dir_path=$(dirname "$log_file")

if [[ ! -d "$dir_path" ]]; then
    echo "invalid file path"
    return 1
fi
return 0
}
save_log_data(){
log_file="$1"
log_file="${log_file/#\~/$HOME}"
if [[ "$log_file" != /* ]]; then
    log_file="$HOME/$log_file"
fi
{

    echo "Generated on: $(date)"
    echo
    echo "---- Currently Logged-in Users ----"
    who
    echo
    echo "---- Login / Logout History ----"
    last
} > "$log_file" 2>/dev/null

if [[ $? -eq 0 ]]; then
    echo "User login/logout tracking complete. Data saved to $log_file."
else
    echo "Failed to generate login tracking report."
fi
}
