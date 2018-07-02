# Deploy base image and automated builds in acr
## Follow instructions in https://github.com/tkubica12/acrdemo-base.git

# Automated app build
az acr build-task create \
    --registry tomasacrdemo \
    --name appautobuild \
    --image base:{{.Build.ID}} \
    --context https://github.com/tkubica12/acrdemo-app.git \
    --branch master \
    --git-access-token $GIT_PAT

az acr build-task run --registry tomasacrdemo --name appautobuild