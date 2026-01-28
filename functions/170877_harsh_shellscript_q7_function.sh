check_user(){

if [ -z "$1" ]
then
echo "username can not be empty"
return 1
fi

if id "$1" &>/dev/null; then
    echo "User '$1' already exists."
    return 1
fi

if [[ "$1" == *" "* ]]
then 
echo "username cant contain spaces"
return 1
fi

}
