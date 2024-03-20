#!/bin/bash

HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep 'zone:' | awk '{print $3}')
OS=$(hostnamectl | grep 'Operating' | awk '{print $3, $4, $5}')
UPTIME=$(uptime -p | sed 's/^up*\s*//')
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(ifconfig | grep 'netmask' | grep -v '127.0.0.1' | awk '{print $2}')
MASK=$(ifconfig | grep 'netmask' | grep -v '127.0.0.1' | awk '{print $4}')
GATEWAY=$(ip route | grep 'default' | awk '{print $3}')
RAM_TOTAL=$(free | grep 'Mem:' | awk '{printf("%.3f", $2/1024/1024);}')
RAM_USED=$(free | grep 'Mem:' | awk '{printf("%.3f", $3/1024/1024);}')
RAM_FREE=$(free | grep 'Mem:' | awk '{printf("%.3f", $4/1024/1024);}')
SPACE_ROOT=$(df -B1 | awk 'NR==2{printf("%.2f", $2/1024/1024)}')
SPACE_ROOT_USED=$(df -B1 | awk 'NR==2{printf("%.2f", $3/1024/1024)}')
SPACE_ROOT_FREE=$(df -B1 | awk 'NR==2{printf("%.2f", $4/1024/1024)}')

if [ $(date +"%z" | cut -c2) == "0" ]
then
TIMEZONE="$TIMEZONE UTC $(date +"%z" | awk '{split($1, a, ""); print a[1]""a[3]}')"
else
TIMEZONE="$TIMEZONE UTC $(date +"%z" | awk '{split($1, a, ""); print a[1]""a[2]""a[3]}')"
fi
