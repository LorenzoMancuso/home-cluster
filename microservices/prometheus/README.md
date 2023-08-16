helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install kp prometheus-community/kube-prometheus-stack -n prometheus --create-namespace
helm upgrade --install node-exporter prometheus-community/prometheus-node-exporter -n prometheus
