eval $(minikube docker-env)
docker build -t ftp_image ./srcs/ftp/.
kubectl apply -f ./srcs/ftp/ftp.yaml
