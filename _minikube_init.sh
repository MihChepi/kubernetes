
#create goinfre minikube
rm -rf ~/goinfre/.minikube
rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/

#clear minicube
minikube delete

