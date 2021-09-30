#!/bin/bash
echo "Lütfen kullanıcınıza isim verin"
read nameuser
sudo adduser $name  --disabled-password
cd /etc/sudoers.d 
echo $name ALL=(ALL) NOPASSWD:ALL >> 90-cloud-init-users
usermod -aG sudo $name
echo "Oluşturdugunuz SSH Key Public Verisini Ekleyin"
read ssh_key
sudo su $name
mkdir ~/.ssh
echo $ssh_key >> ~/.ssh/authorized_keys
exit
