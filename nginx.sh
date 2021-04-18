eval $(minikube docker-env)
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
