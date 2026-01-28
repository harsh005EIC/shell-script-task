#!/bin/bash
number_regex='^-?([0-9]+)(\.[0])?$'
float='^-?[0-9]+\.[1-9]+$'
validate_num1() {
    if [[ -z "$1" ]]; then
        echo "Num1 is not valid"
        return 1
    elif [[ $1 =~ $float ]];then
        echo "float is not valid"
        return 1
    elif ! [[ $1 =~ $number_regex ]]; then
        echo "num1 is not a valid number"
        return 1
    fi
    return 0
}

calculate() {
    n1=$1

   if (( $(echo "$n1 % 2 == 0" | bc) ))
      then 
     echo "$n1 is a even number"
   else 
     echo "$n1 is a odd number"
   fi
}
