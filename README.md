# Название выполняемого задания;
Научиться создавать пользователей и добавлять им ограничения

# Текст задания
Запретить всем пользователям кроме группы admin логин в выходные (суббота и воскресенье), без учета праздников

# Описание
Основной инициализированный скрипт, в нем добавлены комментарии к каждому блоку.

# Проверяем


> В скрипт добавлен так же проверка на понедельник, что бы тестировать было проше так как делал в понедельник if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" || [ $(date +%a) = "Mon" ]; then
{.is-info}

## Успешный вход
```bash
sergey@fedora:~/Otus/homework/16/vagrant$ ssh otusadm@192.168.50.122
otusadm@192.168.50.122's password: 
Welcome to Ubuntu 24.04 LTS (GNU/Linux 6.8.0-31-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Apr  7 05:47:28 AM UTC 2025

  System load:  0.0                Processes:             146
  Usage of /:   10.6% of 30.34GB   Users logged in:       1
  Memory usage: 19%                IPv4 address for eth0: 10.0.2.15
  Swap usage:   0%


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

Use of this system is acceptance of the OS vendor EULA and License Agreements.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

Last login: Mon Apr  7 05:35:53 2025 from 192.168.50.50
Could not chdir to home directory /home/otusadm: No such file or directory
$ 
```

## Не успешный вход
```bash
sergey@fedora:~/Otus/homework/16/vagrant$ ssh otus@192.168.50.122
otus@192.168.50.122's password: 
Permission denied, please try again.
otus@192.168.50.122's password: 
```