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
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password IAm$Developer' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password IAm$Developer' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password IAm$Developer' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
echo "RedirectMatch ^/$ /phpmyadmin/" >/var/www/html/.htaccess

apt-get -q -y install phpmyadmin 
#php-gettext
echo "Require ip 127.0.0.1 192.168.2.0/24">>/etc/phpmyadmin/apache.conf