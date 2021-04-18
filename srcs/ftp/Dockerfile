FROM alpine:3.12

# install
RUN apk update && apk upgrade
RUN apk add vsftpd \
openssl

# get SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout \
/etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem \
-subj '/CN=ftps'

COPY ftps-entrypoint.sh /tmp/ftps-entrypoint.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/ftps/user_ftps && chmod 755 /var/ftps/user_ftps && \
adduser -h /var/ftps/user_ftps -D user_ftps && (echo user_ftps:pass_ftps | chpasswd) && \
chown user_ftps:user_ftps /var/ftps/user_ftps/ && chmod +x /tmp/ftps-entrypoint.sh

EXPOSE 21 21000

ENTRYPOINT ["/tmp/ftps-entrypoint.sh"]