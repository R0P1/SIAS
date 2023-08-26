clear

echo ""
echo "--------------------------------------"
echo "       SETING IP ADDRESS STATIK       "
echo "--------------------------------------"
echo "           Dibuat oleh Rofi           "
echo "     https://github.com/R0P1/SIAS     "
echo "--------------------------------------"
echo ""

read -p "Masukkan alamat IP (contoh: 192.168.1.14): " address
read -p "Masukkan netmask (contoh: 255.255.255.0): " netmask
read -p "Masukkan jaringan IP (contoh: 192.168.1.0): " network
read -p "Masukkan alamat siaran IP (contoh: 192.168.1.255): " broadcast
read -p "Masukkan alamat gateway IP (contoh: 192.168.1.1): " gateway
read -p "Masukkan dns-nameservers (contoh: 8.8.8.8): " dns_nameservers

# file konfigurasi 
file_interfaces="/etc/network/interfaces"
file_resolv="/etc/resolv.conf"

# konfigurasi pada file interfaces
echo "auto eth0" >> ${file_interfaces}
echo "iface eth0 inet static" >> ${file_interfaces}
echo "	address ${address}" >> ${file_interfaces}
echo "	netmask ${netmask}" >> ${file_interfaces}
echo "	network ${network}" >> ${file_interfaces}
echo "	broadcast ${broadcast}" >> ${file_interfaces}
echo "	gateway ${gateway}" >> ${file_interfaces}
echo "	dns-nameservers ${dns_nameservers}" >> ${file_interfaces}

# konfigurasi pada file resolv.conf
echo "nameserver ${dns_nameservers}" >> ${file_resolv}

# restart layanan jaringan pada sistem linux 
/etc/init.d/networking restart

echo ""
echo "[*] Sedang melakukan konfigurasi..."

sleep 14

echo "[+] Selesai."
echo ""
