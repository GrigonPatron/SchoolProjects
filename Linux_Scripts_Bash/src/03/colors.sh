#!/bin/bash

text_color=("\033[37;1;" "\033[37;1;" "\033[31;" "\033[32;" "\033[34;" "\033[35;" "\033[30;")
background_color=("107" "107" "41" "42" "44" "45" "40")

print_color() {
    local text_code="${text_color[$1]}"
    local bg_code="${background_color[$2]}"
    echo -n "${text_code}${bg_code}m "
}

print_color "$2" "$1"

print_color "$4" "$3"

echo "\033[0m "