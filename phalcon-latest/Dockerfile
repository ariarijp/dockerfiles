FROM ubuntu:14.04.2
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN locale-gen en_US.UTF-8

RUN \
locale-gen en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \
apt-get update && \
apt-get install -y software-properties-common git && \
add-apt-repository -y ppa:ondrej/php && \
apt-get update && \
apt-get install -y php5.6-dev php5.6-mysql gcc libpcre3-dev

RUN \
git clone --depth=1 git://github.com/phalcon/cphalcon.git && \
cd cphalcon/build && \
./install

RUN echo "extension=phalcon.so" > /etc/php/5.6/cli/conf.d/99-phalcon.ini

CMD ["/bin/bash"]
