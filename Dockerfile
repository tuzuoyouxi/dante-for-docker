FROM alpine:3.16.0
ENV USERNAME=test
ENV PASSWORD=123456
ENV PORT=1080
RUN sed -i s#dl-cdn.alpinelinux.org#mirrors.aliyun.com#g /etc/apk/repositories
RUN apk --no-cache add dante-server && rm -rf /var/cache/
RUN adduser -s /sbin/nologin -H -D test && echo test:123456 | chpasswd
RUN echo -e "\
errorlog: /var/log/sockd.errlog\n\
logoutput: /var/log/sockd.log\n\
internal: 0.0.0.0 port=1080\n\
external: $(cat /proc/net/dev | awk '{i++;if(i>2){print $1}}' | awk 'NR==2'| sed 's/[:]*$//g')\n\
user.privileged: root\n\
user.notprivileged: sockd\n\
clientmethod: none\n\
socksmethod: username\n\
client pass {\n\
    from: 0.0.0.0/0 to: 0.0.0.0/0\n\
}\n\
socks pass {\n\
    from: 0.0.0.0/0 to: 0.0.0.0/0\n\
}\n ">/etc/sockd.conf

COPY ./adduser.sh /adduser.sh
RUN chmod +x /adduser.sh

EXPOSE $PORT
CMD sh /adduser.sh $USERNAME $PASSWORD $PORT
