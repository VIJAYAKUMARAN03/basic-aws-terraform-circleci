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
#### Important Note : Environment variable name should be as it is as above mentioned(case sensitive).

## Step : 5 
### Pull your newly created repo.

## Step : 6
### Then add the files from this repo(my repo) to your repo.

## Step : 7
### Check and verify once the values of the variables in variables.tf, qa.tfvars, dev.tfvars, prod.tfvars files. Especailly check the ai instance_type values.

## Step : 8
### And then give git add, commit and push to your repo. 

### Then you can see the pipeline output in the circleci in the project's dashboard session.
