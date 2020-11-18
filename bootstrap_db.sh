# Install Apache 
#---------------
apt-get -y install apache2
chown -R god:www-data /var/www

# Install php
#------------
add-apt-repository -y ppa:ondrej/php
apt-get -y install php7.4 
apt-get -y install php-pear
apt-get -y install php7.4-zip php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-fpm php7.4-curl
cd /home/god
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"

a2ensite default-ssl
a2enmod ssl
systemctl restart apache2

apt -y install mariadb-server
echo "update mysql.user set plugin='' where user='root';" > root.sql
echo "flush privileges;" >> root.sql
mysql -u root mysql < root.sql
export DEBIAN_FRONTEND=noninteractive


apt-get -q -y install phpmyadmin 

rm -r /var/www/html
ln -s /usr/share/phpmyadmin /var/www/html

# Upgrade phpMyAdmin
#-------------------------
sudo mv /usr/share/phpmyadmin/ /usr/share/phpmyadmin.bak
sudo mkdir /usr/share/phpmyadmin/
cd /usr/share/phpmyadmin/
sudo wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
sudo tar xzf phpMyAdmin-5.0.4-all-languages.tar.gz
sudo mv phpMyAdmin-5.0.4-all-languages/* /usr/share/phpmyadmin
cp /vagrant/vendor_config.php /usr/share/phpmyadmin/libraries/vendor_config.php

sudo rm /usr/share/phpmyadmin/phpMyAdmin-5.0.4-all-languages.tar.gz
sudo rm -rf /usr/share/phpmyadmin/phpMyAdmin-5.0.4-all-languages
sudo rm -rf /usr/share/phpmyadmin.bak

# Allowing configure server
#--------------------------

chown -R root:adm /etc/mysql/mariadb.conf.d/
chmod -R 775  /etc/mysql/mariadb.conf.d/