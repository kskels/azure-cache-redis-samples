
oc new-project dotnet-apps
oc new-app --name aspnet-core-redis --docker-image=registry.redhat.io/rhel8/redis-6

# docker
oc new-build --name aspnet-core-app \
  --strategy=docker \
  --context-dir quickstart/aspnet-core \
  https://github.com/kskels/azure-cache-redis-samples.git

# s2i
oc new-build --name aspnet-core-app \
  --context-dir quickstart/aspnet-core/ContosoTeamStats \
  openshift/dotnet:5.0-ubi8~https://github.com/kskels/azure-cache-redis-samples.git

# binary
oc new-build --binary --strategy docker --name aspnet-core-app 
oc start-build aspnet-core-app --from-dir .

oc new-app --name aspnet-core-app --image-stream aspnet-core-app
oc expose service aspnet-core-app
