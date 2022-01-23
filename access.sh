#!/bin/bash
  # 1 colour je
  Lyellow='\e[1;93m'
  NC='\e[0m'
  #register
  read -p " - IP VPS      : " daftar
  echo -e "[ ${Lyellow}INFO${NC} ] Checking the IPVPS if Already Registered"
  sleep 1
  cek=$( curl -sS https://raw.githubusercontent.com/XC0D3-X/access/main/access | awk '{print $3}' | grep $daftar )
  if [[ $daftar = $cek ]]; then
    echo -e "\e[1;31m The IP VPS Has Been Registered\e[0m"
    sleep 2
    exit
    else
    echo -e "IP VPS is not Registered, Permission Accepted.."
    fi
  read -p " - Client Name : " name
  echo "### $name $daftar" >> /root/data
  daftarip=$(cat /root/data)
  rm -rf /root/access
  git config --global user.email "harithsaufi0707@gmail.com"
  git config --global user.name "XC0D3-X"
  git clone https://github.com/XC0D3-X/access.git
  cd /root/access/
  rm -rf .git
  git init
  touch access
  echo "$daftarip" >> /root/access/access
  git add .
  git commit -m tumbuk
  git branch -M main
  git remote add origin https://github.com/XC0D3-X/access.git
  git push -f https://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@github.com/XC0D3-X/access.git
  echo -e "IPVPS Registration Completed"
  rm -rf /root/access
  sleep 1
