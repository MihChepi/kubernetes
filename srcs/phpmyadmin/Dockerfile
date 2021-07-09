# 
#  phpyadmin 
#
FROM alpine:3.12

RUN		apk update

RUN		apk add nginx

RUN 	apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
		php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql \ 
		php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext \
		php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl \
		php7-ctype php7-session php7-mbstring

COPY	nginx.conf /
COPY 	start.sh /
COPY	supervisord.conf /
COPY	config.inc.php /

RUN		apk add wget tar ; \
		#nginx
		mv nginx.conf /etc/nginx/nginx.conf ;\
		mkdir -p /run/nginx ;\
		nginx -g 'pid /var/run/nginx.pid;' ; \
		#phpmyadmin
		mkdir -p /usr/share/webapps/ ;\
		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz	 ;\
		tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz ; \
		mv phpMyAdmin-5.0.2-all-languages /usr/share/webapps/phpmyadmin ;\
		rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz ;\
		chmod -R 777 /usr/share/webapps/ ; \
		ln -s /usr/share/webapps/phpmyadmin/ /var/www/phpmyadmin ;\
		mv config.inc.php /usr/share/webapps/phpmyadmin ; \
		apk add supervisor ; \
		mv supervisord.conf /etc/. 

EXPOSE 	5000 

CMD 	sh start.sh
