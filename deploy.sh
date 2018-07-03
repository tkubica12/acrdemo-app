# Deploy base image and automated builds in acr
## Follow instructions in https://github.com/tkubica12/acrdemo-base.git

# Automated app build
az acr build-task create \
    --registry tomasacrdemo \
    --name appautobuild \
    --image app:{{.Build.ID}} \
    --context https://github.com/tkubica12/acrdemo-app.git \
    --branch master \
    --git-access-token $GIT_PAT

az acr build-task run --registry tomasacrdemo --name appautobuild

az acr build-task logs --registry tomasacrdemo

# Test automated build when new code is commited
# Test automated build when base image is changed

az acr build-task list-builds --registry tomasacrdemo -o table
BUILD ID    TASK           PLATFORM    STATUS     TRIGGER       STARTED               DURATION
----------  -------------  ----------  ---------  ------------  --------------------  ----------
abh         appautobuild   Linux       Succeeded  Image Update  2018-07-02T13:57:57Z  00:01:05
abg                        Linux       Succeeded  Manual        2018-07-02T13:57:16Z  00:00:40
abf         appautobuild   Linux       Succeeded  Git Commit    2018-07-02T13:55:05Z  00:00:50
abe         appautobuild   Linux       Succeeded  Manual        2018-07-02T13:53:02Z  00:00:50
abd                        Linux       Succeeded  Manual        2018-07-02T13:50:39Z  00:00:55