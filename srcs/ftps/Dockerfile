FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && \
	apk add openssl pure-ftpd telegraf && \
	rm -rf /var/cache/apk/*

# ssl setup
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem \
	-subj "/C=FR/ST=Paris/L=City/O=ft_services inc./OU=Nothing/CN=localhost/emailAddress=admin@localhost.com" && \
	chmod 600 /etc/ssl/private/pure-ftpd.pem

RUN { echo "password"; echo "password"; } | adduser user

COPY srcs/liveness.sh /liveness.sh
COPY srcs/minikube_ip .
COPY srcs/run-ftps.sh .
COPY srcs/setup-ftps.sh .
COPY srcs/telegraf.conf /telegraf.conf

EXPOSE 21 21000

RUN sh setup-ftps.sh

CMD ["sh", "run-ftps.sh"]
