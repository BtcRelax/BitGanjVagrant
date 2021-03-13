### Install Open VPN
#apt install apt-transport-https
#wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
#apt-key add openvpn-repo-pkg-key.pub
#wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-bionic.list
#apt update
#apt -y install openvpn3

### Disable ipv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf 
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

### Install ZeroTier
curl -s https://install.zerotier.com | sudo bash

### Route web traffic with NGinx
apt-get -y install nginx
systemctl start nginx
systemctl enable nginx

### Install tools
apt-get -y install inetutils-traceroute
apt-get -y install traceroute
apt-get -y install net-tools

### Install webmin
apt -y install python apt-show-versions libapt-pkg-perl libauthen-pam-perl libio-pty-perl libnet-ssleay-perl
curl -L -O http://www.webmin.com/download/deb/webmin-current.deb
dpkg -i webmin-current.deb
echo "allow=127.0.0.1 192.168.0.0/16" >> /etc/webmin/miniserv.conf 
systemctl restart webmin
ufw allow 10000

#apt -y install certbot
apt -y install easy-rsa
cd /opt

#wget https://www.apachefriends.org/xampp-files/7.4.11/xampp-linux-x64-7.4.11-0-installer.run
#chmod 755 xampp-linux-x64-7.4.11-0-installer.run
#./xampp-linux-x64-7.4.11-0-installer.run --mode unattended
