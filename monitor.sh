#!/bin/bash

echo "======================================="
echo "       Linux System Health Report"
echo "======================================="

echo ""
echo "System Uptime:"
uptime

echo ""
echo "---------------------------------------"
echo "CPU Usage:"
top -bn1 | grep "Cpu"

echo ""
echo "---------------------------------------"
echo "Memory Usage:"
free -h

echo ""
echo "---------------------------------------"
echo "Disk Usage:"
df -h

echo ""
echo "---------------------------------------"
echo "Top 5 Processes Using CPU:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo ""
echo "---------------------------------------"
echo "Logged in Users:"
who

echo ""
echo "---------------------------------------"
echo "Load Average:"
uptime | awk '{print $9,$10,$11}'

echo ""
echo "======================================="
echo "        End of System Report"
echo "======================================="
