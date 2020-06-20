FROM alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk update && \
	apk add influxdb telegraf

COPY srcs/liveness.sh /liveness.sh
COPY srcs/run-influxdb.sh .
COPY srcs/telegraf.conf /telegraf.conf

EXPOSE 8086

CMD ["sh", "run-influxdb.sh"]