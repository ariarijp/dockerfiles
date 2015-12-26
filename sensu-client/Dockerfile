FROM ariarijp/sshd
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add -
RUN echo "deb http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
RUN apt-get update
RUN apt-get -y --allow-unauthenticated --force-yes install sensu
RUN mkdir -p /etc/sensu/ssl

COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/
COPY ./files/sensu/conf.d/*.json /etc/sensu/conf.d/
COPY ./files/ssl_certs/*.pem /etc/sensu/ssl/
COPY ./files/entrypoint.sh ~/

CMD ["~/entrypoint.sh"]
