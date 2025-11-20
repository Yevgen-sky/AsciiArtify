# PoC: Доступ до інтерфейсу ArgoCD (AsciiArtify)

Репозиторій: https://github.com/Yevgen-sky/AsciiArtify
Гілка: `main`  
Приклад демо з офіційної доки: https://argo-cd.readthedocs.io/en/stable/

## 1) Передумови

- Kubernetes кластер (локально: `minikube` на Podman/CRI-O).
- `kubectl`, `argocd` (CLI опціонально).
- Цей репозиторій клоновано локально.

## 2) Встановити ArgoCD

```bash
kubectl create namespace argocd
kubectl -n argocd apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


# або:

# ./scripts/argocd-install.sh

