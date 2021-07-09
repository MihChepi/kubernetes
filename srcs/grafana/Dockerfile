#
# Grafana
#
FROM alpine:3.12

RUN apk update 

RUN apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz 
RUN	tar -zxvf grafana-7.5.4.linux-amd64.tar.gz ;\
	mv grafana-7.5.4 grafana
	

COPY ./start.sh /
RUN chmod -R 755 start.sh

COPY ./grafana.db ./grafana/data/grafana.db
RUN chmod -R 755 ./grafana/data/grafana.db

EXPOSE 3000

CMD /start.sh
