FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session telegraf

COPY srcs/latest.tar.gz .
RUN tar -xf latest.tar.gz
COPY srcs/wp-config.php /wordpress/wp-config.php

COPY srcs/telegraf.conf /telegraf.conf
COPY srcs/minikube_ip /minikube_ip
COPY srcs/setup-wordpress.sh .
COPY srcs/run-wordpress.sh .

EXPOSE 5050

RUN sh setup-wordpress.sh
CMD ["sh", "run-wordpress.sh"]