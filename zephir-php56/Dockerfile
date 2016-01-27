FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    locale-gen en_US.UTF-8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python-software-properties software-properties-common

ENV LC_ALL en_US.UTF-8
RUN add-apt-repository -y ppa:ondrej/php5-5.6 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
    apt-get update && \
    apt-get install -y git re2c libpcre3-dev php5-dev

RUN apt-get autoclean -y && \
    apt-get autoremove -y

WORKDIR /opt
RUN git clone https://github.com/phalcon/zephir.git && \
    cd zephir/ && ./install -c

WORKDIR /
CMD ["zephir"]
