#!/bin/sh
echo " [+] Starting Pre-Build Stage ..."
/usr/bin/apt-get update
/usr/bin/apt-get upgrade -y
/usr/bin/apt-get autoclean
/usr/bin/apt-get clean
rm -rf /tmp/*
echo " [+] Finished Pre-Build Stage! "