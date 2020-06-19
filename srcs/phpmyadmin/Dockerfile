FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session telegraf

COPY srcs/phpMyAdmin-4.9.5-all-languages.tar.gz .

COPY srcs/setup-phpmyadmin.sh .
COPY srcs/run-phpmyadmin.sh .

COPY srcs/minikube_ip /minikube_ip

RUN tar -xf phpMyAdmin-4.9.5-all-languages.tar.gz

COPY srcs/telegraf.conf /telegraf.conf
COPY srcs/config.inc.php phpmyadmin/config.inc.php

RUN sh setup-phpmyadmin.sh

CMD ["sh", "run-phpmyadmin.sh"]