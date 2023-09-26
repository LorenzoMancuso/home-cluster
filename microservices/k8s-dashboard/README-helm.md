helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard

kubectl apply -f k8s-dashboard-cert.yml
kubectl apply -f dashboard-user-role.yml

kubectl get secret dashboard-token -o jsonpath='{$.data.token}' | base64 -d | sed $'s/$/\\\n/g'