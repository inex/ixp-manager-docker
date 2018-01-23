FROM php:7.0-apache

MAINTAINER Barry O'Donovan <barry.odonovan@inex.ie>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install libmcrypt-dev snmp libsnmp-dev libicu-dev librrd-dev \
        libyaml-dev git mysql-client npm nodejs-legacy joe wget \
        iputils-ping dnsutils && \
    apt-get -y autoremove --purge && \
    apt-get -y autoremove --purge && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN docker-php-source extract && \
    docker-php-ext-install -j$(nproc) mcrypt snmp intl bcmath gd gettext zip pdo_mysql && \
    pecl install ds rrd && \
    printf "\n" | pecl install yaml && \
    echo "extension=ds.so\nextension=rrd.so\nextension=yaml.so\n" >/usr/local/etc/php/conf.d/local-ixpmanager.ini && \
    docker-php-source delete && \
    curl -so /usr/local/bin/composer.phar https://getcomposer.org/download/1.6.2/composer.phar && \
    chmod a+x /usr/local/bin/composer.phar

RUN git clone https://github.com/inex/IXP-Manager.git /srv/ixpmanager && \
    cd /srv/ixpmanager && \
    git checkout v4.7.1 && \
    /usr/local/bin/composer.phar install && \
    chown -R www-data: storage var bootstrap/cache database/Proxies && \
    npm install -g bower && \
    bower --allow-root install

RUN cd /srv/ixpmanager && \
    cp /srv/ixpmanager/.env.example /srv/ixpmanager/.env && \
    /srv/ixpmanager/artisan key:generate && \
    sed -i -e 's/APP_URL="https:\/\/ixp.example.com"/APP_URL="http:\/\/localhost:8880"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/DB_HOST="127.0.0.1"/DB_HOST="ixpmanager-mysql"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/DB_DATABASE="ixp"/DB_DATABASE="ixpmanager"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/DB_USERNAME="ixp"/DB_USERNAME="ixpmanager"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/DB_PASSWORD="password"/DB_PASSWORD="ixpmanager"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/IXP_RESELLER_ENABLED=false/IXP_RESELLER_ENABLED=true/g' /srv/ixpmanager/.env && \
    sed -i -e 's/MAIL_HOST=localhost/MAIL_HOST=172.30.201.11/g' /srv/ixpmanager/.env && \
    sed -i -e 's/MAIL_PORT=25/MAIL_PORT=1025/g' /srv/ixpmanager/.env && \
    sed -i -e 's/GRAPHER_BACKENDS="dummy"/GRAPHER_BACKENDS="mrtg|dummy"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/#GRAPHER_BACKEND_MRTG_WORKDIR="\/tmp"/GRAPHER_BACKEND_MRTG_WORKDIR="\/mrtg_data"/g' /srv/ixpmanager/.env && \
    sed -i -e 's/#GRAPHER_BACKEND_MRTG_LOGDIR="http:\/\/stats.example.com\/mrtg"/GRAPHER_BACKEND_MRTG_LOGDIR="\/srv\/mrtg"/g' /srv/ixpmanager/.env && \
    echo "\nIXP_FE_FRONTEND_DISABLED_LOOKING_GLASS=false\n\n" >>/srv/ixpmanager/.env

RUN /usr/sbin/a2enmod rewrite

COPY apache-site.conf              /etc/apache2/sites-available/000-default.conf

VOLUME /srv/ixpmanager
WORKDIR /srv/ixpmanager
