set -euo pipefail
kubectl apply -f k8s/argocd/app-go-demo.yaml
kubectl -n argocd get applications
