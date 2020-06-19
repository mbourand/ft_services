MINIKUBE_IP=$(cat minikube_ip)
telegraf --config /telegraf.conf &
/usr/sbin/pure-ftpd -j -p 21000:21000 -P "$MINIKUBE_IP"