# installation

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets

helm install sealed-secrets sealed-secrets/sealed-secrets

## kubeseal

Install the client-side tool (kubeseal) as explained in the docs below:

    https://github.com/bitnami-labs/sealed-secrets#installation-from-source

# usage
1. Create a sealed secret file running the command below:
    
    kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o [json|yaml] | \
    kubeseal \
      --controller-name=sealed-secrets \
      --controller-namespace=default \
      --format yaml > mysealedsecret.[json|yaml]

2. Apply the sealed secret

        kubectl create -f mysealedsecret.[json|yaml]

3. Running 'kubectl get secret secret-name -o [json|yaml]' will show the decrypted secret that was generated from the sealed secret.

**Both the SealedSecret and generated Secret must have the same name and namespace.**