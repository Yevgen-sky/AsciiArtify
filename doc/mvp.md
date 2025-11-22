# MVP AsciiArtify (Level A)

## Вступ
Мінімальна версія продукту **AsciiArtify** складається з простого застосунку, який демонструє базову працездатність GitOps‑підходу. Для цього використано Kubernetes‑кластер на **minikube** та **ArgoCD** для автоматичного розгортання. MVP показує, що зміни в GitHub можуть автоматично потрапляти на кластер без ручного втручання.

---

## Архітектура MVP
MVP складається з таких компонентів:
- **minikube** — локальний Kubernetes‑кластер.
- **ArgoCD** — GitOps‑система для синхронізації стану кластеру зі станом репозиторію.
- **GitHub‑репозиторій AsciiArtify** — зберігає манифести Deployment/Service.
- **Автоматична синхронізація (auto‑sync)** — ArgoCD відстежує зміни та миттєво застосовує їх у кластері.

Схема:
```
GitHub → ArgoCD → Kubernetes (minikube)
```

---

## Кроки розгортання (коротке демо)

### 1. Запуск кластера minikube
```
minikube start --driver=docker
```

### 2. Встановлення ArgoCD
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### 3. Порт‑форвард до UI ArgoCD
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

### 4. Отримання пароля адміністратора
```
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
```

### 5. Додавання застосунку в ArgoCD
```
kubectl apply -f app/go-demo-app.yaml -n argocd
```
ArgoCD автоматично витягує Deployment та Service з GitHub:
```
/k8s/hello-world/deployment.yaml
/k8s/hello-world/service.yaml
```

---

## Демонстрація автоматичної синхронізації
1. Ви змінюєте файл у GitHub, наприклад `deployment.yaml`.
2. ArgoCD отримує новий commit.
3. Статус переходить у **OutOfSync → Syncing → Synced**.
4. Kubernetes оновлює Pod до нової версії.

Приклад у ArgoCD:
- Healthy
- Synced
- Автоматичне застосування змін

---

## Висновки
- **ArgoCD** повністю автоматизує процес розгортання.
- **GitHub → ArgoCD → Kubernetes** працює як єдиний GitOps‑потік.
- MVP дозволяє демонструвати базову функціональність продукту AsciiArtify та готовий для запуску фокус‑тестування.

---

Документ підготовлено для репозиторію **AsciiArtify** (`doc/MVP.md`).

