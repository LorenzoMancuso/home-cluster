https://artifacthub.io/packages/helm/traefik/traefik

# Installation

helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm upgrade --install traefik traefik/traefik --namespace traefik --values values.yml

kubectl apply -f dashboard.yml

# Access

## Port-forward
kubectl port-forward $(kubectl get pods --selector "app.kubernetes.io/name=traefik" --output=name) 9000:9000

then go to: http://localhost:9000/dashboard/
**Attention:** the last slash is mandatory

## Ingress