# home-cluster

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --node-external-ip 192.168.88.10 --disable-cloud-controller --disable traefik

## taints and toleration

You add a taint to a node using kubectl taint. For example,

```
kubectl taint nodes node1 nodeType=core:NoSchedule
```

places a taint on node node1. The taint has key key1, value value1, and taint effect NoSchedule. This means that no pod will be able to schedule onto node1 unless it has a matching toleration.

To remove the taint added by the command above, you can run:

```
kubectl taint nodes node1 nodeType=core:NoSchedule-
```

```
tolerations:
- key: "nodeType"
  operator: "Equal"
  value: "core"
  effect: "NoSchedule"
```

For k3s you have to update the coredns template:
```
sudo nano /var/lib/rancher/k3s/server/manifests/coredns.yaml
```

## affinity

Examples of node affinities:
```
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: topology.kubernetes.io/zone
          operator: In
          values:
          - antarctica-east1
          - antarctica-west1
    preferredDuringSchedulingIgnoredDuringExecution:
    - weight: 1
      preference:
        matchExpressions:
        - key: another-node-label-key
          operator: In
          values:
          - another-node-label-value
```

Node affinity for core:
```
affinity:
  nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
    - weight: 1
      preference:
        matchExpressions:
        - key: nodeType
          operator: In
          values:
          - core
```