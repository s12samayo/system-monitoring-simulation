#!/bin/bash

LOG_FILE="logs/system_health.log"
CPU_THRESHOLD=80
MEM_THRESHOLD=80

mkdir -p logs

for command in uptime top free awk grep tee; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Error: required command '$command' is not installed."
        exit 1
    fi
done

echo "============================" >> "$LOG_FILE"
echo "System check at: $(date)" >> "$LOG_FILE"

UPTIME_INFO=$(uptime -p 2>/dev/null || uptime)
echo "Uptime: $UPTIME_INFO" >> "$LOG_FILE"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100.0}')

echo "CPU Usage: ${CPU_USAGE}%" >> "$LOG_FILE"
echo "Memory Usage: ${MEM_USAGE}%" >> "$LOG_FILE"

if (( ${CPU_USAGE%.*} > CPU_THRESHOLD )); then
    echo "ALERT: CPU usage is above ${CPU_THRESHOLD}%" | tee -a "$LOG_FILE"
fi

if (( MEM_USAGE > MEM_THRESHOLD )); then
    echo "ALERT: Memory usage is above ${MEM_THRESHOLD}%" | tee -a "$LOG_FILE"
fi

echo "System check completed." >> "$LOG_FILE"
