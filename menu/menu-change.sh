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
Lyellow='\e[93m'
white='\e[1;37m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"

function menu-1st() {
  echo "Are You Sure?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) make install ; break ;;
        No) exit ;;
    esac
done
clear
  rm -rf /usr/bin/menu
  wget -O /usr/bin/menu https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/menu.sh && chmod +x /usr/bin/menu
  clear
  echo -e "[ ${Lyellow}INFO${NC} ] Your Changes Installed Successfully "
  sleep 3
  clear
}
function menu-2nd() {
  echo "Are You Sure?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) make install ; break ;;
        No) exit ;;
    esac
done
clear
  rm -rf /usr/bin/menu
  wget -O /usr/bin/menu https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/menu2nd.sh && chmod +x /usr/bin/menu
  clear
  echo -e "[ ${Lyellow}INFO${NC} ] Your Changes Installed Successfully "
  sleep 3
  clear
}
function menu-3rd() {
  echo "Are You Sure?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) make install ; break ;;
        No) exit ;;
    esac
done
clear
  rm -rf /usr/bin/menu
  wget -O /usr/bin/menu https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/menu3rd.sh && chmod +x /usr/bin/menu
  clear
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 3
  clear
}
function menu-premium() {
  echo "Are You Sure?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) make install ; break ;;
        No) exit ;;
    esac
done
clear
  rm -rf /usr/bin/menu
  wget -O /usr/bin/menu https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/menuPremium.sh && chmod +x /usr/bin/menu
  clear
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 3
  clear
}
clear
echo -e ""
echo -e ""
echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e  " $white             • Menu Theme •          "
echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e " $green *[1] $white> $PURPLE Menu (Default)$NC"
echo -e " $green *[2] $white> $PURPLE Menu X lolcat (Colourful)$NC"
echo -e " $green *[3] $white> $PURPLE Menu Modified $NC"
echo -e " $green *[4] $white> $PURPLE Menu Premium $NC"
echo -e " $green *[5] $white> $red BACK TO MENU$NC"
echo -e " $Lyellow Another Menu Theme, Coming Soon!"
echo -e ""
echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e ""
read -p "     Select From Options [1-5 or x] :  " opt
echo -e   ""
case $opt in
  1)
   clear
   menu-1st
   ;;
  2)
   clear
   menu-2nd
   ;;
  3)
   clear
   menu-3rd
   ;;
  4)
   clear
   menu-premium
   ;;
  5)
   clear
   menu
   ;;
 x)
   clear
   exit
   ;;
*) echo "Please enter an correct number" ; sleep 1 ; menu-change;;
esac
