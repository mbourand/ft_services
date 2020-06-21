FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && \
	apk add mysql mysql-client telegraf

COPY srcs/liveness.sh /liveness.sh
COPY srcs/telegraf.conf /telegraf.conf
COPY srcs/setup-mysql.sh .
COPY srcs/run-mysql.sh .
COPY srcs/wordpress.sql /wordpress.sql

EXPOSE 3306

CMD ["sh", "run-mysql.sh"]