#!/bin/sh

/etc/init.d/postfix start
/etc/init.d/dovecot start

tail -f
