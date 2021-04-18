eval $(minikube docker-env)
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml
