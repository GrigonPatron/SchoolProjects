#!/bin/bash
set -e

echo "Adding server to known_hosts"
mkdir -p ~/.ssh
ssh-keyscan -H 192.168.100.44 >> ~/.ssh/known_hosts

echo "Copy s21_cat"
scp src/src/cat/s21_cat shadrict@192.168.100.44:~/
scp src/src/cat/mercedes.txt shadrict@192.168.100.44:~/
scp src/src/cat/ferrari.txt shadrict@192.168.100.44:~/
scp src/src/cat/rb.txt shadrict@192.168.100.44:~/


echo "Copy s21_grep"
scp src/src/grep/s21_grep shadrict@192.168.100.44:~/
scp src/src/grep/test.txt shadrict@192.168.100.44:~/
scp src/src/grep/test1.txt shadrict@192.168.100.44:~/
scp src/src/grep/test_grep.sh shadrict@192.168.100.44:~/

echo "Install binaries"
ssh shadrict@192.168.100.44 "
  sudo mkdir -p /usr/local/bin
  sudo cp ~/s21_cat /usr/local/bin/
  sudo cp ~/mercedes.txt /usr/local/bin/
  sudo cp ~/ferrari.txt /usr/local/bin/
  sudo cp ~/rb.txt /usr/local/bin/

  sudo cp ~/s21_grep /usr/local/bin/
  sudo cp ~/test.txt /usr/local/bin/
  sudo cp ~/test1.txt /usr/local/bin/
  sudo cp ~/test_grep.sh /usr/local/bin/
  sudo chmod +x /usr/local/bin/s21_cat /usr/local/bin/s21_grep
"

echo "Deploy done"
