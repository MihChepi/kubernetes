minikube stop
minikube delete

minikube start --driver=virtualbox --cpus=4 --memory=4G --disk-size=15G

eval $(minikube docker-env)


docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

#metallb
minikube addons enable metallb
kubectl apply -f srcs/configmap.yaml

#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

#mysql
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

#phpmyadmin
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

#wordpress
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

#ftp
docker build -t ftp_image ./srcs/ftp/.
kubectl apply -f ./srcs/ftp/ftp.yaml

#influxdb
#docker build -t influxdb_image ./srcs/influxdb/.
#kubectl apply -f ./srcs/influxdb/influxdb.yaml

#telegraph
#docker build -t telegraf_img ./srcs/telegraf/.
#kubectl apply -f ./srcs/telegraf/telegraf-deployment.yaml
#kubectl apply -f ./srcs/telegraf/telegraf-configmap.yaml


