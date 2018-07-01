#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'
SSH_PORT=22

sudo apt-get update -y
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

sudo apt-get dist-upgrade -y
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET

sudo apt-get upgrade -y
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

sudo apt-get autoremove -y
echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET

yes | sudo ufw default deny incoming
echo -e $TEXT_YELLOW
echo 'UFW - Deny incoming...'
echo -e $TEXT_RESET

yes | sudo ufw default allow outgoing
echo -e $TEXT_YELLOW
echo 'UFW - Allow outgoing...'
echo -e $TEXT_RESET

sudo ufw allow ssh
echo -e $TEXT_YELLOW
echo 'Port 22 allowed...'
echo -e $TEXT_RESET

echo -e $TEXT_YELLOW
echo 'Which port would you like to open...'
echo -e $TEXT_RESET
read -p 'Port?: ' portvar
sudo ufw allow $portvar/tcp

yes | sudo ufw enable
echo -e $TEXT_YELLOW
echo 'UFW Enabled...'
echo -e $TEXT_RESET

yes | sudo ufw status verbose
echo -e $TEXT_YELLOW
echo 'UFW Status...'
echo -e $TEXT_RESET

yes | sudo apt-get install fail2ban
yes | sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
yes | sudo service fail2ban restart
echo -e $TEXT_YELLOW
echo 'Install and Restart Fail2Ban...'
echo -e $TEXT_RESET

echo -e $TEXT_RED_B
echo 'Install Complete - Rebooting your VPS!'
echo -e $TEXT_RESET

yes | sudo reboot


