export LOCATION=europe-west1
export key_gcloud=gcloud
export KEY=tekton-chains
export KEYRING=binauthz
export VERIFIER_SA=image-builder@galloro-demos.iam.gserviceaccount.com
export CHAINS_NS=tekton-chains
export KEY_VERSION=1
export PROJECT=galloro-demos
export PROJECT_ID=galloro-demos
export KEY_PROJECT=galloro-demos
export KMS_URI="gcpkms://projects/${KEY_PROJECT}/locations/${LOCATION}/keyRings/${KEYRING}/cryptoKeys/${KEY}/cryptoKeyVersions/${KEY_VERSION}"
export IDENTITY=https://kubernetes.io/namespaces/tekton-chains/serviceaccounts/tekton-chains-controller
export ISSUER=https://container.googleapis.com/v1/projects/galloro-demos/locations/europe-west1/clusters/gke-cluster
export IMAGE=europe-west1-docker.pkg.dev/galloro-demos/tektoncd/sample-app
export GIT_URL=https://github.com/ggalloro/s3c-tekton-sigstore
export BUILDER=image-builder
export BUILDER_SA=image-builder@galloro-demos.iam.gserviceaccount.com
kubectl apply -f '/Users/galloro/s3c-tekton-sigstore/tekton-assets'
tkn pr delete --all -f && tkn tr delete --all -f
kubectl apply -f '/Users/galloro/s3c-tekton-sigstore/config-kms.yaml'
kubectl delete po -n tekton-chains -l app=tekton-chains-controller

