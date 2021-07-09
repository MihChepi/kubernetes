#
# mysql 
#
FROM	alpine:3.12

RUN 	apk update


COPY	my.cnf					/etc/
COPY	wordpress.sql			/
COPY	start.sh				/
COPY	create_database			/

RUN		apk add mysql mysql-client openrc; \
		apk add supervisor

RUN mkdir -p /run/openrc ; \
	touch /run/openrc/softlevel ; \ 
	rc-update ; \
	touch /run/openrc/softlevel

RUN chmod 755 /start.sh ;\
	chmod 755 ./etc/init.d/

VOLUME ["/sys/fs/cgroup/"]

EXPOSE	3306 

CMD sh start.sh
