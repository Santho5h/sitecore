#! /bin/bash
printf "Timestamp\t\tMemory\t/root\tCPU\n"
MEMORY=$(free -m | awk 'NR==2{printf "\t%.2f%%\t", $3*100/$2 }')
DISK_ROOT=$(df -h | awk '$NF=="/"{printf "%s\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\n", $(NF-2)}')
TIME=$(date "+%Y.%m.%d %H:%M:%S")
printf "%s%s%s%s\n" "$TIME" "$MEMORY" "$DISK_ROOT"  "$CPU"
