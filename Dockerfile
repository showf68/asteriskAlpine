FROM alpine:latest

# ASTERISK
RUN apk add \
    openrc \
    curl \
    perl \
    nano \
    asterisk \
    asterisk-sample-config

RUN rm -rf /usr/lib/asterisk/modules/*pjsip* && \
    chown -R asterisk.asterisk /etc/asterisk && \
    chown -R asterisk.asterisk /var/lib/asterisk && \
    chown -R asterisk.asterisk /var/log/asterisk && \
    chown -R asterisk.asterisk /var/spool/asterisk && \
    chown -R asterisk.asterisk /usr/lib/asterisk && \
    sed -i -e 's/# MAXFILES=/MAXFILES=/' /usr/sbin/safe_asterisk

RUN echo 'asterisk -rvvvvvvvv' >/bin/ast && chmod 777 /bin/ast

ADD astConfGeneric /etc/asterisk/

ADD files/init.sh /root/init.sh
RUN ["chmod", "+x", "/root/init.sh"]
ENTRYPOINT ["/root/init.sh"]