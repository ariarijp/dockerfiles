FROM node:latest
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

# Install PhantomJS and CasperJS
RUN npm install -g phantomjs casperjs

ADD *.js /tmp/
ADD *.coffee /tmp/

ENTRYPOINT ["casperjs", "/tmp/redashReloader.js"]
