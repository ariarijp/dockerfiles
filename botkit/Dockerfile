FROM node:latest
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN mkdir /botkit && \
    cd /botkit && \
    npm install botkit
COPY bot.js /botkit/
CMD cd /botkit && node bot.js
