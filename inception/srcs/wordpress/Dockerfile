FROM debian:buster

EXPOSE 9000

# update packages and installing all dependences for wordpress
RUN apt-get update -y &&\
    apt-get install -y curl mariadb-client php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip gettext-base

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /var/run && \
    mkdir /run/php && \
    mkdir -p /var/www/html/


COPY ./conf/wp-config.php /etc/wp-config.php.tmp

COPY ./conf/script.sh  /etc/script.sh
RUN  chmod -R 755 /var/www/html/

ARG WP_DB
ARG WP_USER
ARG WP_PASSWORD
ARG WP_HOST

# Remplace env with their value
RUN envsubst '${WP_DB} ${WP_USER} ${WP_PASSWORD} ${WP_HOST}' < \
    /etc/wp-config.php.tmp > /etc/wp-config.php && rm /etc/wp-config.php.tmp

# Wordpress-cli install guide :  https://make.wordpress.org/cli/handbook/guides/installing/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


CMD [ "sh", "/etc/script.sh" ]