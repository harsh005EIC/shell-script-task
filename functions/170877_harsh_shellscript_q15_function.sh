username="$1" 
gid="$2"
firstname="$3"
taskname="$4"
module="$5"
taskid="$6"

check_validation(){

if [[ -z "$username" || -z "$gid" || -z "$firstname" || -z "$taskid" ]]; then
    echo "All inputs (username, GID, firstname, task ID) are required."
    return 1
fi

if ! [[ "$gid" =~ ^[0-9]+$ ]]; then
    echo "Enter valid GID"
    return 1
fi

if [[ "$gid" -ne 0 && ( "$gid" -lt 1000 || "$gid" -gt 999999 ) ]]; then
    echo "Enter valid GID"
    return 1
fi

if [[ "$taskname" == *" "* ]]; then
    echo "spaces not allowed in taskname use _"
    return 1
fi
}

directory_exists(){
main_dir="$1"

if [[ ! -d "$main_dir" ]]
 then
 echo ""$main_dir" not exists create directory "$main_dir""

else
  echo "directory already exists"
return 0
fi

}

sub_dir_check(){
main_dir="$1"
task_dir="$2"
if [[ -d "$main_dir" && ! -d "$task_dir" ]]
 then
echo "Folder exists making subfolders"
 fi
}

file_create(){
task_dir="$1"
extensions=(c h sh xls ko a so)
 for ext in "${extensions[@]}"; do
touch "${task_dir}/${gid}_${firstname}_${taskname}_${module}_${taskid}.${ext}"
done
echo "Files created successfully"
}
