helm show values netdata/netdata > values.yaml

helm repo add netdata https://netdata.github.io/helmchart
helm upgrade --install netdata netdata/netdata -f values.yaml