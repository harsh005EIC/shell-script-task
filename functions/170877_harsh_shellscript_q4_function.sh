#!/bin/bash

check_rev_string() {

    if [[ -z "$1" ]]; then
        echo "This is an empty string"
        return 1
    fi

    str=$(printf "%s" "$1" | tr -d '[:space:]' | tr 'A-Z' 'a-z')
    rev_str=$(printf "%s" "$str" | rev)

    if [[ "$str" == "$rev_str" ]]; then
        printf "The string '%s' is a palindrome.\n" "$1"
    else
        printf "The string '%s' is not a palindrome.\n" "$1"
    fi

    return 0
}

