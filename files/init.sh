#!/bin/sh

externip=$(curl -s ifconfig.me)
localnet=$(ip -4 -o addr show docker0 | perl -lane 'print $F[3]')
sed -i "s|externip=.*|externip=$externip|" /etc/asterisk/sip.conf
sed -i "s|localnet=.*|localnet=$localnet|" /etc/asterisk/sip.conf
sed -i -e "s/5060/$ASTPORT/" /etc/asterisk/sip.conf

asterisk start
sleep infinity
