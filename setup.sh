minikube start --driver=virtualbox --cpus=4 --memory=4G --disk-size=15G

eval $(minikube docker-env)

#docker pull metallb/speaker:v0.8.2
#docker pull metallb/controller:v0.8.2

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
docker build -t ftps_image ./srcs/ftps/.
kubectl apply -f ./srcs/ftps/ftps.yaml

#grafana
docker build -t grafana_image ./srcs/grafana/.
kubectl apply -f ./srcs/grafana/grafana.yaml

#influxdb
docker build -t influxdb_image ./srcs/influxdb/.
kubectl apply -f ./srcs/influxdb/influxdb.yaml


# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana-server
# kubectl exec deploy/influxdb -- pkill influxd
# kubectl exec deploy/mysql -- pkill mysqld
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill fpm
# kubectl exec deploy/wordpress -- pkill fpm
# kubectl exec deploy/influxdb -- pkill telegraf