#!/bin/sh

if [ ! -f $CONF_FILE ]
then
  cat <<EOF > $CONF_FILE
# https://github.com/pymumu/smartdns/blob/master/etc/smartdns/smartdns.conf 
bind :53
log-level info
cache-size 16384
server-https https://1.1.1.1/dns-query

EOF
fi


exec ./smartdns -x -f -c smartdns.conf

