FROM java:8-jre-alpine
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN apk add --update ruby && \
    apk add --update  --virtual .builddeps curl ruby-dev alpine-sdk && \
    gem install json --no-ri --no-rdoc && \
    curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest" && \
    chmod +x /usr/local/bin/digdag && \
    mkdir -p /opt/digdag/tasks && \
    apk del .builddeps

COPY workflow.dig /opt/digdag/
COPY tasks/ /opt/digdag/tasks/

WORKDIR /opt/digdag
CMD /bin/sh
