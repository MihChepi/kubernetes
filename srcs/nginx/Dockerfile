# nginx 
# + ssl keyi


FROM alpine:3.12

RUN apk update

RUN	apk add nginx

COPY	nginx.conf /etc/nginx/nginx.conf
COPY	index.html /var/www/  
COPY	start.sh .

RUN		apk add openssl ; \ 	
		mkdir /etc/nginx/ssl ; \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/khermann.key \
		-out /etc/nginx/ssl/khermann.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=Ecole42/OU=School21/CN=khermann"

RUN		mkdir -p /run/nginx ; \
		nginx -g 'pid /tmp/nginx.pid;' 
	
EXPOSE 80 443

CMD sh start.sh
