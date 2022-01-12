#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/XC0D3-X/special-ip/main/special-ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e ""
else
echo "Script lain cantik lagi.><"
exit 0
fi
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(cat /root/domain);
portnginx="$(cat ~/log-install.txt | grep -w "Nginx" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH & OpenVPN Account Info"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "==============================="
echo -e "Host           : $IP"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "SSL/TLS        :$ssl"
echo -e "Port Squid     :$sqd"
echo -e "OpenVPN        : TCP $ovpn http://$IP:$portnginx/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN        : UDP $ovpn2 http://$IP:$portnginx/client-udp-$ovpn2.ovpn"
echo -e "OHPVPN         : OHP 8087 http://$IP:$portnginx/tcp-ohp.ovpn"
echo -e "badvpn         : 7300"
echo -e "==============================="
echo -e "Expired On     : $exp"
