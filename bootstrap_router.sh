### Route web traffic with NGinx
apt-get -y install nginx
systemctl start nginx
systemctl enable nginx

#apt -y install certbot
cd /opt
wget https://www.apachefriends.org/xampp-files/7.4.11/xampp-linux-x64-7.4.11-0-installer.run
chmod 755 xampp-linux-x64-7.4.11-0-installer.run
sudo ./xampp-linux-x64-7.4.11-0-installer.run --mode unattended
