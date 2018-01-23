# Docker Notes

These should be ignored unless you have a perverse interest! These were written by @barryo during Jan 2018 while creating the various IXP Manager Docker containers.


## Network

```
docker network create --ipv6        \
    --subnet 172.30.201.0/24        \
    --subnet fd99::/64              \
    --gateway=172.30.201.1          \
    --driver bridge                 \
    ixpmanager

docker network inspect  ixpmanager
docker network rm  ixpmanager
```

## Container: mysql

```
docker run --name=ixpmanager-mysql       \
    -e MYSQL_DATABASE=ixpmanager         \
    -e MYSQL_USER=ixpmanager             \
    -e MYSQL_PASSWORD=ixpmanager         \
    -e MYSQL_ROOT_HOST=%                 \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=true   \
    -v /var/lib/mysql                    \
    --network ixpmanager                 \
    --ip 172.30.201.10                   \
    --ip6 fd99::10                       \
    -d mysql/mysql-server:5.7

docker ps

docker rm ixpmanager-mysql

docker stop ixpmanager-mysql
docker start ixpmanager-mysql

docker exec -it ixpmanager-mysql mysql -uroot
docker exec -it ixpmanager-mysql bash


docker run --name=ixpmanager-mysql   \
    --network ixpmanager             \
    --ip 172.30.201.10               \
    --ip6 fd99::10                   \
    -d ixpmanager/mysql:4.7.0
```

## Container: www


```
docker run -it --name=ixpmanager-www               \
    -v /srv/ixpmanager                             \
    -p 8880:80                                     \
    --network ixpmanager                           \
    --ip 172.30.201.20                             \
    --ip6 fd99::20                                 \
    --link ixpmanager-mysql:ixpmanager-mysql       \
    -d php:7.0-apache

docker exec -it ixpmanager-www bash


docker image build \
     -t ixpmanager/www:4.7.0 .


docker run -it --name=ixpmanager-www               \
    -p 8880:80                                     \
    --network ixpmanager                           \
    --ip 172.30.201.20                             \
    --ip6 fd99::20                                 \
    --link ixpmanager-mysql:ixpmanager-mysql       \
    --add-host=rs1-ipv4:172.30.201.30              \
    --add-host=rs1-ipv4.ixpmanager:172.30.201.30   \
    --add-host=rs1-ipv6:172.30.201.30              \
    --add-host=rs1-ipv6.ixpmanager:172.30.201.30   \
    -d ixpmanager/www:4.7.1


apt update
apt upgrade -y

docker-php-source extract

apt install -y libmcrypt-dev snmp libsnmp-dev libicu-dev librrd-dev \
    libyaml-dev git mysql-client npm nodejs-legacy joe wget

docker-php-ext-install -j$(nproc) mcrypt snmp intl bcmath gd gettext zip pdo_mysql

pecl install ds rrd
printf "\n" | pecl install yaml

echo -e "extension=ds.so\nextension=rrd.so\nextension=yaml.so\n" >/usr/local/etc/php/conf.d/local-ixpmanager.ini

docker-php-source delete

curl -so /usr/local/bin/composer.phar https://getcomposer.org/download/1.6.2/composer.phar \
  && chmod a+x /usr/local/bin/composer.phar

# ------------ CORE ABOVE, VARIABLE BELOW:

git clone https://github.com/inex/IXP-Manager.git /srv/ixpmanager
cd /srv/ixpmanager
/usr/local/bin/composer.phar install
chown -R www-data: storage var bootstrap/cache database/Proxies
npm install -g bower
bower --allow-root install

------
cp .env.example .env
./artisan key:generate
sed -i -e 's/APP_URL="https:\/\/ixp.example.com"/APP_URL="http:\/\/localhost:8880"/g' .env
sed -i -e 's/DB_HOST="127.0.0.1"/DB_HOST="ixpmanager-mysql"/g' .env
sed -i -e 's/DB_DATABASE="ixp"/DB_DATABASE="ixpmanager"/g' .env
sed -i -e 's/DB_USERNAME="ixp"/DB_USERNAME="ixpmanager"/g' .env
sed -i -e 's/DB_PASSWORD="password"/DB_PASSWORD="ixpmanager"/g' .env
sed -i -e 's/IXP_RESELLER_ENABLED=false/IXP_RESELLER_ENABLED=true/g' .env

echo -e "\nIXP_FE_FRONTEND_DISABLED_LOOKING_GLASS=false\n\n" >>.env

--
docker cp mysql/docker.sql ixpmanager-www:/tmp
--

cat /tmp/docker.sql | mysql -h ixpmanager-mysql -u ixpmanager -pixpmanager ixpmanager
---


cat >/etc/apache2/sites-available/000-default.conf <<END_APACHE
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /srv/ixpmanager/public

    <Directory /srv/ixpmanager/public>
        Options FollowSymLinks
        AllowOverride None
        Require all granted

        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} -s [OR]
        RewriteCond %{REQUEST_FILENAME} -l [OR]
        RewriteCond %{REQUEST_FILENAME} -d
        RewriteRule ^.*\$ - [NC,L]
        RewriteRule ^.*\$ /index.php [NC,L]
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
END_APACHE


/usr/sbin/a2enmod rewrite
service apache2 reload

echo -e "\n\n172.30.201.30\t\trs1-ipv4 rs1-ipv4.ixpmanager rs1-ipv6 rs1-ipv6.ixpmanager\n" >>/etc/hosts

docker / docker01
as112admin / as112admin
as112user / as112user

mysqldump -h ixpmanager-mysql -u ixpmanager -pixpmanager ixpmanager >docker.sql
```


