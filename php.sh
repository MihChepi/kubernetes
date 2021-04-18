eval $(minikube docker-env)
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
