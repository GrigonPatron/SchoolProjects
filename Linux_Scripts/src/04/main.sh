#!/bin/bash

# Подключение файла с функциями цветов
source ./colors.sh

# Чтение конфигурационного файла
config_file="config.conf"
if [[ -f "$config_file" ]]; then
    source "$config_file"
fi

# Установка значений по умолчанию, если они не заданы в конфигурационном файле
column1_background=${column1_background:-$default_column1_background}
column1_font_color=${column1_font_color:-$default_column1_font_color}
column2_background=${column2_background:-$default_column2_background}
column2_font_color=${column2_font_color:-$default_column2_font_color}

# Проверка значений и установка значений по умолчанию, если они недопустимы
if [[ ! "0 1 2 3 4 5 6" =~ $column1_background ]]; then
    column1_background=$default_column1_background
fi

if [[ ! "0 1 2 3 4 5 6" =~ $column1_font_color ]]; then
    column1_font_color=$default_column1_font_color
fi

if [[ ! "0 1 2 3 4 5 6" =~ $column2_background ]]; then
    column2_background=$default_column2_background
fi

if [[ ! "0 1 2 3 4 5 6" =~ $column2_font_color ]]; then
    column2_font_color=$default_column2_font_color
fi

# Получение системной информации
HOSTNAME=$(hostname)
USER=$(whoami)
DATE=$(date +"%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
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

# Функция для получения временной зоны
function time_func(){
    local timezone=$(timedatectl | grep "Time zone" | awk '{print $3 $4 $5}')
    echo "$timezone"
}

# Функция для получения имени операционной системы
function os_name(){
    local os=$(uname -a | awk '{print $1}')
    local distro=$(cat /etc/issue | awk '{print $1, $2, $3}' | tr -d '\n\l')
    echo "$os $distro"
}

# Вывод информации о системе
printf "$(print_color $column1_font_color $column1_background)HOSTNAME\033[0m = $(print_color $column2_font_color $column2_background)$HOSTNAME\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)TIMEZONE\033[0m = $(print_color $column2_font_color $column2_background)$(time_func)\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)USER\033[0m = $(print_color $column2_font_color $column2_background)$USER\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)OS\033[0m = $(print_color $column2_font_color $column2_background)$(os_name)\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)DATE\033[0m = $(print_color $column2_font_color $column2_background)$DATE\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)UPTIME\033[0m = $(print_color $column2_font_color $column2_background)$UPTIME\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)UPTIME_SEC\033[0m = $(print_color $column2_font_color $column2_background)$UPTIME_SEC\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)IP\033[0m = $(print_color $column2_font_color $column2_background)$IP\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)MASK\033[0m = $(print_color $column2_font_color $column2_background)$MASK\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)GATEWAY\033[0m = $(print_color $column2_font_color $column2_background)$GATEWAY\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)RAM_TOTAL\033[0m = $(print_color $column2_font_color $column2_background)$RAM_TOTAL\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)RAM_USED\033[0m = $(print_color $column2_font_color $column2_background)$RAM_USED\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)RAM_FREE\033[0m = $(print_color $column2_font_color $column2_background)$RAM_FREE\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)SPACE_ROOT\033[0m = $(print_color $column2_font_color $column2_background)$SPACE_ROOT\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)SPACE_ROOT_USED\033[0m = $(print_color $column2_font_color $column2_background)$SPACE_ROOT_USED\033[0m\n"
printf "$(print_color $column1_font_color $column1_background)SPACE_ROOT_FREE\033[0m = $(print_color $column2_font_color $column2_background)$SPACE_ROOT_FREE\033[0m\n"

# Вывод цветовой схемы
echo ""
echo "Column 1 background = $([ $column1_background -eq $default_column1_background ] && echo "default" || echo $column1_background) ($(get_color_name $column1_background))"
echo "Column 1 font color = $([ $column1_font_color -eq $default_column1_font_color ] && echo "default" || echo $column1_font_color) ($(get_color_name $column1_font_color))"
echo "Column 2 background = $([ $column2_background -eq $default_column2_background ] && echo "default" || echo $column2_background) ($(get_color_name $column2_background))"
echo "Column 2 font color = $([ $column2_font_color -eq $default_column2_font_color ] && echo "default" || echo $column2_font_color) ($(get_color_name $column2_font_color))"