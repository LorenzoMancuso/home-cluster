# installation
default installation with k3s

# role creation

kubectl create -f admin-user.yml -f admin-user-role.yml	

# get token

kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'

# access

## through NodePort
https://192.168.88.10:31299

## through IngressRoute from Traefik
https://192.168.88.10/kubernetes