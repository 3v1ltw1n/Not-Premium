#!/bin/bash
# Color Validation
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

function Menu-Text() {
  rm -rf > /var/lib/banner-name/colour1
  echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
  echo -e "  $PURPLE            Menu Text Colour             "
  echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
  echo -e " ║ $Lgreen [ 1 ]$NC > $Lyellow RED$NC"
  echo -e " ║ $Lgreen [ 2 ]$NC > $Lyellow CYAN$NC"
  echo -e " ║ $Lgreen [ 3 ]$NC > $Lyellow PURPLE$NC"
  echo -e " ║ $Lgreen [ 4 ]$NC > $Lyellow YELLOW$NC"
  echo -e " ║ $Lgreen [ 5 ]$NC > $Lyellow BLUE$NC"
  echo -e " ║ $Lgreen [ 6 ]$NC > $Lyellow WHITE$NC"
  echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
  echo -e ""
  read -rp "     Select menu :  "  opt
  if [ $opt = 1 ]; then
  echo -e '\e[1;31m' >> /var/lib/banner-name/colour1
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 1
  elif [ $opt = 2 ]; then
  echo -e '\e[1;36m' >> /var/lib/banner-name/colour1
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 1
  elif [ $opt = 3 ]; then
  echo -e '\e[1;95m' >> /var/lib/banner-name/colour1
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 1
  elif [ $opt = 4 ]; then
  echo -e '\e[1;93m' >> /var/lib/banner-name/colour1
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 1
  elif [ $opt = 5 ]; then
  echo -e '\e[1;34m' >> /var/lib/banner-name/colour1
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 1
  elif [ $opt = 6 ]; then
  echo -e '\e[1;37m' >> /var/lib/banner-name/colour
  echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
  sleep 1
  else
    echo -e "Please Enter the Correct Number "
    custom
  fi
}
function Line() {
rm -rf > /var/lib/banner-name/colour
echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e "  $PURPLE               Line Colour               "
echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e " ║ $Lgreen [ 1 ]$NC > $Lyellow RED$NC"
echo -e " ║ $Lgreen [ 2 ]$NC > $Lyellow CYAN$NC"
echo -e " ║ $Lgreen [ 3 ]$NC > $Lyellow PURPLE$NC"
echo -e " ║ $Lgreen [ 4 ]$NC > $Lyellow YELLOW$NC"
echo -e " ║ $Lgreen [ 5 ]$NC > $Lyellow BLUE$NC"
echo -e " ║ $Lgreen [ 6 ]$NC > $Lyellow WHITE$NC"
echo -e " $Lyellow ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ $NC"
echo -e ""
echo "Enter a name for your colour"
read -rp " Select menu :  "  opt
if [ $opt = 1 ]; then
echo -e '\e[1;31m' >> /var/lib/banner-name/colour
echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
sleep 1
elif [ $opt = 2 ]; then
echo -e '\e[1;36m' >> /var/lib/banner-name/colour
echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
sleep 1
elif [ $opt = 3 ]; then
echo -e '\e[1;95m' >> /var/lib/banner-name/colour
echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
sleep 1
elif [ $opt = 4 ]; then
echo -e '\e[1;93m' >> /var/lib/banner-name/colour
echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
sleep 1
elif [ $opt = 5 ]; then
echo -e '\e[1;34m' >> /var/lib/banner-name/colour
echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
sleep 1
elif [ $opt = 6 ]; then
echo -e '\e[1;37m' >> /var/lib/banner-name/colour
echo -e "[ ${yell}INFO${NC} ] Your Changes Installed Successfully "
sleep 1
else
  echo -e "Please Enter the Correct Number "
  custom
fi
}

  DF='\e[39m'
  Bold='\e[1m'
  Blink='\e[5m'
  yell='\e[33m'
  red='\e[1;31m'
  green='\e[32m'
blue='\e[1;34m'
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
  echo -e  "  ║ $Lgreen [ 1 ]$NC > $Lyellow Menu Text Colour$NC"
  echo -e  "  ║ $Lgreen [ 2 ]$NC > $Lyellow Line Colour$NC"
  echo -e  "  ║ $Lgreen [ 3 ]$NC > $Lyellow Menu Username$NC"
  echo -e  "  ║ $Lgreen [ 4 ]$NC > $red BACK TO MENU$NC"
  echo -e  "  ║" | lolcat
  echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
  echo -e  "  ║ - CTRL C to cancel                              ║" | lolcat
  echo -e  "  ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
  echo -e "\e[1;32m"
  read -p "      Select From Options [1-3 or x]  : "  opt
  echo -e   ""
  case $opt in
  1) clear ; Menu-Text ;;
  2) clear ; Line ;;
  3) clear ; banner ;;
  4) clear ; menu ;;
  *) echo "Please enter an correct number" ;;
  esac
