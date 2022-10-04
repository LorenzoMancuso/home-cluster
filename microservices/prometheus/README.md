helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install kube-prometheus prometheus-community/kube-prometheus-stack -n prometheus
helm upgrade --install prometheus-node-exporter prometheus-community/prometheus-node-exporter -n prometheus
