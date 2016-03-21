FROM ubuntu:trusty
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN apt-get update && \
    apt-get install -y wget libjpeg-turbo8 libfreetype6 libicu52 fontconfig libx11-6 libxext6 libxrender1 libxcb1 xfonts-base xfonts-75dpi && \
    wget https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb -O /tmp/wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb && \
    dpkg -i /tmp/wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb && \
    rm /tmp/wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb

ENTRYPOINT ["wkhtmltoimage"]
