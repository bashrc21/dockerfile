#!/bin/sh
# 设置root密码
echo " [+] Setting up root password ..."
echo 'root:rwfg65e!@w' | chpasswd
# 设置语言
echo " [+] Setting up Locale ..."
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
export LC_ALL="en_US.UTF-8"
# 设置时区
echo " [+] Setting up Timezone ..."
echo "Asia/Shanghai" > /etc/timezone
rm -f /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
echo " [+] Build Success !"