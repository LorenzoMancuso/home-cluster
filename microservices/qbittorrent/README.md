helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm upgrade --install qbittorrent k8s-at-home/qbittorrent -f values.yml

https://staging.artifacthub.io/packages/helm/k8s-at-home/qbittorrent/12.2.0?modal=valuess