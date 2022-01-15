#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[1;32m'
blue='\e[1;34m'
PURPLE='\e[1;35m'
CYAN='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[36m'
LIGHT='\033[0;37m'
Bred="\e[1;31m"
MYIP=$(wget -qO- ifconfig.co);
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi
clear
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))
# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Getting OS Information
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
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
banner=$(cat /var/lib/banner-name/banner)
ASCII=$(cat /var/lib/banner-name/ASCII)
username=$(cat /var/lib/banner-name/username)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
echo ""
figlet -f$ASCII " $banner" | lolcat -p 9 -F 0.5
echo -e  "  ╔═════════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                      ┃ SYSTEM INFORMATION ┃                     ║" | lolcat
echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
	echo -e "$blue  ║  $green VPS Type             :$NC  $typevps"
	echo -e "$blue  ║  $green CPU Model            :$NC $cname"
	echo -e "$blue  ║  $green CPU Frequency        :$NC $freq MHz"
	echo -e "$blue  ║  $green Number Of Cores      :$NC  $cores"
	echo -e "$blue  ║  $green CPU Usage            :$NC  $cpu_usage"
	echo -e "$blue  ║  $green Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
	echo -e "$blue  ║  $green OS Family            :$NC  `uname -s`"
	echo -e "$blue  ║  $green Kernel               :$NC  `uname -r`"
	echo -e "$blue  ║  $green Total Amount Of RAM  :$NC  $tram MB"
	echo -e "$blue  ║  $green Used RAM             :$NC  $uram MB"
	echo -e "$blue  ║  $green Free RAM             :$NC  $fram MB"
	echo -e "$blue  ║  $green System Uptime        :$NC  $uptime $DF"
	echo -e "$blue  ║  $green Download             :$NC  $downloadsize GB "
	echo -e "$blue  ║  $green Upload               :$NC  $uploadsize GB "
	echo -e "$blue  ║  $green Isp Name             :$NC  $ISP"
  echo -e "$blue  ║  $ORANGE Ip Vps               :$Lyellow  $IPVPS $NC"
  echo -e "$blue  ║  $green Domain               :$NC  $domain"
	echo -e "$blue  ║  $green City                 :$NC  $CITY"
	echo -e "$blue  ║  $green Time                 :$NC  $WKT"
	echo -e "$blue  ║  $green Day                  :$NC  $DAY"
	echo -e "$blue  ║  $green Date                 :$NC  $DATE"
  echo -e  "  ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰ " |lolcat -F 0.2
  echo -e "                                                       $yell SCRIPT PREMIUM"
  echo -e  "                                                       $PURPLE - By harithwyd$NC"
  echo -e  "  $Lyellow Username: $username $NC"
  echo -e  "  ╔══════════════════════════════════════════════════════════════════╗" | lolcat
  echo -e  "  ║                          ┃ SCRIPT MENU ┃                         ║" | lolcat
  echo -e  "  ╠══════════════════════════════════════════════════════════════════╝" | lolcat
  echo -e  "$blue  ║$NC"
  echo -e  "$blue  ║  $PURPLE [ 1 ]$NC ► >> $Lyellow SSH & OpenVPN $NC      $PURPLE [ 6 ]$NC ► >> $Lyellow XRAY XTLS $NC"
  echo -e  "$blue  ║  $PURPLE [ 2 ]$NC ► >> $Lyellow Wireguard $NC          $PURPLE [ 7 ]$NC ► >> $Lyellow Trojan GFW $NC"
  echo -e  "$blue  ║  $PURPLE [ 3 ]$NC ► >> $Lyellow SSR & SS $NC           $PURPLE [ 8 ]$NC ► >> $Lyellow Check Running System $NC"
  echo -e  "$blue  ║  $PURPLE [ 4 ]$NC ► >> $Lyellow XRAY VMESS $NC         $PURPLE [ 9 ]$NC ► >> $Bred Menu Theme $NC"
  echo -e  "$blue  ║  $PURPLE [ 5 ]$NC ► >> $Lyellow XRAY VLESS $NC         $PURPLE [ 10 ]$NC ► >> $Bred SYSTEM $NC"
  echo -e  "$blue  ║$NC"
  echo -e  "  ╠══════════════════════════════════════════════════════════════════╗" | lolcat
  echo -e  "  ║                              PREMIUM                             ║" | lolcat
  echo -e  "  ╚══════════════════════════════════════════════════════════════════╝" | lolcat
echo -e   ""
read -p "     Select From Options [1-8 or x] :  " opt
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
  10) clear ; m-system ;;
  x) exit ;;
* )echo  "Please enter an correct number";;
esac
