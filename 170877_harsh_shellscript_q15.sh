# File : 170877_harsh_shellscript_q15.sh
# Author : harsh kerai
# Date : 23 jan 2026
# Description : File Globing  :  Create Files and Folders for  details entered :
#				 Take  linux  username,  GID , firstname, taskid  as input
#				 Script should Create main directory : GID_Firstname
#				 Script should create TaskName wise subfolders
#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q15_function.sh
while true
do
read -p "Enter Linux username: " username
read -p "Enter GID: " gid
read -p "Enter Firstname: " firstname
read -p "Enter Taskname: " taskname
read -p "Enter Module name: " module
read -p "Enter Task ID: " taskid

check_validation "$username" "$gid" "$firstname" "$taskname" "$module" "$taskid" || continue

main_dir="${gid}_${firstname}"
task_dir="${main_dir}/${taskname}"

directory_exists "$main_dir" || continue
mkdir -p "$main_dir"
sub_dir_check "$main_dir" "$task_dir"
mkdir -p "$task_dir"

file_create "$task_dir"

read -p "continue or exit:" check
[[ "$check" == "exit" ]] && echo "Exiting...." && break
done
