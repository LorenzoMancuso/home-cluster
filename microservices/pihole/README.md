helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/ && helm repo update

kubectl create secret generic pihole-secret \
	--from-literal='password=<ADMIN_PASSWORD>' \
	--namespace pihole

helm upgrade --install pihole mojo2600/pihole \
  --namespace pihole \
  --values pihole-values.yml