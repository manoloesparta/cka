LOCAL_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

# Start cluster
sudo kubeadm init --pod-network-cidr 10.0.1.0/24 --apiserver-advertise-address $LOCAL_IP

# Setup for user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install CNI
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
