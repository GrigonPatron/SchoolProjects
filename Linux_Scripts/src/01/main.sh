#!/bin/bash

if [ -z "$1" ]; then
    exit 1
fi

if [[ $1 =~ ^-?[0-9]+$ ]]; then
    echo "Numbers are not supported"
    exit 1
fi
echo "Your Flag is: $1"