#!/bin/bash
HOSTNAME=$(hostname)
USER=$(whoami)
DATE=$(date +"%d %b %Y %H:%M:%S")
UPTIME=$(uptime | awk '{print $3}' | tr -d ',')
UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)" seconds"
IP=$(ip a | grep 'inet' | grep -vE '127.0.0.1|::1' | grep -vE 'inet6' | awk '{print $2}' | cut -d/ -f1)
MASK=$(ifconfig | grep 'netmask' | grep -v '127.0.0.1' | awk '{print $4}')
GATEWAY=$(ip route | grep 'default' | awk '{print $3}')
RAM_TOTAL=$(awk '/MemTotal/ {printf "%.3f GB\n", $2 /1024 / 1024}' /proc/meminfo)
RAM_USED=$(free -h --total | awk '/^Mem:/ {printf "%.3f GB\n", $3 / 1024}')
RAM_FREE=$(free -h --total | awk '/^Mem:/ {printf "%.3f GB\n", $4 / 1024}')
SPACE_ROOT=$(df / | awk 'NR==2 {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df -BM / | awk 'NR==2 {printf "%.2f MB", $3}')
SPACE_ROOT_FREE=$(df -BM / | awk 'NR==2 {printf "%.2f MB", $4}')

function time_func(){
    local timezone=$(timedatectl | grep "Time zone" | awk '{print $3 $4 $5}')
    echo "$timezone"
}

function os_name(){
    local os=$(uname -a | awk '{print $1}')
    local distro=$(cat /etc/issue)
    echo "$os $distro"
}
