FROM alpine

# install nginx and openssl
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && \
	apk add openrc --no-cache && \
	apk add openssl openssh nginx telegraf && \
	mkdir -p /run/nginx && \
	mkdir /www && \
	adduser -D -g 'www' www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	adduser -D user && \
	echo "user:password" | chpasswd

# ssl setup
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=Paris/L=City/O=ft_services inc./OU=Nothing/CN=localhost/emailAddress=admin@localhost.com" && \
	openssl dhparam -out /etc/nginx/dhparam.pem 1024
RUN ssh-keygen -A

# copy source files
COPY srcs/telegraf.conf /telegraf.conf
COPY srcs/run-nginx.sh .
COPY srcs/index.html /www/index.html
COPY srcs/nginx.conf /etc/nginx/nginx.conf

# http/s ports
EXPOSE 80 443 22

# run nginx
CMD ["sh", "./run-nginx.sh"]
