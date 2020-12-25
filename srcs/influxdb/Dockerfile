FROM alpine:latest

RUN apk update
RUN apk add libc6-compat supervisor influxdb
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 8086

CMD sh start.sh
