FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python-software-properties software-properties-common && \
    LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
RUN apt-get update && \
    apt-get install -y curl supervisor nginx php7.0 php7.0-cgi php7.0-cli php7.0-mysql php7.0-gd php7.0-fpm && \
    mkdir -p /run/php /var/log/supervisor

COPY ./files/nginx/default /etc/nginx/sites-enabled/
COPY ./files/html/phpinfo.php /usr/share/nginx/html/
COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]

EXPOSE 80
