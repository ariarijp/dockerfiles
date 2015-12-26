FROM ariarijp/sshd
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >/etc/apt/sources.list.d/rabbitmq.list
RUN echo "deb http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list

RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add -
RUN wget -q http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -O- | apt-key add -

RUN apt-get update
RUN apt-get -y --allow-unauthenticated --force-yes install erlang-nox rabbitmq-server redis-server sensu uchiwa git

COPY ./files/rabbitmq/rabbitmq.config /etc/rabbitmq/
COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/
COPY ./files/sensu/conf.d/*.json /etc/sensu/conf.d/
COPY ./files/sensu/uchiwa.json /etc/sensu/
COPY ./files/entrypoint.sh ~/

RUN mkdir -p /etc/sensu/ssl /etc/rabbitmq/ssl
RUN rabbitmq-plugins enable rabbitmq_management

EXPOSE 22 3000 5672 4567
CMD ["~/entrypoint.sh"]
