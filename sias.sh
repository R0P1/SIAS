#!/bin/bash

clear

echo ""
echo "+============================================+"
echo "| Program | Seting ip address statik         | "
echo "| Pembuat | Rofi                             |"
echo "| Github  | https://github.com/R0P1/SIAS.git |"
echo "| E-mail  | pysoft.biz@gmail.com             |                  |"
echo "+============================================+"
echo ""

read -p "Masukkan Ethernet (contoh: eth0): " e
read -p "Masukkan alamat IP (contoh: 192.168.1.14): " a
read -p "Masukkan prefix alamat IP (contoh: 24): " p
read -p "Masukkan alamat gateway IP (contoh: 192.168.1.1): " g
read -p "Masukkan dns-nameservers (contoh: 8.8.8.8): " d

# file konfigurasi 
f="/etc/netplan/01-network-manager-all.yaml"

echo ""
echo "[*] Sedang melakukan konfigurasi..."

sleep 7

echo "" >> $f
echo "# Seting ip address statik" >> $f
echo "# Oleh Rofi" >> $f
echo "# https://github.com/R0P1/SIAS.git" >> $f
echo "" >> $f
echo "network:" >> $f
echo "  version: 2" >> $f
echo "  renderer: networkd" >> $f
echo "  ethernets:" >> $f
echo "    $e:" >> $f
echo "      dhcp4: no" >> $f
echo "      addresses:" >> $f
echo "        - $a/$p" >> $f
echo "      gateway4: $g" >> $f
echo "      nameservers:" >> $f
echo "        addresses: [$g]" >> $f
echo "" >> $f

netplan apply > /dev/null 2>&1

echo "[+] Selesai."
echo ""
