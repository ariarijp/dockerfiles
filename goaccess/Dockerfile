FROM ubuntu:14.04
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN apt-get update && apt-get install -y wget
RUN echo "deb http://deb.goaccess.io $(lsb_release -cs) main" | tee -a /etc/apt/sources.list
RUN wget -O - http://deb.goaccess.io/gnugpg.key | apt-key add -
RUN apt-get update && apt-get install -y goaccess
ADD goaccess.conf /
CMD ["/bin/bash"]
