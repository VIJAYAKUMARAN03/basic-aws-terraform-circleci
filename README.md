# Sample-terraform
## Step : 1
### Pull the code into your local and then set this code as local repo.
## Step : 2
### Create a new repo in your git.
## Step : 3
### Create a circleci with your git account and follow the created repo(which will be shown as a project).
## Step : 4
### Set the environment varibles in circleci for the project as,
- TF_VAR_access_key = (value of your aws access key)
- TF_VAR_secret_key = (value of your aws secret key)
- ENV = value of anyone of 3 (dev or prod or qa) used for changing the terraform code dynamically.
#### Important Note : Environment varible name should be as it is as above mentioned.
## Step : 5 
### From local give git push. 

### Then you can see the pipeline output in the circleci.
