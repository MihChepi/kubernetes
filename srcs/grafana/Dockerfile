FROM alpine:3.12

RUN apk update && apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz 
RUN	tar -zxvf grafana-7.5.4.linux-amd64.tar.gz ;\
	mv grafana-7.5.4 grafana
	

COPY ./start_grafana.sh /
RUN chmod -R 755 start_grafana.sh

COPY ./grafana.db ./grafana/data/grafana.db

EXPOSE 3000

CMD ["start_grafana.sh"]

