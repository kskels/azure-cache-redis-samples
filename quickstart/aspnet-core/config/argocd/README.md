# argocd demo


oc new-project dotnet-apps-prod
oc new-project dotnet-apps-dev
oc new-project dotnet-gitops

oc apply -f rolebindings/
