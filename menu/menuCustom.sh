#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
Lyell='\e[1;93m'
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
PURPLE='\e[1;95m'
CYAN='\e[1;36m'
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[1:93m'
white='\e[1;37m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[1;36m'
HIBlue="\033[1;94m"
colour=$(cat /var/lib/banner-name/colour)
colour1=$(cat /var/lib/banner-name/colour1)
MYIP=$(wget -qO- ifconfig.co);
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
else
    clear
		lan_net="eth0"
    typevps="KVM"
fi
clear
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
username=$(cat /var/lib/banner-name/username)
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
clear
echo -e ""
echo -e "  $colour ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e          "  $CYAN       Premium Server Script By Harithwyd        "
echo -e "  $colour ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo -e "  $green Isp Name          :$NC  $ISP"
  echo -e "  $green Domain            :$Lyellow  $domain"
  echo -e "  $green Ip Vps            :$Lyellow  $IPVPS"
  echo -e "  $green Operating System  :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
  echo -e "  $green Total Amount Of RAM :$NC  $tram MB"
  echo -e "  $green Used RAM          :$NC  $uram MB"
  echo -e "  $green Free RAM          :$NC  $fram MB"
  echo -e "  $green System Uptime     :$NC  $uptime"
  echo -e "  $green City              :$NC  $CITY"
  echo -e "  $green Time              :$NC  $WKT"
  echo -e "  $green Day               :$NC  $DAY"
  echo -e "  $green Date              :$NC  $DATE"
  echo -e "  $green Script Version    :$Lyellow  $Sver"
  echo -e "  $green Client Name       :$Lyellow  $username"
  echo -e "  ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰" |lolcat -p 6.0 -S 60
echo -e "  $colour ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  $PURPLE                   Dashboard Menu                  "
echo -e "  $colour ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   $PURPLE [ 1 ]$NC >>>  $colour1 SSH & OpenVPN Menu$NC"
echo -e "   $PURPLE [ 2 ]$NC >>>  $colour1 Wireguard Menu$NC"
echo -e "   $PURPLE [ 3 ]$NC >>>  $colour1 SSR & SS Menu$NC"
echo -e "   $PURPLE [ 4 ]$NC >>>  $colour1 XRAY VMESS Menu$NC"
echo -e "   $PURPLE [ 5 ]$NC >>>  $colour1 XRAY VLESS Menu$NC"
echo -e "   $PURPLE [ 6 ]$NC >>>  $colour1 XRAY TCP XTLS Menu$NC"
echo -e "   $PURPLE [ 7 ]$NC >>>  $colour1 Trojan GFW Menu$NC"
echo -e "   $PURPLE [ 8 ]$NC >>>  $colour1 Check Running System $NC"
echo -e "   $PURPLE [ 9 ]$NC >>>  $colour1 Menu Theme $NC"
echo -e "   $PURPLE [ 10 ]$NC >>>  $colour1 Menu Customize $NC"
echo -e "   $PURPLE [ 11 ]$NC >>>  $red SYSTEM Menu $NC"
echo -e ""
echo -e ""
echo -e   " $green Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e ""
echo -e "  $colour ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e ""
read -p "  Select From Options [1-11 or x] :  "  opt
echo -e   ""
case $opt in
  1) clear ; m-sshovpn ;;
  2) clear ; m-wg ;;
  3) clear ; m-ssr ;;
  4) clear ; xray-vmess ;;
  5) clear ; xray-vless ;;
  6) clear ; xray-xtls ;;
  7) clear ; m-trojan ;;
  8) clear ; running ;;
  9) clear ; menu-change ;;
  10) clear ; custom ;;
  11) clear ; m-system ;;
x) exit ;;
*) echo  "Please enter an correct number" ; sleep 1 ; menu ;;
esac
