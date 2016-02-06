FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    locale-gen en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password password cross2016"'
RUN bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password_again password cross2016"'

RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get install -y mysql-server

RUN apt-get autoclean -y && \
    apt-get autoremove -y

COPY ./init.sql /tmp/
COPY ./report.csv /tmp/

CMD service mysql start && \
    cat /tmp/init.sql | mysql -uroot -pcross2016 && \
    echo "SELECT report_from, placement, SUM(spend) FROM report GROUP BY report_from, placement;" | mysql -uroot -pcross2016 cross2016 > /mnt/docker/result.tsv
