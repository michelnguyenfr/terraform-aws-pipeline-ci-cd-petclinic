terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  access_key = var.access_key # la clé d’accès crée pour l'utilisateur qui sera utilisé par terraform
  secret_key = var.secret_key # la clé sécrète crée pour l'utilisateur qui sera utilisé par terraform
}

module "roles" {
  source = "./modules/roles"
  json_path = "./modules/roles/build-policy.json"
}

module "parameter_store" {
  source = "./modules/parameter_store"
  cluster_name = var.cluster_name
  docker_username = var.docker_username
  docker_password = var.docker_password
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

module "codebuild_build" {
  source = "./modules/codebuild_build"
  build_role_arn = module.roles.build_role_arn
  github_token = var.github_token
}

module "codebuild_deploy" {
  source = "./modules/codebuild_deploy"
  build_role_arn = module.roles.build_role_arn
  github_token = var.github_token
}

module "codepipeline" {
  source = "./modules/codepipeline"
  github_token = var.github_token
}