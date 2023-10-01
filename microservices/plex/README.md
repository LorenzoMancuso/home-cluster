helm repo add k8s-home-lab https://k8s-home-lab.github.io/helm-charts/
helm repo update
helm upgrade --install plex k8s-home-lab/plex -f values.yml



helm repo add utkuozdemir https://utkuozdemir.org/helm-charts
helm install my-release utkuozdemir/plex