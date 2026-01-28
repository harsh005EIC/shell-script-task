#!/bin/bash
number_regex='^-?[0-9]+([.].[0-9]+)?$'

validate_num1() {
    if [[ -z "$1" ]]; then
        echo "Num1 is not valid"
        return 1
    elif ! [[ $1 =~ $number_regex ]]; then
        echo "num1 is not a valid number"
        return 1
    fi
        num="$1"
        digits=${num#[-+]}
        if (( ${#digits} > 10 )); then
        echo "Very large number"
        return 1
        fi
    return 0

}

validate_num2() {
    if [[ -z "$1" ]]; then
        echo "Num2 is not valid"
        return 1
    elif ! [[ $1 =~ $number_regex ]]; then
        echo "num2 is not a valid number"
        return 1
    fi
        num="$2"
        digits=${num#[-+]}
        if (( ${#digits} > 10 )); then
        echo "Very large number"
        return 1
        fi
    return 0
}

calculate() {
    n1=$1
    n2=$2 

    add=$(echo "$n1 + $n2" | bc)
    sub=$(echo "$n1 - $n2" | bc)
    mul=$(echo "$n1 * $n2" | bc)

    echo "Add:$add"
    echo "sub:$sub"
    echo "mul:$mul"

    if [[ $(echo "$n2 == 0" | bc) -eq 1 ]]; then
        if [[ $(echo "$n1 == 0" | bc) -eq 1 ]]; then
            echo "div : undefined"
        else
            echo "div : can not divide by zero instead error"
        fi
    else
        div=$(echo "scale=2; $n1 / $n2" | bc)
        echo "div : $div"
    fi

}
