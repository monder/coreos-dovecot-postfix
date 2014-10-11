#!/bin/sh

/etc/init.d/rsyslog start
/etc/init.d/postfix start
/etc/init.d/dovecot start

tail -f /var/log/messages
