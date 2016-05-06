FROM ubuntu:14.04.2
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN \
locale-gen en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \
apt-get update && \
apt-get install -y software-properties-common && \
add-apt-repository -y ppa:ondrej/php5-5.6 && \
add-apt-repository -y ppa:phalcon/stable && \
apt-get update -qq

RUN apt-get install -y php5-phalcon

CMD ["/bin/bash"]
