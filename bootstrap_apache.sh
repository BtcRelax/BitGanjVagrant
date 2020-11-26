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
apt-get -y install php-dev
pecl install xdebug
cd /home/god
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"

echo "zend_extension=/usr/lib/php/20190902/xdebug.so">>/etc/php/7.4/apache2/php.ini
echo "xdebug.remote_enable=on">>/etc/php/7.4/apache2/php.ini
echo "xdebug.remote_log="/var/log/xdebug.log"">>/etc/php/7.4/apache2/php.ini
echo "xdebug.remote_host=127.0.0.1">>/etc/php/7.4/apache2/php.ini
echo "xdebug.remote_handler=dbgp">>/etc/php/7.4/apache2/php.ini
echo "xdebug.remote_port=9004">>/etc/php/7.4/apache2/php.ini

a2ensite default-ssl
a2enmod ssl
a2enmod rewrite
systemctl restart apache2

rm -rf /var/www/html
sudo -u god git clone https://github.com/BtcRelax/AppRouter /var/www/html