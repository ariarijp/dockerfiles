FROM dorowu/ubuntu-desktop-lxde-vnc
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN sed -i s/tw.archive.ubuntu.com/jp.archive.ubuntu.com/ /etc/apt/sources.list

RUN apt-get update
RUN apt-get purge -y libreoffice*
RUN apt-get autoremove -y
RUN apt-get install -y wget

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.15.0/geckodriver-v0.15.0-linux64.tar.gz
RUN tar xzf geckodriver-v0.15.0-linux64.tar.gz
RUN mv geckodriver /usr/local/bin/
RUN rm geckodriver-v0.15.0-linux64.tar.gz

ADD main.py /root/
RUN pip install selenium
