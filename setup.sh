#!/bin/bash

check_requirements()
{
	if [ ! -e $(which docker) ]; then
		>&2 echo "Docker is not installed."
		exit 1
	elif [ ! -e $(which minikube) ]; then
		>&2 echo "Minikube is not installed."
		exit 1
	elif [ ! -e $(which kubectl) ]; then
		>&2 echo "Kubernetes is not installed."
		exit 1
	fi
}

init_minikube()
{
	minikube status > /dev/null 2> /dev/null

	if [ $? -ne 0 ]; then
		minikube start --vm-driver=docker --cpus 2 --extra-config=apiserver.service-node-port-range=1-35000
	fi

	minikube addons enable dashboard
	minikube addons enable ingress

	# Connect env to docker env to pull images from srcs folder
	eval $(minikube docker-env)

	CLUSTER_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

	echo -n $CLUSTER_IP > srcs/ftps/srcs/minikube_ip
	echo -n $CLUSTER_IP > srcs/wordpress/srcs/minikube_ip
	echo -n $CLUSTER_IP > srcs/phpmyadmin/srcs/minikube_ip
}

clean_cluster()
{
	kubectl delete services --all
	kubectl delete deployments --all
	kubectl delete ingress --all
	kubectl delete pvc --all
}

build_images()
{
	docker build -t mbourand/nginx:1.0 srcs/nginx
	docker build -t mbourand/ftps:1.0 srcs/ftps
	docker build -t mbourand/mysql:1.0 srcs/mysql
	docker build -t mbourand/wordpress:1.0 srcs/wordpress
	docker build -t mbourand/phpmyadmin:1.0 srcs/phpmyadmin
	docker build -t mbourand/influxdb:1.0 srcs/influxdb
	docker build -t mbourand/grafana:1.0 srcs/grafana
}

apply_configs()
{
	kubectl apply -f srcs/nginx/nginx.yaml
	kubectl apply -f srcs/ftps/ftps.yaml
	kubectl apply -f srcs/mysql/mysql.yaml
	kubectl apply -f srcs/wordpress/wordpress.yaml
	kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
	kubectl apply -f srcs/influxdb/influxdb.yaml
	kubectl apply -f srcs/grafana/grafana.yaml
	kubectl apply -f srcs/ingress.yaml
}

check_requirements
init_minikube
if [ ! -z $1 ] && [ $1 = "clean" ]; then
	clean_cluster
fi
build_images
apply_configs
echo -e "\e[1;92mIP : $CLUSTER_IP\e[39m"
minikube dashboard
