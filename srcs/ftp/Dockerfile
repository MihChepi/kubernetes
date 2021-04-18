FROM alpine:3.12

RUN apk update

RUN apk add vsftpd openssl

#ssl
RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/vsftpd/vsftpd.pem \
		-out /etc/vsftpd/vsftpd.pem \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=Ecole42/OU=School21/"

COPY start.sh start.sh

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/ftps/user && chmod 755 /var/ftps/user && \
adduser -h /var/ftps/user -D user && (echo user:pass | chpasswd) && \
chown user:user /var/ftps/user/ && chmod +x /start.sh

EXPOSE 21 21000

CMD sh start.sh