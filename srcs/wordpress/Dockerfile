FROM alpine:latest

RUN apk update
RUN apk add nginx supervisor php7 php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-fpm libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN wget http://wordpress.org/latest.tar.gz
RUN mkdir /www
RUN tar -xf latest.tar.gz --strip-components=1 -C /www
RUN rm latest.tar.gz

COPY wp-config.php /www/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/
COPY telegraf.conf /etc/telegraf/

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 5050

CMD sh start.sh
