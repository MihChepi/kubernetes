#
# wordpress  
# 
FROM alpine:3.12

COPY ./srcs/* ./

RUN		apk update 
RUN 	apk add nginx
RUN		apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
		php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql \
		php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext \
		php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl \
		php7-ctype php7-session php7-mbstring
RUN		apk add wget tar supervisor; \
		#nginx
		mv nginx.conf /etc/nginx/nginx.conf ;\
		mkdir -p /run/nginx ;\
		nginx -g 'pid /var/run/nginx.pid;' ;\
		#wordpress
		wget https://wordpress.org/wordpress-5.7.tar.gz ;\
		tar -xzvf wordpress-5.7.tar.gz ;\
		rm -rf wordpress-5.7.tar.gz ;\
		mv wordpress /var/www/. ;\
		cp wp-config.php /var/www/wordpress ;\
		cp supervisord.conf /etc/. 


EXPOSE 5050

CMD sh start.sh