## Container: rs1


```
docker run -it --name=ixpmanager-rs1                 \
    -p 8881:80                                       \
    --link ixpmanager-www:ixpmanager-www             \
    --network ixpmanager                             \
    --ip 172.30.201.30                               \
    --ip6 fd99::30                                   \
    --cap-add ALL                                    \
    -d ixpmanager/rs1:4.7.0

docker exec -it ixpmanager-rs1 bash




apt update

export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
debconf-set-selections <<< "tzdata tzdata/Areas select Europe"
debconf-set-selections <<< "tzdata tzdata/Zones/Europe select Dublin"
export LC_ALL="C.UTF-8"

apt upgrade -y

apt install -y software-properties-common
add-apt-repository -y ppa:cz.nic-labs/bird
apt update

apt install -y bird

** check version! **

mkdir -p /var/log/bird
chown -R bird: /var/log/bird

apt install -y php-cgi php-mbstring php-xml unzip lighttpd wget bzip2 sudo joe curl

lighty-enable-mod fastcgi
lighty-enable-mod fastcgi-php

cd /srv
wget https://github.com/inex/birdseye/releases/download/v1.1.0/birdseye-v1.1.0.tar.bz2
tar jxf birdseye-v1.1.0.tar.bz2
ln -s birdseye-v1.1.0 birdseye
cd birdseye-v1.1.0
chown -R www-data: storage

echo -e "www-data        ALL=(ALL)       NOPASSWD: /srv/birdseye/bin/birdc\n" >/etc/sudoers.d/birdseye


cat >/etc/lighttpd/lighttpd.conf <<END_LIGHTTPD
# Docker / Bird's Eye Lighttpd config - just added a small amount to
# the standard Lighttpd configuration.

server.modules = (
    "mod_access",
    "mod_alias",
    "mod_compress",
    "mod_redirect",
    "mod_rewrite",
)

server.document-root        = "/srv/birdseye/public"
server.upload-dirs          = ( "/var/cache/lighttpd/uploads" )
server.errorlog             = "/var/log/lighttpd/error.log"
server.pid-file             = "/var/run/lighttpd.pid"
server.username             = "www-data"
server.groupname            = "www-data"
server.port                 = 80
# server.bind               = "192.0.2.78"

index-file.names            = ( "index.php", "index.html", "index.lighttpd.html" )
url.access-deny             = ( "~", ".inc" )
static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )

compress.cache-dir          = "/var/cache/lighttpd/compress/"
compress.filetype           = ( "application/javascript", "text/css", "text/html", "text/plain" )

# default listening port for IPv6 falls back to the IPv4 port
## Use ipv6 if available
#include_shell "/usr/share/lighttpd/use-ipv6.pl " + server.port
include_shell "/usr/share/lighttpd/create-mime.assign.pl"
include_shell "/usr/share/lighttpd/include-conf-enabled.pl"

url.redirect = ()
url.rewrite-once = (
        "^/(css|img|js|fonts)/.*\.(jpg|jpeg|gif|png|swf|avi|mpg|mpeg|mp3|flv|ico|css|js|woff|ttf)\$" => "\$0",
        "^/(favicon\.ico|robots\.txt|sitemap\.xml)\$" => "\$0",
        "^/[^\?]*(\?.*)?\$" => "index.php/\$1"
)

END_LIGHTTPD

/etc/init.d/lighttpd restart

cat >/srv/birdseye/birdseye-rs1-ipv4.env <<END_BIRDSEYE_ENV
BIRDC="/usr/bin/sudo /srv/birdseye/bin/birdc -4 -s /var/run/bird/bird-rs1-ipv4.ctl"
CACHE_DRIVER=array
APP_DEBUG=true
MAX_ROUTES=100000
THROTTLE_PER_MIN=2000
LOOKING_GLASS_ENABLED=true
LOOKING_GLASS_TITLE="Vagrant IXP Looking Glass - RS1 LAN1 IPv4"

END_BIRDSEYE_ENV

cat >/srv/birdseye/birdseye-rs1-ipv6.env <<END_BIRDSEYE_ENV
BIRDC="/usr/bin/sudo /srv/birdseye/bin/birdc -6 -s /var/run/bird/bird-rs1-ipv6.ctl"
CACHE_DRIVER=array
APP_DEBUG=true
MAX_ROUTES=100000
THROTTLE_PER_MIN=2000
LOOKING_GLASS_ENABLED=true
LOOKING_GLASS_TITLE="Vagrant IXP Looking Glass - RS1 LAN1 IPv6"

END_BIRDSEYE_ENV


cat >/srv/birdseye/skipcache_ips.php <<END_SKIPCACHE
<?php

return [
    '172.30.201.20',
    'fd99::20',
];

END_SKIPCACHE


docker cp rs1/bird.conf ixpmanager-rs1:/bird.conf
docker cp rs1/bird6.conf ixpmanager-rs1:/bird6.conf

/etc/init.d/bird restart
/etc/init.d/bird6 restart
```

