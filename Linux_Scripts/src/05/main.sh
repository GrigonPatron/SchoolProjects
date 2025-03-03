#!/bin/bash

chmod +x info.sh

if [ $# -ne 1 ]; then
    echo "ERROR: Please use only one argument"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "ERROR: No such directory"
    exit 1
fi

if [ "${1: -1}" != "/" ]; then
    echo "ERROR: Your path should end ""/"""
    exit 1
fi

./info.sh "$@"

echo "Script execution time (in seconds) = $SECONDS"
