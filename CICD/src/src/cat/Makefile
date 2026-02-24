CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c11

TARGET = s21_cat

SRC_CAT = s21_cat.c

all: clean s21_cat

s21_cat : clean
	$(CC) $(CFLAGS) $(SRC_CAT) -o s21_cat
	
clean:
	rm -f s21_cat

rebuild: all