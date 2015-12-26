FROM ariarijp/sshd
MAINTAINER Takuya Arita <takuya.arita@gmail.com>

RUN apt-get update
RUN apt-get install -y build-essential libffi-dev apache2 git python-dev python-pip python-cairo-dev libapache2-mod-wsgi

RUN git clone https://github.com/graphite-project/graphite-web.git
RUN git clone https://github.com/graphite-project/carbon.git
RUN git clone https://github.com/graphite-project/whisper.git

RUN cd /graphite-web; git checkout 0.9.x; pip install -r requirements.txt; python check-dependencies.py; python setup.py install
RUN cd /whisper; git checkout 0.9.x; python setup.py install
RUN cd /carbon; git checkout 0.9.x; python setup.py install
RUN cd /opt/graphite/conf; cp carbon.conf.example carbon.conf
RUN cd /opt/graphite/conf; cp storage-schemas.conf.example storage-schemas.conf
RUN cd /opt/graphite/conf; cp graphite.wsgi.example graphite.wsgi
RUN cd /opt/graphite/webapp/graphite/; cp local_settings.py.example local_settings.py
RUN echo "SECRET_KEY = '`date +%s | sha256sum | base64 | head -c 16 ; echo`'" >> /opt/graphite/webapp/graphite/local_settings.py
RUN cd /opt/graphite/webapp/graphite; python manage.py syncdb --noinput

RUN mkdir -p /etc/apache2/run
RUN chown -R www-data:www-data /opt/graphite/storage
RUN cp /graphite-web/examples/example-graphite-vhost.conf /etc/apache2/sites-available/000-default.conf
RUN echo "<Location />\n    Require all granted\n</Location>" > /etc/apache2/conf-available/graphite.conf
RUN a2enconf graphite

RUN service apache2 stop

EXPOSE 22 80 2003
COPY ./files/supervisord/*.conf /etc/supervisor/conf.d/
COPY ./files/entrypoint.sh ~/
CMD ["~/entrypoint.sh"]
