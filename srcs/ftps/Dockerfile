#
# ftps
#
FROM alpine:3.12

RUN apk update

RUN apk add vsftpd openssl

#ssl
RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/vsftpd/khermann.key \
		-out /etc/vsftpd/khermann.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=Ecole42/OU=School21/"

COPY start.sh /

COPY ftps.conf /etc/vsftpd/ftps.conf

RUN mkdir -p /var/ftps/admin ;\
	chmod 755 /var/ftps/admin ;\ 
	adduser -h /var/ftps/admin -D admin ;\
	echo admin:admin | chpasswd ;\
	chown admin:admin /var/ftps/admin/ ;\
	chmod 755 /start.sh

EXPOSE 21 21000

CMD sh start.sh