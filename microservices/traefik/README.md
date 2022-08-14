https://artifacthub.io/packages/helm/traefik/traefik

# Installation

helm repo add traefik https://helm.traefik.io/traefik
helm repo update
// helm upgrade --install traefik traefik/traefik --namespace traefik --values values.yml
helm upgrade --install traefik traefik/traefik --values values.yml

kubectl apply -f dashboard.yml

## create openssl self signed cert
openssl req  -nodes -new -x509  -keyout server.key -out server.crt -config openssl.conf -days 365

## create secret with cert
kubectl create secret generic mancuso-services-cert-secret --from-file=tls.crt=./server.crt --from-file=tls.key=./server.key

## set cert as default

# SSO
## create SSO secret
kubectl create secret generic traefik-sso \
--from-literal=clientid=XXX.apps.googleusercontent.com \
--from-literal=clientsecret=XXX \
--from-literal=secret=SomEtHingRandom


# Access

## Port-forward
kubectl port-forward $(kubectl get pods --selector "app.kubernetes.io/name=traefik" --output=name) 9000:9000

then go to: http://localhost:9000/dashboard/
**Attention:** the last slash is mandatory

