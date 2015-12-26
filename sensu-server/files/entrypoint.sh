#!/bin/bash

cd /tmp
wget http://sensuapp.org/docs/0.16/tools/ssl_certs.tar
tar -xvf ssl_certs.tar
cd ssl_certs
./ssl_certs.sh generate
cp sensu_ca/cacert.pem server/cert.pem server/key.pem /etc/rabbitmq/ssl/
cp client/cert.pem client/key.pem /etc/sensu/ssl/

/usr/bin/supervisord
