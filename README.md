# Terraform and CircleCI Integration for AWS

This guide outlines the steps to integrate Terraform with CircleCI for managing AWS infrastructure.

## Introduction

This project aims to automate the provisioning and management of AWS infrastructure using Terraform and CircleCI. By following the steps outlined in this guide, you'll be able to set up a seamless integration between Terraform and CircleCI, enabling you to deploy infrastructure changes automatically.

## Prerequisites

Before getting started, ensure you have the following:

- An AWS account with appropriate permissions to create and manage resources.
- Git installed on your local machine.
- A Git hosting service account (e.g., GitHub, GitLab) to host your Terraform code.
- A CircleCI account to set up continuous integration for your project.
- Important : Create a s3 bucket in AWS which is used to store the backend states of terraform.

## Getting Started

Follow the steps below to set up Terraform and CircleCI integration for managing AWS infrastructure:

### Step 1: Clone the Repository

Clone the repository containing the Terraform code to your local environment and set it as your local repository.

```bash
git clone https://github.com/VIJAYAKUMARAN03/basic-aws-terraform-circleci.git
```

Navigate to the cloned directory:

```bash
cd basic-aws-terraform-circleci
```

## Step 2 : Create a New Repository
Create a new repository in your Git hosting service to host your Terraform code.

## Step 3: Set up CircleCI
Create a CircleCI account and connect it with your Git account. Follow the prompts to integrate your repository with CircleCI, which will be shown as a project.
Link : https://circleci.com/vcs-authorize/

## Step 4: Configure Environment Variables
Set the following environment variables in CircleCI for the project:
- TF_VAR_access_key: AWS access key value
- TF_VAR_secret_key: AWS secret key value
- ENV: Choose from dev, prod, or qa to dynamically change Terraform configurations.
Note: Environment variable names are case-sensitive.
Refer : https://circleci.com/docs/set-environment-variable/

## Step 5: Pull Repository Changes
Pull the changes from your newly created repository.
```bash
git pull origin main
```

## Step 6: Add Files to Your Repository
Add the necessary files from the cloned repository to your newly created repository.
```bash
git add .
```

## Step 7: Verify Configuration Files
Check and verify the values of the variables in variables.tf, qa.tfvars, dev.tfvars, and prod.tfvars files. Ensure to verify the instance_type values, especially.

## Step 8: Commit and Push Changes
Commit your changes and push them to your repository.
```bash
git commit -m "Initial commit with Terraform files"
git push origin main
```

After pushing changes, monitor the pipeline output in the CircleCI dashboard to ensure successful execution.


## Thanks for reading, Have a nice day!
