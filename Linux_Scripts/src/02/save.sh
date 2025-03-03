#!/bin/bash

chmod +x output.sh

read -p "Save this information to a file? (Y/N) " choice

if [[ ${choice} =~ ^[Yy]$ ]]; then
  filename="$(date +'%d_%m_%y_%H_%M_%S').status"
  ./output.sh > "${filename}"
  echo "Saved to a file: ${filename}"
else
  echo "Not saved"
fi
