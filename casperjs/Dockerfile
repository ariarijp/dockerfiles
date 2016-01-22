FROM node:latest
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

# Install Japanese Font
RUN apt-get update
RUN apt-get install -y fonts-migmix

# Install PhantomJS and CasperJS
RUN npm install -g phantomjs casperjs

ADD *.js /tmp/
ADD *.coffee /tmp/

ENTRYPOINT ["casperjs"]
