#!/bin/sh
NAME=$1
PASSWD=$2
PORT1=$3
adduser -s /sbin/nologin -H -D  $NAME && echo $NAME:$PASSWD | chpasswd
sed -i s#port=1080#port=$PORT1#g /etc/sockd.conf
sockd
