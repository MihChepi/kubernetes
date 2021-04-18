eval $(minikube docker-env)
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml
