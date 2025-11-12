set -euo pipefail
kubectl delete -f k8s/hello-world/deployment.yaml -n asciiartify-hello 2>/dev/null || true
kubectl delete ns asciiartify-hello 2>/dev/null || true
minikube delete --all --purge 2>/dev/null || true
echo "Cleanup done."
