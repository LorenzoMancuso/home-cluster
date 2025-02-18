helm repo add k8s-home-lab https://k8s-home-lab.github.io/helm-charts/
helm repo update
helm upgrade --install sonarr k8s-home-lab/sonarr --create-namespace -f values.yaml