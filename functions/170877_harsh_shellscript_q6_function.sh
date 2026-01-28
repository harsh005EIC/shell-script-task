check_process_runnnig(){
if [[ -z "$1" ]]; then
    echo "invalid input"
    return 1
fi

    if pgrep -x "$process" > /dev/null; then
    echo "Process '$process' is running."
    return 0 
    else
    echo "Process '$process' is not running."
    return 1
    fi
}
