#!/bin/bash
#buat file baru.
function banner() {
  clear
  DF='\e[39m'
  Bold='\e[1m'
  Blink='\e[5m'
  yell='\e[33m'
  red='\e[31m'
  green='\e[32m'
  blue='\e[34m'
  PURPLE='\e[35m'
  CYAN='\e[36m'
  Lred='\e[91m'
  Lgreen='\e[92m'
  Lyellow='\e[1;93m'
  NC='\e[0m'
  MYIP=$(wget -qO- ifconfig.co);
  echo "Checking VPS"
  clear
  echo -e " ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰" |lolcat
  echo -e ""
  echo -e  "  ╔════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
  echo -e  "  ║                     BANNER                      ║" | lolcat
  echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
  echo -e  "  ║" | lolcat
  echo -e  "  ║ $Lgreen [ 1 ]$NC > $Lyellow Banner$NC"
  echo -e  "  ║ $Lgreen [ 2 ]$NC > $Lyellow ASCII Style$NC"
  echo -e  "  ║" | lolcat
  echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
  echo -e  "  ║ - CTRL C to cancel                              ║" | lolcat
  echo -e  "  ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
  echo -e "\e[1;32m"
  read -p "      Select From Options [1-3 or x]  : "  opt
  echo -e   ""
  case $opt in
  1) clear ; ASCII-Banner ;;
  2) clear ; ASCII-Style ;;
  x) clear ; menu ;;
  *) echo "Please enter an correct number" ;;
  esac
}

function ASCII-Banner() {
  clear
  rm -rf > /var/lib/banner-name/banner
  echo "Enter a name for your banner"
  read -rp "Banner: " -e banner
  echo "$banner" >> /var/lib/banner-name/banner
  clear
}

function ASCII-Style() {
  clear
  rm -rf > /var/lib/banner-name/ASCII
  echo "Enter a ASCII Sytle for your banner (Default: standard)"
  echo -e "╔══════════════════╗"
  echo -e "║ > standard       ║"
  echo -e "║ > big            ║"
  echo -e "║ > lean           ║"
  echo -e "║ > shadow         ║"
  echo -e "║ > term           ║"
  echo -e "║ > slant          ║"
  echo -e "╚══════════════════╝"
  read -rp "ASCII Sytle: " -e ASCII
  echo "$ASCII" >> /var/lib/banner-name/ASCII
  clear
}

function username() {
  clear
  rm -rf > /var/lib/banner-name/username
  echo "Enter a name for your username"
  read -rp "Banner: " -e username
  echo "$username" >> /var/lib/banner-name/username
  menu
}


  DF='\e[39m'
  Bold='\e[1m'
  Blink='\e[5m'
  yell='\e[33m'
  red='\e[31m'
  green='\e[32m'
  blue='\e[34m'
  PURPLE='\e[35m'
  CYAN='\e[36m'
  Lred='\e[91m'
  Lgreen='\e[92m'
  Lyellow='\e[1;93m'
  NC='\e[0m'
  MYIP=$(wget -qO- ifconfig.co);
  echo "Checking VPS"
  clear
  echo -e " ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰" |lolcat
  echo -e ""
  echo -e  "  ╔════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
  echo -e  "  ║                    FEATURES                     ║" | lolcat
  echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
  echo -e  "  ║" | lolcat
  echo -e  "  ║ $Lgreen [ 1 ]$NC > $Lyellow Menu Banner$NC (For Premium Menu Only)"
  echo -e  "  ║ $Lgreen [ 2 ]$NC > $Lyellow Username$NC (For Premium Menu & Custom Menu)"
  echo -e  "  ║ $Lyellow Another Features, Coming Soon!$NC"
  echo -e  "  ║" | lolcat
  echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
  echo -e  "  ║ - CTRL C to cancel                              ║" | lolcat
  echo -e  "  ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
  echo -e "\e[1;32m"
  read -p "      Select From Options [1-2 or x]  : "  opt
  echo -e   ""
  case $opt in
  1) clear ; banner ;;
  2) clear ; username ;;
  x) clear ; menu ;;
  *) echo "Please enter an correct number" ;;
  esac
