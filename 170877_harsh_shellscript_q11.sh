# File : 170877_harsh_shellscript_q11.sh
# Author : harsh kerai
# Date : 22 jan 2026
# Description : Write a script that monitors CPU and memory usage, logs the data to a file,
#		and alerts if usage exceeds a specified threshold.
#!/bin/bash
source /home/harsh005/shell_script/functions/170877_harsh_shellscript_q11_function.sh
LOG_FILE="$HOME/system_usage.log"
while true 
do
read -p "Enter the CPU usage threshold (e.g., 80 for 80%): " cpu_threshold
check_threshold "$cpu_threshold" "cpu" || continue

read -p "Enter the memory usage threshold (e.g., 90 for 90%): " mem_threshold
check_threshold "$mem_threshold" "memory"|| continue

cpu_use=$(get_cpu_usage)
memory_use=$(get_mem_usage)

echo "$(date '+%Y-%m-%d %H:%M:%S') | CPU: ${cpu_use}% | Memory: ${memory_use}%" >> "$LOG_FILE"

check_limit_cpu "$cpu_threshold" "$cpu_use"
check_limit_mem "$mem_threshold" "$memory_use"

read -p "Checking continue.....(or exit):" check
[[ "$check" == "exit" ]] && echo "Exiting..." && break
done
