FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat && \
	apk add wget telegraf && \
	wget https://dl.grafana.com/oss/release/grafana-7.0.3.linux-amd64.tar.gz

RUN tar -zxf grafana-7.0.3.linux-amd64.tar.gz

COPY srcs/grafana.db /grafana-7.0.3/data/grafana.db
COPY srcs/run-grafana.sh .
COPY srcs/telegraf.conf /telegraf.conf

CMD ["sh", "run-grafana.sh"]

EXPOSE 3000