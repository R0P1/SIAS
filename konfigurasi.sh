echo "------------------------------"
echo "   SETING IP ADDRESS STATIK   "
echo "------------------------------"
echo "       Dibuat oleh Rofi       "
echo " https://github.com/R0P1/SIAS "
echo "------------------------------"

read -p "Masukkan alamat IP (contoh: 192.168.1.14): " address
read -p "Masukkan netmask (contoh: 255.255.255.0): " netmask
read -p "Masukkan jaringan IP (contoh: 192.168.1.0): " network
read -p "Masukkan alamat siaran IP (contoh: 192.168.1.255): " broadcast
read -p "Masukkan alamat gateway IP (contoh: 192.168.1.1): " gateway
read -p "Masukkan dns-nameservers (contoh: 8.8.8.8): " dns_nameservers

# file konfigurasi 
file_konfigurasi="/etc/network/interfaces"

# konfigurasi
echo "auto eth0" >> ${file_konfigurasi}
echo "iface eth0 inet static" >> ${file_konfigurasi}
echo "	address ${address}" >> ${file_konfigurasi}
echo "	netmask ${netmask}" >> ${file_konfigurasi}
echo "	network ${network}" >> ${file_konfigurasi}
echo "	broadcast ${broadcast}" >> ${file_konfigurasi}
echo "	gateway ${gateway}" >> ${file_konfigurasi}
echo "	dns-nameservers ${dns_nameservers}" >> ${file_konfigurasi}

echo "[*] Sedang melakukan konfigurasi..."

sleep 14

echo "[+] Selesai."
echo "[*] Silahkan restart sistem operasi Anda dengan menjalankan perintah 'reboot'."
