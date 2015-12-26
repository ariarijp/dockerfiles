FROM ubuntu:14.04.2
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN \
locale-gen en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \
apt-get update -qq && \
apt-get install -y -qq software-properties-common && \
add-apt-repository -y ppa:ondrej/php5-5.6 && \
add-apt-repository -y ppa:phalcon/stable && \
add-apt-repository -y ppa:brightbox/ruby-ng && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
apt-get update -qq && \
apt-get upgrade -y -qq

RUN \
apt-get install -y -qq \
  git wget curl gcc autoconf \
  php5-dev php5-cli php5-mcrypt php5-gd php5-curl php5-mysql php5-redis php5-xdebug \
  nodejs npm \
  ruby2.1 && \
apt-get autoremove -y -qq && \
update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN \
git clone git://github.com/phalcon/cphalcon.git && \
cd cphalcon/build && \
sudo ./install

RUN \
wget -q https://phar.phpunit.de/phpunit.phar && \
chmod +x phpunit.phar && \
mv phpunit.phar /usr/local/bin/phpunit && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ && \
mv /usr/local/bin/composer.phar /usr/local/bin/composer && \
wget -c http://static.phpmd.org/php/latest/phpmd.phar && \
mv phpmd.phar /usr/local/bin/phpmd && \
chmod a+x /usr/local/bin/phpmd && \
wget https://phar.phpunit.de/phpcpd.phar && \
chmod a+x phpcpd.phar && \
mv phpcpd.phar /usr/local/bin/phpcpd && \
npm install bower -g

RUN \
echo "extension=phalcon.so" > /etc/php5/mods-available/phalcon.ini && \
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cli/conf.d/90-phalcon.ini

CMD ["/bin/bash"]
