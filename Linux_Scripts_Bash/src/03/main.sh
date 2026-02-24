#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Enter 4 arguments"
    exit 1
fi

for parameter in "$@"; do
    if ! [[ $parameter =~ ^[1-6]$ ]]; then
        echo "Error. These arguments are not correct. Use from 1 to 6"
        exit 1
    fi
done

if [[ "$1" == "$2" || "$3" == "$4" ]]; then
    echo "Error. Two arguments or more are equal"
    exit 1
fi

Colors=$(bash ./colors.sh "$@")
bash ./print.sh $Colors