#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
PURPLE='\e[1;95m'
CYAN='\e[1;36m'
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[1;93m'
white='\e[1;37m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e ""
echo -e ""
echo -e ""
echo -e "  $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e  "  $white                  • SYSTEM MENU •                 "
echo -e "  $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   $green *[1]$NC $PURPLE Panel Domain$NC"
echo -e "   $green *[2]$NC $PURPLE Change Port All Account$NC"
echo -e "   $green *[3]$NC $PURPLE Autobackup Data VPS$NC"
echo -e "   $green *[4]$NC $PURPLE Backup Data VPS$NC"
echo -e "   $green *[5]$NC $PURPLE Restore Data VPS$NC"
echo -e "   $green *[6]$NC $PURPLE Webmin Menu$NC"
echo -e "   $green *[7]$NC $PURPLE Limit Bandwith Speed Server$NC"
echo -e "   $green *[8]$NC $PURPLE Check Running System Status Tunneling$NC"
echo -e "   $green *[9]$NC $PURPLE Check Usage of VPS Ram$NC"
echo -e "   $green *[10]$NC $PURPLE Reboot VPS$NC"
echo -e "   $green *[11]$NC $PURPLE Speedtest VPS$NC"
echo -e "   $green *[12]$NC $PURPLE Information Display System$NC"
echo -e "   $green *[13]$NC $PURPLE About Script Auto Install$NC"
echo -e "   $green *[14]$NC $PURPLE Install BBR$NC"
echo -e "   $green *[15]$NC $PURPLE Set Auto Reboot$NC"
echo -e "   $green *[16]$NC $PURPLE User Limit$NC"
echo -e "   $green *[17]$NC $PURPLE Clear Log$NC"
echo -e "   $green *[18]$NC $PURPLE Restart All Service$NC"
echo -e "   $green *[19]$NC $PURPLE Change Banner$NC"
echo -e "   $green *[20]$NC $PURPLE Cek Bandwith$NC"
echo -e "   $green *[21]$NC $PURPLE Reset Server$NC"
echo -e "   $green *[22]$NC $PURPLE Update To Last Version$NC"
echo -e "   $green *[23]$NC $PURPLE Kernel Update$NC"
echo -e "   $green *[24]$NC $white Menu Theme $NC"
echo -e "   $green *[25]$NC $red BACK TO MENU$NC"
echo -e   ""
read -p "     Select From Options [1-25 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; domain-menu ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; autobackup ; exit ;; #set.br
4) clear ; backup ; exit ;; #set.br
5) clear ; restore ; exit ;; #set.br
6) clear ; webmin ; exit ;;
7) clear ; limit-speed ; exit ;; #set.br
8) clear ; running ; exit ;;
9) clear ; ram ; exit ;;
10) clear ; reboot ; exit ;;
11) clear ; speedtest ; exit ;;
12) clear ; info ; exit ;;
13) clear ; about ; exit ;;
14) clear ; bbr ; exit ;;
15) clear ; auto-reboot ; exit ;;
16) clear ; user-limit ; exit ;;
17) clear ; clear-log ; exit ;;
18) clear ; restart ; exit ;;
19) clear ; nano /etc/issue.net ; exit ;; #ssh-vpn banner.conf
20) clear ; bw ; exit ;;
21) clear ; resett ; exit ;;
22) clear ; update ; exit ;;
23) clear ; kernel-updt ; exit ;;
24) clear ; menu-change ; exit ;;
25) clear ; menu ; exit ;;
x) exit ;;
*) echo "Please enter an correct number" ;;
esac
