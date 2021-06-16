# argocd demo


oc new-project dotnet-apps-prod
oc new-project dotnet-apps-dev

oc apply -f rolebindings/
