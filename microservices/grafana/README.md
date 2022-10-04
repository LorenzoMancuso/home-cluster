helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install grafana grafana/grafana -f values.yml


NOTE: this is no longer used because grafana is already included in `kube-prometheus-stack`