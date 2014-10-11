FROM debian:latest

RUN apt-get update
RUN apt-get -y upgrade

RUN echo "postfix postfix/mailname string example.com" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

RUN apt-get install -y postfix postfix-pgsql dovecot-common dovecot-imapd

RUN mkdir /var/vmail
VOLUME /var/vmail

VOLUME /etc/dovecot
VOLUME /etc/postfix

EXPOSE 25
EXPOSE 465
EXPOSE 143
EXPOSE 993

ADD data/start.sh /start
RUN chmod +x /start

ENTRYPOINT ["/start"]
