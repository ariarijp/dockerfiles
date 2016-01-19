FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>;
RUN \
  locale-gen en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  apt-get update && \
  apt-get install -y -qq software-properties-common && \
  add-apt-repository -y ppa:phalcon/legacy && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    git wget curl \
    php5-cli php5-mcrypt php5-gd php5-curl php5-mysql php5-phalcon php5-redis \
    nodejs npm && \
  apt-get autoremove -y -qq && \
  update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
RUN \
  wget -q https://phar.phpunit.de/phpunit-old.phar && \
  chmod +x phpunit-old.phar && \
  mv phpunit-old.phar /usr/local/bin/phpunit && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ && \
  mv /usr/local/bin/composer.phar /usr/local/bin/composer && \
  wget -c http://static.phpmd.org/php/latest/phpmd.phar && \
  mv phpmd.phar /usr/local/bin/phpmd && \
  chmod a+x /usr/local/bin/phpmd && \
  wget https://phar.phpunit.de/phpcpd.phar && \
  chmod a+x phpcpd.phar && \
  mv phpcpd.phar /usr/local/bin/phpcpd && \
  npm install bower -g
CMD ["/bin/bash"]
