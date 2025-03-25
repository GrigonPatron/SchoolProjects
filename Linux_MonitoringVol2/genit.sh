#!/bin/bash

# Функция для создания папок
create_folders() {
    local num_folders=$1
    local main_dir=$2
    local name_folders=$3
    local date_suffix=$(date +"%d%m%y")

    # Начальное имя папки
    folder_name="${name_folders:0:1}"  # Берем первый символ из name_folders

    for ((i=1; i<=num_folders; i++))
    do
        # Проверяем длину имени папки и добавляем символы, если нужно
        while [[ ${#folder_name} -lt 4 ]]; do
            # Добавляем следующий символ из name_folders
            next_char_index=$(( ${#folder_name} % ${#name_folders} ))
            next_char="${name_folders:$next_char_index:1}"
            folder_name+="$next_char"
        done

        # Проверка на длину имени папки (не более 255 символов)
    if [[ ${#folder_name} -gt 255 ]]; then
        echo "Folder name exceeds 255 characters. Stopping the loop."
        break  # Выход из цикла, если длина имени превышает 255 символов
    fi

        # Создаем папку с текущим именем
        folder_path="${main_dir}${folder_name}_${date_suffix}"
        mkdir -p "$folder_path"
        echo "${folder_path}"

        # Генерируем новое имя папки, добавляя следующий символ из name_folders
        next_char_index=$(( ${#folder_name} % ${#name_folders} ))
        next_char="${name_folders:$next_char_index:1}"
        folder_name+="$next_char"
    done
}

create_files() {
    local num_files=$1
    local main_dir=$2
    local ext_files=$3
    local date_suffix=$(date +"%d%m%y")
    local file_size=$4

    # Разделяем имя и расширение
    local prefix="${ext_files%.*}"  # Часть до точки (например, "pq")
    local suffix="${ext_files#*.}"  # Часть после точки (например, "az")

    # Начальное имя файла
    local file_name="${prefix}"

    for ((j=1; j<=num_files; j++))
    do
        # Добавляем символы из prefix, пока имя файла не станет не менее 4 символов
        while [[ ${#file_name} -lt 4 ]]; do
            next_char_index=$(( ${#file_name} % ${#prefix} ))  # Индекс следующего символа
            next_char="${prefix:$next_char_index:1}"  # Следующий символ из prefix
            file_name+="$next_char"  # Добавляем символ к имени файла
        done

        # Проверка на длину имени файла (не более 255 символов)
    if [[ ${#file_name} -gt 255 ]]; then
        echo "File name exceeds 255 characters. Resetting to original prefix."
        break
    fi

        # Формируем полное имя файла
        full_file_name="${file_name}_${date_suffix}.${suffix}"
        file_path="${main_dir}${full_file_name}"

        # Создаем файл
        fallocate -l $file_size "$file_path"
        echo "Created file: $file_path"

        # Добавляем следующий символ из prefix для следующего файла
        next_char_index=$(( ${#file_name} % ${#prefix} ))
        next_char="${prefix:$next_char_index:1}"
        file_name+="$next_char"
    done
}

distribute_files_to_folders() {
    local source_dir=$1  # Директория с созданными файлами
    local target_dir=$2  # Директория с созданными папками

    # Получаем список файлов в source_dir
    local files=("$source_dir"/*)
    local num_files=${#files[@]}

    if [[ $num_files -eq 0 ]]; then
        echo "No files found in $source_dir"
        return
    fi

    # Получаем список папок в target_dir
    local folders=("$target_dir"/*/)
    local num_folders=${#folders[@]}

    if [[ $num_folders -eq 0 ]]; then
        echo "No folders found in $target_dir"
        return
    fi

    # Копируем все файлы в каждую папку
    for folder in "${folders[@]}"
    do
        for file in "${files[@]}"
        do
            # Проверяем, является ли элемент файлом
            if [[ -f "$file" ]]; then
                echo "Copying file: $file to folder: $folder"
                cp "$file" "$folder"
            else
                echo "Skipping non-file item: $file"
            fi
        done
    done
    # Удаляем исходные файлы после копирования
    for file in "${files[@]}"
    do
        if [[ -f "$file" ]]; then
            echo "Deleting original file: $file"
            rm "$file"
        fi
    done
}
