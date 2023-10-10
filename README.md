# terraform-aws-pipeline-ci-cd-petclinic
Terraform files to build the Petclinic CI/CD pipeline

To use the Terraform files, you must input your AWS access keys through a vars file.
The vars file must contain the following variables:
- access_key: access key to your AWS account
- secret_key: secret key to your AWS account
- github_token: auth token to your Petclinic microservices repo
