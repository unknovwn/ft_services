FROM alpine:latest

RUN apk update
RUN apk add nginx openssl openssh supervisor libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN openssl req -newkey rsa:4096 -x509 -days 356 -nodes -out /etc/ssl/certs/mgeneviv.crt -keyout /etc/ssl/private/mgeneviv.key -subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=mgeneviv/CN=School 21"

COPY supervisord.conf /etc/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY telegraf.conf /etc/telegraf/

RUN ssh-keygen -A
RUN adduser -D -g 'mgeneviv' mgeneviv
RUN echo "mgeneviv:password" | chpasswd

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 80 443 22

CMD sh start.sh
