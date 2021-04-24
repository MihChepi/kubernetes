FROM alpine:3.12

RUN apk update && apk upgrade && apk add influxdb wget supervisor 


RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_i386.tar.gz ;\
tar -xf telegraf-1.18.0_linux_i386.tar.gz && rm -rf telegraf-1.18.0_linux_i386.tar.gz ;\
cp -r telegraf-1.18.0/* ./ && rm -rf /telegraf-1.18.0

RUN /usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY ./supervisord.conf /etc/supervisord.conf

COPY ./influxdb.conf /etc/influxdb.conf

VOLUME  ["/var/lib/influxdb"]

COPY ./start_influxdb.sh /

RUN chmod -R 755 start_influxdb.sh
EXPOSE 8086

CMD ["/start_influxdb.sh"]
