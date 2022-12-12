<!-- https://www.fosstechnix.com/kubernetes-traefik-ingress-letsencrypt/ -->

Before installing the chart, you must first install the cert-manager CustomResourceDefinition resources:

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.crds.yaml

helm repo add jetstack https://charts.jetstack.io
helm upgrade --install cert-manager --namespace cert-manager --create-namespace --version v1.10.1 jetstack/cert-manager -f values.yml