FROM alpine:3.12

RUN apk update 

RUN apk add vsftpd supervisor
RUN mkdir -p /var/ftp && mkdir -p /etc/ssl/private && mkdir -p /etc/ssl/certs && mkdir -p /var/ftp/user

RUN chmod 777 /var && chmod 777 /var/ftp && chmod 777 /var/ftp/user
RUN adduser -D user -h /var/ftp/user
RUN chown user:user /var/ftp/user
RUN echo "user:pass" | chpasswd
COPY ./supervisord.conf /etc/supervisor.conf
COPY ./start_ftps.sh /start_ftps.sh
RUN chmod -R 755 /start_ftps.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod -R 777 /etc/vsftpd/vsftpd.conf

RUN		apk add openssl ; \ 	
		mkdir /etc/ssl ; \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/khermann.key \
		-out /etc/ssl/khermann.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=Ecole42/OU=School21/CN=khermann"

EXPOSE 21 21000

CMD sh start_ftps.sh