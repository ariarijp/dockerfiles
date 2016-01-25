FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y supervisor nginx && \
    mkdir -p /var/log/supervisor

COPY ./files/nginx/default /etc/nginx/sites-enabled/
COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]

EXPOSE 8080
