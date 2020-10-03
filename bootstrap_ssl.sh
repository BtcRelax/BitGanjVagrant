export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

cd /opt
git clone https://github.com/certbot/certbot.git
cd certbot 

./certbot-auto certonly --manual --preferred-challenges=dns --email boomhacker@cryptopup.space --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.cryptopup.space
./certbot-auto certonly --manual --preferred-challenges=dns --email god@fastfen.club --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.fastfen.club
