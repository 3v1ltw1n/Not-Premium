#!/bin/bash
# By Harithwyd
#
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=MY
state=Malaysia
locality=Malaysia
organization=www.harithwyd.xyz
organizationalunit=www.harithwyd.xyz
commonname=www.harithwyd.xyz
email=admin@harithwyd.xyz

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y linux-headers-cloud-amd64 bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
apt install neofetch -y
echo "clear" >> .profile
echo "neofetch --ascii_distro SliTaz" >> .profile
echo "echo -e '\e[35m  Script Premium V2 By \e[1;32mHarithwyd \e[0m'" >> .profile
echo "echo ''" >> .profile
echo "echo -e '\e[35m Thanks For Using This Meager Script\e[0m'" >> .profile
echo "echo ''" >> .profile

# install webserver
apt -y install nginx
cd
mkdir /etc/systemd/system/nginx.service.d
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" | tee /etc/systemd/system/nginx.service.d/override.conf
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 888
connect = 127.0.0.1:109

[dropbear]
accept = 777
connect = 127.0.0.1:22

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Install DDoS Deflate
apt install -y dnsutils tcpdump dsniff grepcidr
wget -qO ddos.zip "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/ddos-deflate-1.3.zip"
unzip ddos.zip
cd ddos-deflate
chmod +x install.sh
./install.sh
cd
rm -rf ddos.zip ddos-deflate


# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/banner.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
# menu
wget -O menu "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/menu.sh"
wget -O menu-change "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/menu-change.sh"
# menu ssh-ovpn
wget -O m-sshovpn "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/m-sshovpn.sh"
wget -O usernew "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/add/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/trial.sh"
wget -O renew "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/renew/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/check/cek.sh"
wget -O member "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/delete/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/tendang.sh"
# menu wg
wget -O m-wg "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/m-wg.sh"
# menu ssr
wget -O m-ssr "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/m-ssr.sh"
# menu xray
wget -O xray-vmess "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/xray-vmess.sh"
wget -O xray-vless "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/xray-vless.sh"
wget -O xray-xtls "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/xray-xtls.sh"
# menu trojan
wget -O m-trojan "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/m-trojan.sh"
# menu system
wget -O m-system "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/menu/m-system.sh"
wget -O domain-menu "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/domain-menu.sh"
wget -O add-host "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/add-host.sh"
wget -O cff "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/cff.sh"
wget -O cfd "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/cfd.sh"
wget -O cfh "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/cfh.sh"
wget -O certv2ray "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/certv2ray.sh"
wget -O port-change "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-change.sh"
   # change port
wget -O port-ssl "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-ovpn.sh"
wget -O port-wg "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-wg.sh"
wget -O port-xws "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-xws.sh"
wget -O port-xvless "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-xvless.sh"
wget -O port-xtls "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-xtls.sh"
wget -O port-tr "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-tr.sh"
wget -O port-squid "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/port/port-squid.sh"
# menu system
wget -O webmin "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/webmin.sh"
wget -O running "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/running.sh"
wget -O ram "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/ram.sh"
wget -O speedtest "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/info.sh"
wget -O about "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/about.sh"
wget -O bbr "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/bbr.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/auto-reboot.sh"
wget -O clear-log "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/clear-log.sh"
wget -O restart "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/restart.sh"
wget -O bw "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/bw.sh"
wget -O resett "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/resett.sh"
wget -O update "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/update.sh"
wget -O kernel-updt "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/kernel-update.sh"
# uNLOCATED
wget -O swap "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/swapkvm.sh"
wget -O user-limit "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/user-limit.sh"
wget -O xp "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/xp.sh"
wget -O banner "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/banner.sh"

chmod +x menu
chmod +x menu-change
chmod +x m-sshovpn
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x m-wg
chmod +x m-ssr
chmod +x xray-vmess
chmod +x xray-vless
chmod +x xray-xtls
chmod +x m-trojan
chmod +x m-system
chmod +x domain-menu
chmod +x add-host
chmod +x cff
chmod +x cfd
chmod +x cfh
chmod +x certv2ray
chmod +x port-change
chmod +x port-ssl
chmod +x port-ovpn
chmod +x port-wg
chmod +x port-xws
chmod +x port-xvless
chmod +x port-xtls
chmod +x port-tr
chmod +x port-squid
chmod +x webmin
chmod +x running
chmod +x ram
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x bbr
chmod +x auto-reboot
chmod +x clear-log
chmod +x restart
chmod +x bw
chmod +x resett
chmod +x update
chmod +x swap
chmod +x user-limit
chmod +x xp
chmod +x kernel-updt
chmod +x banner
mkdir /var/lib/banner-name;
echo -e "Premium" >> /var/lib/banner-name/banner
echo -e "standard" >> /var/lib/banner-name/ASCII
echo -e "Nama Anda" >> /var/lib/banner-name/username

echo "0 0 * * * root /sbin/hwclock -w   # synchronize hardware & system clock each day at 00:00 am" >> /etc/crontab
echo "0 */2 * * * root /usr/bin/clear-log # clear log every  two hours" >> /etc/crontab
echo "50 23 * * * root /usr/bin/xp # delete expired user" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
