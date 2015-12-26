# build:  docker build -t ariarijp/elasticmq .
# run:    docker run --rm -p 9324:9324 ariarijp/elasticmq

FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

EXPOSE 9324

RUN apt-get update -y && \
    apt-get install -y curl openjdk-7-jre-headless
RUN mkdir -p /elasticmq && \
    cd /elasticmq && \
    curl -s -o /elasticmq/elasticmq-server-0.8.12.jar https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-0.8.12.jar
ADD run.sh /
ADD custom.conf my_logback.xml /elasticmq/

CMD ["/run.sh"]
