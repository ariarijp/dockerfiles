FROM ariarijp/sshd
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx php5 php5-cgi php5-cli php5-mysql php5-gd php-apc php5-fpm

COPY ./files/nginx/default /etc/nginx/sites-enabled/
COPY ./files/html/phpinfo.php /usr/share/nginx/html/
COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/

EXPOSE 22 80
