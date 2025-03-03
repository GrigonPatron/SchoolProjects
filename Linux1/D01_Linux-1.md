## Part 1. Установка ОС

```sh
cat /etc/issue
```

![etcissue!](images/etcissue.png)

## Part 2. Создание пользователя

1. Создание пользователя и добавление в группу adm:

```sh
sudo adduser lamer
```

![lamer](images/lamer.png)
2. Добавление пользователя в группу adm

```sh
sudo usermod -aG adm lamer
```

3. Вывод cat /etc/passwd

```sh
cat /etc/passwd
```

![etcpasswd](images/etcpasswd.png)

## Part 3. Настройка сети ОС

1. Называние машины вида user-1

```sh
sudo hostnamectl set-hostname user-1
```

2. Установка временной зоны, соответствующей текущему местоположению

```sh
sudo timedateclt set-timezone Europe/Moscow
```

3. Вывод названий сетевых интерфейсов:

```sh
ip link show
```

`lo` (loopback interface)- это виртуальный сетевой интерфейс, который используется для тестирования и диагностики сетевых соединений на локальном уровне. Он позволяет устройству отправлять сетевые пакеты самому себе.

4. Получение IP-адреса устройства от DHCP-сервера

```sh
ip addr show
```

DHCP - это сетевой протокол, который позволяет автоматически назначать подключаемым к сети устройствам IP-адреса и другие параметры конфигурации (напр. шлюзы, DNS-сервера).
5. Вывод внутреннего IP-адреса

```sh
ip route | grep default
```

Вывод внешнего IP-адреса

```sh
curl -s ifconfig.me
```

6. Задаем статичные настройки ip, gw, dns

```sh
sudo nano /etc/netplan/00-installer-config.yaml
```

![netplan](images/netplan.png)
затем применяем настройки netplan - эта утилита создана для настройки сети в операционных системах на базе Ubuntu

```
sudo netplan apply
```

7. Reboot и проверка новых сетевых настроек утилитой ping

```
ping -c 5 1.1.1.1
ping -c 5 www.ya.ru
```

![ping](images/ping.png)

## Part 4. Обновление ОС

```
sudo apt update && sudo apt upgrade
```

![upgrade](images/upgrade.png)

## Part 5. Использование команды  sudo

1. Разрешение пользователю, созданному в Part 2, выполнять команду `sudo`.

```sh
sudo usermod -aG sudo lamer
```

2. Назначение команды `sudo` - (от англ. "superuser do") позволяет пользователям выполнять команды с правами суперпользователя (root) или других пользователей, как указано в файле конфигурации `sudoers`
3. Изменение hostname ОС от имени пользователя и root правами
   ![hostname](images/hostname.png)

## Part 6. Установка и настройка службы времени

1. Настройка службы автоматической синхронизации времени
   ![timedatectl](images/timedatectl.png)
2. Вывод NTPSynchronized=yes : timedatectl show
   ![timeshow](images/timeshow.png)

## Part 7. Установка и использование текстовых редакторов 

```sh
sudo apt install vim nano mcedit
```

1. Создаем файл test_X.txt, где X -- название редактора, в котором создан файл.
   vim и сохранение выход  `:wq`
   ![vim](images/vim.png)
   nano сохранение выход `control+o и control+x`
   ![nano](images/nano.png)
   mcedit и сохранение и выход `выход F2 и F10`
   ![mcedit](images/mcedit.png)
2. Редактирование файла и замена никнейма на строку "21 School 21". Закрытие
   Vim редактирование с помощью `i `и выход без сохранения `q!`
   ![vimsave](images/vimsave.png)
   Nano редактирование и выход `control + x и N`
   ![images](images/nanosave.png)
   mcedit редактирование и выход `F10`, далее выбор стрелками на клавиатуре `No`
   ![mceditsave](images/mceditsave.png)
