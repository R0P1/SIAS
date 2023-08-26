echo "SETING IP ADDRESS STATIK"
echo "------------------------"
echo ""

read -p "Masukkan ip address: " address
read -p "Masukkan netmask: " netmask
read -p "Masukkan ip network: " network
read -p "Masukkan ip broadcast: " broadcast
read -p "Masukkan gateway: " gateway
read -p "Masukkan dns-nameservers: " dns_nameservers

file_konfigurasi="/etc/network/interfaces"

# konfigurasi
echo "auto eth0" >> ${file_konfigurasi}
echo "iface eth0 inet static" >> ${file_konfigurasi
echo "	address ${address}" >> ${file_konfigurasi
echi "	netmask ${netmask}" >> ${file_konfigurasi
echo "	network ${network}" >> ${file_konfigurasi
echo "	broadcast ${broadcast}" >> ${file_konfigurasi
echo "	gateway ${gateway}" >> ${file_konfigurasi
echo "	dns-nameservers ${dns_nameservers}" >> ${file_konfigurasi
