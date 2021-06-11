#!/bin/sh
echo " [+] Starting Build Stage ..."
echo " [+] Making APT cache ..."
apt-get update
echo " [+] Installing Essential Packages ..."
apt-get install apt-utils bash-completion dialog nano locales tzdata -y
echo " [+] Installing Extend Packages ..."
echo " [+] Installing OpenSSH Server ... "
apt-get install openssh-server -y
echo " [+] Configuring OpenSSH Server ..."
mkdir /var/run/sshd ;\
sed -i "/PermitRootLogin/s/#Permit/Permit/" /etc/ssh/sshd_config ;\
sed -i "/PermitRootLogin/s/prohibit-password/yes/" /etc/ssh/sshd_config ;\
sed -i "s/UsePAM yes/#UsePAM yes/g" /etc/ssh/sshd_config ;\
echo " [+] Installing locales ..."
apt-get install locales -y
echo " [+] Finished Build Stage !"