3. Редактирование, поиск слова по содержимому файла и замена слова на любое другое
   
   vim поиск с помощью `/`
   ![vimsearch](images/vimsearch.png)
   замена
   ![vimreplace](images/vimreplace.png)
   nano поиск `control + \`
   ![nanosearch](images/nanosearch.png)
   nano замена
   ![nanoreplace1.png](images/nanoreplace1.png)
   ![nanoreplace2.png](images/nanoreplace2.png)
   mcedit поиск
   ![mceditsearch](images/mceditsearch.png)
   ![mceditsearchsec](images/mceditsearchsec.png)
   mcedit замена
   ![mceditreplace1](images/mceditreplace1.png)
   ![mceditsearch3](images/mceditsearch3.png)
   ![mceditsearch4](images/mceditsearch4.png)

## Part 8. Установка и базовая настройка сервиса SSHD

1. Установка SSH

```sh
sudo apt install ssh
```

2. Автостарт службы SSHd при загрузке операционной системы

```sh
systemctl status sshd
```

```sh
sudo systemctl enable ssh
```

![autostartssh](images/autostartssh.png)
Разрешение на входящие соедининения по протоколу SSH
![autorstartssh2](images/autorstartssh2.png)
3. Перенастройка службы SSHd на порт 2022
Изменение конфигурационного файла sshd_config
![set2022port](images/set2022port.png)
перезапуск SSH службы
![restartssh](images/restartssh.png)
4. Показываем наличие процесса SSHd, используя команду ps
![psssh](images/psssh.png)
**Утилита `ps`** - отображает текущие процессы. 
**Флаги**:
`a` — показывает процессы всех пользователей.

`u` — отображает информацию в формате, который включает пользователя, владеющего процессом.

`x` — показывает процессы, которые не связаны с терминалом.

`|` - символ (pipe) используется для передачи вывода одной команды в в качестве ввода другой команды.

`grep ssh` - поиск текста по шаблону паттерну '**ssh**'.

5. Вывод команды netstat -tan после перезагрузки VM.
   ![netstat](images/netstat.png)
   **netstat** - утилита, отображающая информацию, в том числе о сетевых соединениях, маршрутизации
   Флаги `-t`: показывает только TCP-соединения; `-a`: ожидающие порты (listening ports); `-n`: показывает числовые адреса и номера портов.
   Столбцы: **Proto**: Указывает протокол, используемый для соединения.
   **Recv-Q и Send-Q**: Количество запросов в очередях на прием и отдачу на узле или компьютере.
   **Local Address**: Локальный IP-адрес и номер порта, на котором происходит прослушивание или установлено соединение.
   **Foreign Address**: Удаленный IP-адрес и номер порта, с которым установлено соединение. Формат также `IP:port`. Если соединение находится в состоянии LISTEN, то это поле будет `0.0.0.0:*` или `*:port`
   **State**: Состояние TCP-соединения.

## Part 9. Установка и использование утилит top, htop

1. Запуск `top`
   ![top](images/top.png)
2. uptime
   ![uptime](images/uptime.png)
3. Количество авторизованных пользователей 1 user
4. Средняя загрузка система![load](images/load.png)
5. Общее количество процессов![tasks](images/tasks.png)
6. Загрузка CPU![cpuload](images/cpuload.png)
7. Загрузка памяти ![mem](images/mem.png)![swap](images/swap.png)
8. pid процесса занимающего больше всего памяти (с помощью клавиши **M**). PID 765  ![pidmem](images/pidmem.png)
9. pid процесса занимающего больше всего процессорного времени (с помощью клавиши **P**). PID 1234 ![pidcpu](images/pidcpu.png)
10. htop, отсортированный по PID![htop](images/htop.png)
11. по PERCENT_CPU ![percentcpu](images/percentcpu.png)
12. по PERCENT_MEM![percentmem](images/percentmem.png)
13. по TIME![htoptime](images/htoptime.png)
14. отфильтрованный для процесса sshd![htopshh](images/htopshh.png)
15. syslog![htopsyslog](images/htopsyslog.png)
16. с выводом hostname, clock и uptime![htopsetting](images/htopsetting.png)

## Part 10. Использование утилиты fdisk

1. Запуск fdisk

```sh
fdisk -l
```

![fdisk](images/fdisk.png)
Имя логического тома /dev/vda
Размер 8 GiB - Количество секторов: 16777216
2. размер swap - 0
![sizeswap](images/sizeswap.png)

## Part 11. Использование утилиты df

1. Утилита `df` для корневого раздела ![df](images/df.png)
   Размер раздела - 5813344
   Размер занятого пространства - 2703284
   Размер свободного пространства - 2793852
   Процент использования - 50%
   Единица измерения - Килобайты
2. `df -Th` для корневого раздела![dfth](images/dfth.png)
   Размер раздела - 5.6GiB
   Размер занятого пространства - 2.6GiB
   Размер свободного пространства - 2.7GiB
   Процент использования - 50%
   Тип файловой системы - ext4

## Part 12. Использование утилиты du

Использование `du` для каталогов /home /var /var/log в блоках ![du](images/du.png)
в байтах ![dugb](images/dugb.png) Вывод содержимого var/log, используя `*`
```sh
sudo du -ha /var/log/* | less
```
![du*](images/du*.png)

## Part 13. Установка и использование утилиты ncdu

1. Установка утилиты `ncdu `![ncduinstall](images/ncduinstall.png)
2. Вывод размера папок для /home /var /var/log
   ![ncdustart](images/ncdustart.png)

## Part 14. Работа с системными журналами

1. Время последней успешной авторизации пользователя usernew 16:22
   ![logintime](images/logintime.png)
2. Метод вход tty ![metod](images/metod.png)
3. SSH перезапуск
   ![sshrestartpart14](images/sshrestartpart14.png)

## Part 15. Использование планировщика заданий CRON

1. Добавляем uptime в crontab ![crontab](images/crontab.png)
2. Найти в системных журналах строчки о выполнении uptime![cronuptimelog](images/cronuptimelog.png)
3. Вывод список текущих заданий для CRON ![crontask](images/crontask.png)
4. Удаление всех заданий из планировщика задач ![crontabremove](images/crontabremove.png) ![cronremove2](images/cronremove2.png)
