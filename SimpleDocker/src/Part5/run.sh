#!/bin/bash
# Запускаем FastCGI сервер
spawn-fcgi -p 8080 -n /app/miniserver &
# Запускаем Nginx в foreground
exec nginx -g "daemon off;"