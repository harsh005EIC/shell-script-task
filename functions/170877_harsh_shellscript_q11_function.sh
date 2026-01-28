get_cpu_usage() {
    local cpu
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    cpu=${cpu%.*}      # remove decimal
    echo "$cpu"
}

get_mem_usage(){
local mem
mem=$(free | grep "Mem:" | awk '{print $3/$2 * 100}')
mem=${mem%.*}
echo "$mem"
}

check_limit_cpu() {
    local threshold="$1"
    local usage="$2"

    if [[ $(echo "$usage >= $threshold" | bc ) -eq 1 ]]; then
        echo "CPU usage is ${usage}%. Exceeds threshold of ${threshold}%."
    else
        echo "CPU usage is ${usage}%. Within limit."
    fi
}

check_limit_mem() {
    local threshold="$1"
    local usage="$2"

    if [[ $(echo "$usage >= $threshold" | bc ) -eq 1 ]]; then
        echo "Memory usage is ${usage}%. Exceeds threshold of ${threshold}%."
    else
        echo "Memory usage is ${usage}%. Within limit."
    fi
}

check_threshold()
{

if [[ -z "$1" ]]
then
   echo " "$2" usage threshold cannotbe empty"
   return 1
fi

if [[ "$1" =~ ^-[0-9]+$  ]]
then
echo " "$2" usage threshold cannot be negetive."
return 1
fi

if ! [[ "$1" =~ ^[0-9]+(\.[0-9]+)?$ ]]
then
echo "invalid input provided this is a not numeric value for "$2""
return 1
fi

return 0
}
