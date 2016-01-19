FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl supervisor nginx php5 php5-cgi php5-cli php5-mysql php5-gd php-apc php5-fpm && \
    mkdir -p /var/log/supervisor

COPY ./files/nginx/default /etc/nginx/sites-enabled/
COPY ./files/html/phpinfo.php /usr/share/nginx/html/
COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]

EXPOSE 80
