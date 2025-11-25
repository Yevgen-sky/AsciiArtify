
kubectl-kubeplugin — це кастомний плагін для kubectl, який виводить статистику CPU та памʼяті у форматі CSV для будь-якого ресурсу Kubernetes (pods, nodes тощо).

Встановлення

Переконайтесь, що у репозиторії є файл:

scripts/kubectl-kubeplugin


Дайте йому права на виконання:

chmod +x scripts/kubectl-kubeplugin


Додайте директорію scripts/ у змінну PATH:

export PATH="$PATH:$(pwd)/scripts"


Рекомендація: додайте цю команду у ~/.bashrc або ~/.zshrc.

Використання
Базовий синтаксис:
kubectl kubeplugin <resource> -n <namespace>

Приклади:

Отримати статистику по pod'ах у namespace kube-system:

kubectl kubeplugin pods -n kube-system


Отримати статистику по nodes:

kubectl kubeplugin nodes -n kube-system

Формат виводу
Resource,Namespace,Name,CPU,Memory
pods,kube-system,coredns-66bc5c9577-ckkrg,4m,74Mi
pods,kube-system,etcd-minikube,41m,101Mi
pods,kube-system,kube-apiserver-minikube,72m,413Mi
...

Вимоги

Kubernetes cluster (локальний або remote)

Активований metrics-server
Для Minikube:

minikube addons enable metrics-server
