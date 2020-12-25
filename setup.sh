#!/bin/zsh

minikube --driver=virtualbox --memory='3000' --disk-size 20000MB start
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server

eval $(minikube docker-env)

docker build -t nginx_image srcs/nginx
docker build -t phpmyadmin_image srcs/phpmyadmin
docker build -t wordpress_image srcs/wordpress
docker build -t mysql_image srcs/mysql
docker build -t ftps_image srcs/ftps
docker build -t grafana_image srcs/grafana
docker build -t influxdb_image srcs/influxdb

kubectl apply -f srcs/yaml/

minikube dashboard
