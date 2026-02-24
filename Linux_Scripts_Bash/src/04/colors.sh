#!/bin/bash

# Массивы цветов по умолчанию

default_text_color=("\033[30;" "\033[37;" "\033[31;" "\033[32;" "\033[34;" "\033[35;" "\033[30;")
default_background_color=("40" "47" "41" "42" "44" "45" "40")

#default_text_color=("\033[37;1;" "\033[37;1;" "\033[31;" "\033[32;" "\033[34;" "\033[35;" "\033[30;")
#default_background_color=("107" "107" "41" "42" "44" "45" "40")

# Цвета по умолчанию для колонок
default_column1_background=1
default_column1_font_color=3
default_column2_background=4
default_column2_font_color=2

# Функция для вывода цветного текста
print_color() {
    local text_code="${default_text_color[$1]}"
    local bg_code="${default_background_color[$2]}"
    echo -n "\033[${text_code}${bg_code}m"
}

# Функция для получения имени цвета
get_color_name() {
    case $1 in
        0) echo "black" ;;
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        *) echo "default" ;;
    esac
}

# Функция для разукрашивания текста
color_text() {
    local background=$1
    local font_color=$2
    local text=$3

    # Выводим текст с указанными цветами фона и шрифта
    print_color $font_color $background
    echo -n "$text"
    echo -e "\033[0m"
}