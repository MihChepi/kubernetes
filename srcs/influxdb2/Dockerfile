FROM	alpine:3.12

RUN 	apk update

COPY	start.sh				/

RUN	apk add influxdb \
	wget tar supervisor

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk add telegraf
RUN		mkdir -p /run/openrc
RUN		touch /run/openrc/softlevel

COPY	supervisord.conf	/etc/.
COPY	telegraf.conf		/etc/
COPY	start.sh			/

VOLUME ["/var/lib/influxdb"]

EXPOSE	8680

ENTRYPOINT [ "start.sh" ]
