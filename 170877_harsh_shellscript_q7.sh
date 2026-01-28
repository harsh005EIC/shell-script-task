#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q7_function.sh

while true;do

# Check for root 
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

read -p "Enter the username to add:(or exit) " username
[[ "$username" == "exit" ]] && echo "Exiting...." && break

# Check if user already exists
check_user "$username" || continue

password="password123"

useradd -m "$username"

# Set password
echo "$username:$password" | chpasswd

echo "User '$username' has been added successfully with default password 'password'."

done
