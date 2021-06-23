# App Deployment

```bash
oc new-project dotnet-apps-dev
oc new-app --name aspnet-core-redis --docker-image=registry.redhat.io/rhel8/redis-6
```

# docker
```bash
oc new-build --name aspnet-core-app \
  --strategy=docker \
  --context-dir quickstart/aspnet-core \
  https://github.com/kskels/azure-cache-redis-samples.git
```

# s2i
```bash
oc new-build --name aspnet-core-app \
  --context-dir quickstart/aspnet-core/ContosoTeamStats \
  openshift/dotnet:5.0-ubi8~https://github.com/kskels/azure-cache-redis-samples.git
```

# binary
```bash
oc new-build --binary --strategy docker --name aspnet-core-app 
oc start-build aspnet-core-app --from-dir .

oc new-app --name aspnet-core-app --image-stream aspnet-core-app
oc expose service aspnet-core-app
```


# deploy to prod
```bash
oc new-project dotnet-apps-prod
oc policy add-role-to-user -n dotnet-apps-dev \
  system:image-puller \
  system:serviceaccount:dotnet-apps-prod:default

oc new-app --name aspnet-core-redis --docker-image=registry.redhat.io/rhel8/redis-6

oc tag dotnet-apps-dev/aspnet-core-app:latest aspnet-core-app:v1.0
oc new-app --name aspnet-core-app --image-stream aspnet-core-app:v1.0
oc expose service aspnet-core-app
```

# autoscale
```bash
oc autoscale --name aspnet-core-hpa \
  --min 1 \
  --max 10 \
  --cpu-percent 75 \
  deploy/aspnet-core-app

oc apply -f deploy/base/aspnet-core-hpa.yaml

# load generation
hey -n 200000 -c 10 https://aspnet-core-app-dotnet-apps-dev.apps.ocp4.kskels.com/Home/RedisCache
```
