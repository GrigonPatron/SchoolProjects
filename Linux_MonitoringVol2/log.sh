#!/bin/bash

# Путь к лог-файлу
log_file="log.txt"

# Очистка лог-файла, если он уже существует
> "$log_file"

# Функция для записи информации о папках и файлах
log_info() {
    local target_dir=$1

    # Поиск всех папок и файлов в целевой директории
    find "$target_dir" -type d -o -type f | while read -r item; do
        if [[ -d "$item" ]]; then
            # Если это папка, записываем только путь и дату создания
            creation_date=$(stat -c "%y" "$item" | cut -d '.' -f 1)
            echo "Folder: $item | Created: $creation_date" >> "$log_file"
        elif [[ -f "$item" ]]; then
            # Если это файл, записываем путь, дату создания и размер
            creation_date=$(stat -c "%y" "$item" | cut -d '.' -f 1)
            file_size=$(stat -c "%s" "$item")
            echo "File: $item | Created: $creation_date | Size: ${file_size} bytes" >> "$log_file"
        fi
    done
}

# Проверка аргументов
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi

log_info "$1"

echo "Log file created: $log_file"
