check_dir() {
    dir="$1"

    # Expand ~
    dir="${dir/#\~/$HOME}"

    # Convert relative to absolute
    if [[ "$dir" != /* ]]; then
        dir="$HOME/$dir"
    fi

    # Not exists
    if [[ ! -e "$dir" ]]; then
        echo "this '$dir' dirctory not found"
        return 1
    fi

    # Permission check
    if [[ ! -r "$dir" ]]; then
        echo "permission denied"
        return 1
    fi

    # File check
     if [[ -f "$dir" && "$(basename "$dir")" != .* ]]; then
        echo "this $(basename "$dir") file  is not in dirctory"
        return 1
    fi
    # Return normalized path
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