Testing:

```
From ixpmanager-www: wget -O - http://rs1-ipv4.ixpmanager/api/status

docker cp rs1/api-reconfigure-all-v4.sh ixpmanager-rs1:/usr/local/sbin
docker cp rs1/api-reconfigure-v4.sh ixpmanager-rs1:/usr/local/sbin
```

```
docker run -it --name=ixpmanager-rs1                 \
    -p 8881:80                                       \
    --link ixpmanager-www:ixpmanager-www             \
    --network ixpmanager                             \
    --ip 172.30.201.30                               \
    --ip6 fd99::30                                   \
    --cap-add ALL                                    \
    -d ixpmanager/rs1:4.7.0
```



## Container: Route Server Clients


```
docker run -it --name=ixpmanager-cust-as112          \
    --network ixpmanager                             \
    --ip 172.30.201.106                              \
    --cap-add ALL                                    \
    -d ubuntu:16.04

docker exec -it ixpmanager-cust-as112 bash

apt update

apt upgrade -y

apt install -y software-properties-common

export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
debconf-set-selections <<< "tzdata tzdata/Areas select Europe"
debconf-set-selections <<< "tzdata tzdata/Zones/Europe select Dublin"
export LC_ALL="C.UTF-8"

add-apt-repository -y ppa:cz.nic-labs/bird
apt update

apt install -y bird

** check version! **

mkdir -p /var/log/bird
chown -R bird: /var/log/bird




docker image build -t inex/bird:1.6.3 .
docker run -it --name=ixpmanager-cust-as112 --network ixpmanager --ip 172.30.201.106 --cap-add ALL -v "`pwd`/rs-cust/as112-bird.conf:/etc/bird/bird.conf"  inex/bird:1.6.3
docker exec -it ixpmanager-cust-as112 bash


docker cp rs-cust/as112-bird.conf ixpmanager-cust-as112:/etc/bird/bird.conf


docker run --name=ixpmanager-cust-as112 --network ixpmanager --ip 172.30.201.106 --cap-add ALL -v "`pwd`/rs-cust/as112-bird.conf:/etc/bird/bird.conf" -d ixpmanager/bird:1.6.3
docker exec -it ixpmanager-cust-as112 birdc

docker run --name=ixpmanager-cust-as42 --network ixpmanager --ip 172.30.201.136 --cap-add ALL -v "`pwd`/rs-cust/as42-bird.conf:/etc/bird/bird.conf" -d ixpmanager/bird:1.6.3
docker exec -it ixpmanager-cust-as42 birdc

docker run --name=ixpmanager-cust-as1213 --network ixpmanager --ip 172.30.201.110 --cap-add ALL -v "`pwd`/rs-cust/as1213-bird.conf:/etc/bird/bird.conf" -d ixpmanager/bird:1.6.3
docker exec -it ixpmanager-cust-as1213 birdc

docker run --name=ixpmanager-cust-as1213-v6 --network ixpmanager --ip6 fd99::110 --cap-add ALL -v "`pwd`/rs-cust/as1213-bird6.conf:/etc/bird/bird6.conf" -d ixpmanager/bird6:1.6.3
docker exec -it ixpmanager-cust-as1213-v6 birdc6

docker run --name=ixpmanager-cust-as25441-v6 --network ixpmanager --ip6 fd99::108 --cap-add ALL -v "`pwd`/rs-cust/as25441-bird6.conf:/etc/bird/bird6.conf" -d ixpmanager/bird6:1.6.3
docker exec -it ixpmanager-cust-as25441-v6 birdc6
```


## Container: Mail Catcher


```
docker run --name=ixpmanager-mailcatcher -p 1080:1080 --network ixpmanager --ip 172.30.201.11 -d schickling/mailcatcher
```
