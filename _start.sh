minikube stop
minikube delete

minikube start --vm-driver=virtualbox --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=15G

eval $(minikube docker-env)

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

minikube addons enable metallb
kubectl apply -f srcs/configmap.yaml

