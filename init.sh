# Создание пользователей
useradd otusadm
useradd otus

# Устанавливаем обои одинаковый пароль
echo otusadm:Otus2022! | chpasswd
echo otus:Otus2022! | chpasswd

# Создаем группу
groupadd -f admin

# Во вновь созданную группу добавляем пользователей otusadm root vagrant
usermod otusadm -a -G admin && usermod root -a -G admin && usermod vagrant -a -G admin

# Создаем скрипт, который проверяет какой сегодня день недели и вхождение текущего пользователя в групп admin
cat > /usr/local/bin/login.sh <<'endmsg'
#!/bin/bash
#Первое условие: если день недели суббота или воскресенье
if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" || [ $(date +%a) = "Mon" ]; then
#Второе условие: входит ли пользователь в группу admin
if getent group admin | grep -qw "$PAM_USER"; then
       #Если пользователь входит в группу admin, то он может подключиться
       exit 0
     else
       #Иначе ошибка (не сможет подключиться)
       exit 1
   fi
 #Если день не выходной, то подключиться может любой пользователь
 else
   exit 0
fi
endmsg

# Даем права на запуск скрипта
chmod +x /usr/local/bin/login.sh

# Добавляем 'auth required pam_exec.so debug /usr/local/bin/login.sh' в файл /etc/pam.d/sshd 
cat > /etc/pam.d/sshd <<'endmsg'
@include common-auth
auth required pam_exec.so debug /usr/local/bin/login.sh
account    required     pam_nologin.so
@include common-account
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so close
session    required     pam_loginuid.so
session    optional     pam_keyinit.so force revoke
@include common-session
session    optional     pam_motd.so  motd=/run/motd.dynamic
session    optional     pam_motd.so noupdate
session    optional     pam_mail.so standard noenv # [1]
session    required     pam_limits.so
session    required     pam_env.so # [1]
session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so open
@include common-password
endmsg

