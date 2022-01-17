#!/bin/bash
# ===================================
# Xray Quick Setup
# ===================================

# // Silakan Isi Bawah Ini
export port='443' # >> Port Vless RPRX Direct
export Cert_path='/etc/v2ray/v2ray.crt' # >> Certificate Path
export Cert_Key_Path='/etc/v2ray/v2ray.key' # >> Certificate Key Path

# // Creating UUID
export uuid=$(cat /proc/sys/kernel/random/uuid)

# // Installing Requirement
apt update -y
apt upgrade  -y
apt install zip unzip gzip curl wget nano vim -y

# // Downloading Core
wget -O /usr/local/xray-mini "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/xray-mini"
chmod +x /usr/local/xray-mini

# // Make Config Folder
mkdir -p /etc/xray-mini/

# // Installing Service
cat > /etc/systemd/system/xray-mini.service << END
[Unit]
Description=XRay-Mini
Documentation=https://harithwyd.xyz
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/usr/local/xray-mini -c /etc/xray-mini/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END

# // XRay XTLS RPRX Direct
cat > /etc/xray-mini/config.json << END
{
  "log": {
    "access": "/var/log/xray/access2.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": ${port},
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid}",
            "flow": "xtls-rprx-direct"
#XRay
          }
        ],
        "decryption": "none",
        "fallbacks": [
          {
            "dest": 60000,
            "alpn": "",
            "xver": 1
          },
          {
            "dest": 60001,
            "alpn": "h2",
            "xver": 1
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
          "minVersion": "1.2",
          "certificates": [
            {
              "certificateFile": "${Cert_path}",
              "keyFile": "${Cert_Key_Path}"
            }
          ]
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
END


iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables-save >/etc/iptables.rules.v4
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload


systemctl disable xray-mini
systemctl stop xray-mini
systemctl enable xray-mini
systemctl start xray-mini

# // Downloading Menu
cd /usr/bin
wget -O add-xtls "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/add/add-xtls.sh"
wget -O del-xtls "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/delete/del-xtls.sh"
wget -O renew-xtls "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/renew/renew-xtls.sh"
wget -O cek-xtls "https://raw.githubusercontent.com/XC0D3-X/Not-Premium/main/check/cek-xtls.sh"

chmod +x add-xtls
chmod +x del-xtls
chmod +x renew-xtls
chmod +x cek-xtls
# // Remove Not Used Files
rm -f install-xray.sh
