CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c11

TARGET = s21_grep

SRC_CAT = s21_grep.c

all: clean s21_grep

s21_grep : clean
	$(CC) $(CFLAGS) $(SRC_CAT) -o s21_grep
	
clean:
	rm -f grep

rebuild: all