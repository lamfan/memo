# INIT PROJECT #
PROJECT="abc"
echo "netqrjaslffln4dfoxhcm3lngsxiypuo7wgj6swlihqip4nsfgea" | az devops login --organization https://dev.azure.com/WorldFamilyHK/
az devops project create --name $PROJECT --org https://dev.azure.com/WorldFamilyHK/ --source-control git
git init 
git add .
git commit -m init
git remote add origin git@ssh.dev.azure.com:v3/WorldFamilyHK/$PROJECT/$PROJECT
git push -u origin --all
az devops service-endpoint create --service-endpoint-configuration ServiceEndpointConfiguration.json --project $PROJECT


#LOGIN
echo "netqrjaslffln4dfoxhcm3lngsxiypuo7wgj6swlihqip4nsfgea" | az devops login --organization https://dev.azure.com/WorldFamilyHK/

#SHOW
az devops project show --project Test

#LIST
az repos list --project Cat

az repos pr list --project Cat --repository Cat

#PUll
az repos pr create --project Cat --reviewers KelvinLiu@WorldFamilyEnglish.com --repository Cat  --source-branch index4 --target-branch master --delete-source-branch true