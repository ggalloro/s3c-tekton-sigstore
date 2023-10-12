# s3c-tekton-sigstore

1. kubectl apply -f '/Users/galloro/s3c-tekton-sigstore/tekton-assets'
2. Echo $GIT_URL
3. Echo $IMAGE
4. tkn pipeline start pipeline-clone-and-build --workspace name=source,claimName=source-pvc -s image-builder  --param image-name=$IMAGE --param git-url=$GIT_URL  --showlog
6. tkn pr describe --last 
7. k -n tekton-chains describe cm chains-config 
10. export IMAGE_REF=
11. gcloud artifacts docker images describe $IMAGE_REF --show-all-metadata --format json | jq -r '.provenance_summary.provenance[0].envelope.payload' | tr '\-_' '+/' | base64 -d | jq
14. k apply -f '/Users/galloro/s3c-tekton-sigstore/config-sigstore.yaml'
15. tkn pr delete --all -f && tkn tr delete --all -f
16. kubectl delete po -n tekton-chains -l app=tekton-chains-controller
17. tkn pipeline start pipeline-clone-and-build --workspace name=source,claimName=source-pvc -s image-builder  --param image-name=$IMAGE --param git-url=$GIT_URL  --showlog
19. cosign verify --certificate-identity=$IDENTITY --certificate-oidc-issuer=$ISSUER $IMAGE | jq
20. cosign verify-attestation --certificate-identity=$IDENTITY --certificate-oidc-issuer=$ISSUER --type slsaprovenance $IMAGE | jq
22. rekor-cli search --sha digest
24. rekor-cli get --uuid UUID --format json | jq -r .Attestation | jq
