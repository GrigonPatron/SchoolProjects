#!/bin/bash

if [ $# -eq 0 ]; then
    chmod +x info.sh save.sh
    source ./info.sh
    source ./save.sh
else
    echo "Error: parametrs are not supported"
    exit 1
fi

exit 0
