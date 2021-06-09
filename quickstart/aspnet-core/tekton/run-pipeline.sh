tkn pipeline start build-and-deploy \
    -w name=shared-workspace,volumeClaimTemplateFile=03_persistent_volume_claim.yaml \
    -p deployment-name=aspnet-core-app \
    -p git-url=https://github.com/kskels/azure-cache-redis-samples.git \
    -p IMAGE=image-registry.openshift-image-registry.svc:5000/dotnet-demo/aspnet-core-app
