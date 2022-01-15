#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
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
domain=$(cat /etc/v2ray/domain)
tls="$(cat ~/log-install.txt | grep -w "Xray Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Xray Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "BUG TELCO: " BUG
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/xray",
      "type": "none",
      "host": "${BUG}",
      "tls": "tls"
      "sni": "${BUG}"

}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "2",
      "net": "ws",
      "path": "/xray",
      "type": "none",
      "host": "${BUG}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
systemctl restart xray
systemctl restart xray@none
service cron restart
clear
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            XRAY VMESS          "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : ${tls}"
echo -e "port none TLS  : ${none}"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Security       : auto"
echo -e "network        : ws"
echo -e "path           : /xray"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Link TLS       : ${vmesslink1}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Link None TLS  : ${vmesslink2}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Expired On     : $exp"
