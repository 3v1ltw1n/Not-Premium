#!/bin/bash
# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"
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
# // Input
port=$(cat /etc/xray-mini/config.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray-mini/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "A client with the specified name was already created, please choose another name."
      sleep 2
			exit
		fi
	done
  uuid=$(cat /proc/sys/kernel/random/uuid)
  domain=$(cat /root/domain)
  read -p "Expired    : " expired
  read -p "BUG TELCO  : " BUG
exp=`date -d "$expired days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`

# // Input Data User Ke XRay Vless TCP XTLS

sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-direct","email": "'""$user""'"' /etc/xray-mini/config.json
IP=$( curl -s ipinfo.io/ip )

# // Link Configration
vlesslink1="vless://${uuid}@${domain}:${port}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=${BUG}#$user"
vlesslink2="vless://${uuid}@${domain}:${port}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct-udp443&sni=${BUG}#$user"
vlesslink3="vless://${uuid}@${domain}:${port}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=${BUG}#$user"
vlesslink4="vless://${uuid}@${domain}:${port}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice-udp443&sni=${BUG}#$user"

systemctl restart xray-mini
clear

echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "        XRAY TCP XTLS         "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks        : ${user}"
echo -e "HOST IP        : ${IP}"
echo -e "Domain         : ${domain}"
echo -e "port XTLS      : $port"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "network        : tcp"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "link xtls-rprx-direct :"
echo -e '```'${vlesslink1}'```'
echo -e "=============================="
echo -e "link xtls-rprx-direct udp443:"
echo -e '```'${vlesslink2}'```'
echo -e "=============================="
echo -e "link xtls-rprx-splice :"
echo -e '```'${vlesslink3}'```'
echo -e "=============================="
echo -e "link xtls-rprx-splice udp443:"
echo -e '```'${vlesslink4}'```'
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Created On     : $hariini"
echo -e "Expired On     : $exp"
