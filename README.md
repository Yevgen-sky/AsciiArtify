# 1. start minikube on the podman (rootless)
minikube start --driver-podman --container-runtime=cri-o

# 2. apply demo
kubectl create namespace asciiartify-hello || true
kubectl apply -f k8s/hello-world/deployment.yaml

# 3. access to the application
kubectl -n asciiartify-hello port-forward svc/hello-world-svc 8080:80
