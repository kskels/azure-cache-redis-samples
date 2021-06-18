# tekton pipeline

oc new-project dotnet-apps-prod
oc new-project dotnet-apps-dev

oc apply -f roles/
oc apply -f tasks/

oc apply -f pipelines/pipeline-dotnet-build.yaml

oc apply -f secrets/
oc patch sa pipeline --patch-file secrets/serviceaccount-pipeline-patch.yaml
