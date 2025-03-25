#!/bin/bash
source ./genit.sh

dir=$1
num_folders=$2
name_folders=$3
num_files=$4
ext_files=$5
file_size=$6

# Проверка на свободное место
disk_free=$(df / | grep / | awk '{print $4}')
if (( $(echo "$disk_free < 1048576" | bc -l) )); then
    echo "Error: you have less than 1 GB free space"
    exit 1
fi

# Проверка на кол-во аргументов
if [ $# -ne 6 ]; then
    echo "Enter 6 arguments"
    exit 1
fi

# Проверка на существование директории
if [ ! -d "$dir" ]; then
    echo "ERROR: No such directory"
    exit 1
fi

# [1] Проверка, что путь является абсолютным
if [[ "$dir" != /* ]]; then
    echo "ERROR: Path should start with /"
    exit 1
fi

# [2] Проверка на то, что количество вложенных папок целое число
if [[ ! "$num_folders" =~ ^[0-9]+$ ]]; then
  echo "ERROR: Second argument should be a positive integer number"
  exit 1
fi

# [3] Проверка имени файлов на буквы, а не символы или цифры
# !!!! НЕ БОЛЕЕ 7 знаков !!!!
if [[ ! "$name_folders" =~ ^[a-zA-Z]+$ ]] || [[ ${#name_folders} -gt 7 ]]; then
  echo "ERROR: Third argument should be letters and not exceed 7 characters"
  exit 1
fi

# [4] Проверка на то, что количество файлов целое число
if [[ ! "$num_files" =~ ^[0-9]+$ ]]; then
  echo "ERROR: Fourth argument should be a positive integer number"
  exit 1
fi

# [5] Проверка для расширения файла, до/после точки буквы
if [[ ! "$ext_files" =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
  echo "ERROR: Fifth argument should be in the format 'name.extension', where name is 1-7 letters and extension is 1-3 letters. Example: az.az"
  exit 1
fi

# Проверка для размера файлов
if [[ ! "$file_size" =~ ^([0-9]+)kb$ ]] || [[ ${BASH_REMATCH[1]} -le 0 ]] || [[ ${BASH_REMATCH[1]} -gt 100 ]]; then
  echo "ERROR: Sixth argument should be less than 100kb. Example: 4kb"
  exit 1
fi

echo "[1] Directory: $dir"
echo "[2] Number of folders: $num_folders"
echo "[3] Name of folders: $name_folders"
echo "[4] Number of files: $num_files"
echo "[5] Name and extension of files: $ext_files"
echo "[6] File size: $file_size"

create_folders "$num_folders" "$dir" "$name_folders"
create_files "$num_files" "$dir" "$ext_files" "$file_size"
distribute_files_to_folders "$dir" "$dir"

./log.sh "$dir"
