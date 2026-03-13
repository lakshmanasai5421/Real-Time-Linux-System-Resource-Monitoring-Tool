# Linux System Monitoring Script

## Project Overview

The **Linux System Monitoring Script** is a Bash-based automation tool designed to monitor the health and performance of a Linux system. It collects key system metrics such as CPU usage, memory utilization, disk usage, active processes, and system uptime.

This script helps system administrators quickly analyze the system’s status and detect potential performance issues.

---

# Why This Project

In Linux environments, administrators frequently need to monitor system resources to ensure the server is functioning properly. Checking system metrics manually using different commands can be time-consuming.

This project automates the monitoring process and provides a quick **system health report**, helping administrators identify issues like:

* High CPU usage
* Low memory availability
* Disk space exhaustion
* Excessive running processes

---

# Technologies Used

* **Bash Scripting**
* **Linux System Commands**

  * `top`
  * `free`
  * `df`
  * `ps`
  * `uptime`
* **Cron Jobs** (for automation)

---

# Features

* Displays **CPU usage**
* Shows **memory usage**
* Checks **disk space**
* Lists **top CPU-consuming processes**
* Displays **system uptime**
* Shows **currently logged-in users**
* Supports **automated monitoring using cron jobs**

---

# How the Script Works

The script collects system metrics using the following Linux commands:

| Command   | Purpose                                  |
| --------- | ---------------------------------------- |
| `top`     | Displays CPU usage and running processes |
| `free -h` | Shows memory usage                       |
| `df -h`   | Displays disk space utilization          |
| `ps`      | Lists active processes                   |
| `uptime`  | Shows system uptime and load average     |

The script organizes these outputs into a **readable system health report**.

---

# Script Code

```bash
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
```

---

# How to Run the Script

## Step 1: Create the Script

Create a new script file.

```
nano monitor.sh
```

Paste the script code into the file and save it.

---

## Step 2: Give Execute Permission

```
chmod +x monitor.sh
```

---

## Step 3: Run the Script

```
./monitor.sh
```

The script will display a **system health report** showing CPU, memory, disk usage, and processes.

---

# Automating Monitoring with Cron

To run the script automatically at regular intervals:

### Open cron editor

```
crontab -e
```

### Add this line

```
*/5 * * * * /home/user/monitor.sh >> /home/user/system_report.log
```

This will run the script **every 5 minutes** and save the output to a log file.

---

# Checking Monitoring Logs

To view the monitoring logs:

```
cat system_report.log
```

or

```
tail system_report.log
```

---

# Example Output

```
Linux System Health Report

System Uptime:
10:22:33 up 2 days, 3:11

CPU Usage:
Cpu(s): 4.2%us, 1.3%sy, 94.5%id

Memory Usage:
Total: 8GB
Used: 3GB
Free: 5GB

Disk Usage:
/dev/sda1 100G 45G 55G
```

---
