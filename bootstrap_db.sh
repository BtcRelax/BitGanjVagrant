# Install xrdp
#--------------
#apt-get -y install xrdp ubuntu-mate-desktop
#systemctl enable xrdp
#reboot

# Install Webmin
#---------------

#curl -L -O http://www.webmin.com/download/deb/webmin-current.deb
#dpkg -i webmin-current.deb
#echo "allow=127.0.0.1 192.168.2.0/24" >> /etc/webmin/miniserv.conf
#echo "god:x:0" >> /etc/webmin/miniserv.users
#systemctl restart webmin


# Install Cockpit
# ---------------
#apt-get -y cockpit 
#systemctl enable cockpit.socket

# Install php
#------------
add-apt-repository -y ppa:ondrej/php
apt-get -y install php7.4 
apt-get -y install php-pear
apt-get -y install php7.4-zip php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-fpm php7.4-curl
apt-get -y install php-dev
pecl install xdebug
cd /home/god
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"