#!/bin/bash

sed -i s/@NAME@/`hostname`/ /etc/sensu/conf.d/client.json
sed -i s/@ADDRESS@/`ip addr show eth0  | grep inet\ | awk '{print $2}' | cut -d/ -f1`/ /etc/sensu/conf.d/client.json
/usr/bin/supervisord
