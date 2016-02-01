FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/archive.ubuntu.com/ftp.jaist.ac.jp/ /etc/apt/sources.list && \
    locale-gen en_US.UTF-8

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git software-properties-common wget

ENV LC_ALL en_US.UTF-8
RUN add-apt-repository -y ppa:ondrej/php && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
    apt-get update && \
    apt-get install -y php7.0-dev
RUN apt-get autoclean -y && apt-get autoremove -y

WORKDIR /opt
RUN git clone https://github.com/xdebug/xdebug.git && \
    cd xdebug/ && \
    phpize && ./configure --enable-xdebug && make && make install && \
    echo "zend_extension=xdebug.so" > /etc/php/mods-available/xdebug.ini && \
    phpenmod xdebug

WORKDIR /
ENTRYPOINT ["php", "/opt/xdebug/contrib/tracefile-analyser.php"]
