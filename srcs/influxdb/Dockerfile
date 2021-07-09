#
# influxDB
#
FROM alpine:3.12

RUN		apk update

RUN		apk add influxdb wget supervisor 

RUN 	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.1_linux_i386.tar.gz ;\
		tar xf telegraf-1.18.1_linux_i386.tar.gz ;\
		mv telegraf-1.18.1 /telegraf

RUN		mkdir /etc/telegraf ;\
		/telegraf/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY		./supervisord.conf /etc/supervisord.conf
COPY		./influxdb.conf /etc/influxdb.conf

COPY		./start.sh /

RUN			chmod -R 755 start.sh
EXPOSE		8086

CMD		/start.sh
