MINIKUBE_IP=$(cat /minikube_ip)
sed -i 's/MINIKUBEIP/'"$MINIKUBE_IP"'/g' phpmyadmin/config.inc.php