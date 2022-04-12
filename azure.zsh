# INIT PROJECT #
PROJECT="abc"
echo "netqrjaslffln4dfoxhcm3lngsxiypuo7wgj6swlihqip4nsfgea" | az devops login --organization https://dev.azure.com/WorldFamilyHK
az devops configure --defaults organization=https://dev.azure.com/WorldFamilyHK project=$PROJECT
az devops project create --name $PROJECT --source-control git

git init 
git add .
git commit -m init
git remote add origin git@ssh.dev.azure.com:v3/WorldFamilyHK/$PROJECT/$PROJECT
git push -u origin --all
az devops service-endpoint create --service-endpoint-configuration ServiceEndpointConfiguration.json --project $PROJECT
az pipelines create --name $PROJECT --yml-path azure-pipelines.yml --project $PROJECT --repository $PROJECT --repository-type tfsgit 


az pipelines release create --project 'abc' --definition-name 'abc'



az pipelines create --name "abc" --yml-path azure-pipelines.yml --project "abc" --repository "abc" --repository-type tfsgit
az devops security group list -p 'abc' --org 'https://dev.azure.com/WorldFamilyHK'

#LOGIN
echo "netqrjaslffln4dfoxhcm3lngsxiypuo7wgj6swlihqip4nsfgea" | az devops login --organization https://dev.azure.com/WorldFamilyHK/

#SHOW
az devops project show --project Test

#LIST
az repos list --project Cat
az repos pr list --project Cat --repository Cat

#PUll
az repos pr create --project Cat --reviewers KelvinLiu@WorldFamilyEnglish.com --repository Cat  --source-branch index4 --target-branch master --delete-source-branch true

#PIPELINE
az pipelines list --project 'abc'

#PIPELINE RELEASE
az pipelines release definition list --project 'abc'