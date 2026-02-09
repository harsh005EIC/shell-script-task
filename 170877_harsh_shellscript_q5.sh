# File : 170877_harsh_shellscript_q5.sh
# Author : harsh kerai
# Date : 9 jan 2026
# Description : Write a script that takes a directory as input,
#		creates a backup of all .txt files,
#		and stores them in a compressed archive with the current date as the filename.
# 		(create txt file in your home directory)
#!/bin/bash
while true
do

read -r -p "Enter the directory path to back up: " dir


dir="${dir/#\~/$HOME}"

if [[ "$dir" != /* ]]; then
    dir="$HOME/$dir"
fi

if [[ ! -d "$dir" ]]; then
    echo "Directory does not exist."
    continue
fi

if [[ -z "$(ls -A "$dir")" ]]; then
    echo "Directory is empty."
    continue
fi

date=$(date +%Y-%m-%d)
backup_file="$HOME/backup_$date.tar.gz"

if ! find "$dir" -type f -name "*.txt" | grep -q .; then
    echo "No .txt files found in $dir"
    continue
fi

(
  cd "$dir" || continue
  tar -czf "$backup_file" $(find . -type f -name "*.txt")
)

if [[ $? -eq 0 ]]; then
    echo "Backup of .txt files from $dir has been created with the filename: backup_$date.tar.gz"
else
    echo "Backup failed."
    continue
fi

done
