FROM alpine:latest

RUN apk update
RUN apk add vsftpd openssl libc6-compat supervisor
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C /
RUN rm telegraf-1.17.0_linux_amd64.tar.gz

RUN openssl req -newkey rsa:4096 -x509 -days 356 -nodes -out /etc/vsftpd/mgeneviv.crt -keyout /etc/vsftpd/mgeneviv.key -subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=mgeneviv/CN=School 21"

RUN adduser -D -g 'mgeneviv' mgeneviv
RUN echo "mgeneviv:password" | chpasswd

RUN mkdir -p /var/ftp

COPY supervisord.conf /etc/
COPY vsftpd.conf /etc/vsftpd/
COPY telegraf.conf /etc/telegraf/

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 21 21000

CMD sh start.sh
