variable "pipelines" {
  default = [
    {
      name          = "pipeline-customers"
      github_owner  = "michelnguyenfr"
      github_repo   = "spring-petclinic-customers"
      branch        = "master"
      build         = "petclinic-customers-build"
      deploy        = "petclinic-customers-deploy"
    },
    {
      name          = "pipeline-visits"
      github_owner  = "michelnguyenfr"
      github_repo   = "spring-petclinic-visits"
      branch        = "master"
      build         = "petclinic-visits-build"
      deploy        = "petclinic-visits-deploy"
    },
    {
      name          = "pipeline-vets"
      github_owner  = "michelnguyenfr"
      github_repo   = "spring-petclinic-vets"
      branch        = "master"
      build         = "petclinic-vets-build"
      deploy        = "petclinic-vets-deploy"
    },
    {
      name          = "pipeline-api-gateway"
      github_owner  = "michelnguyenfr"
      github_repo   = "spring-petclinic-api-gateway"
      branch        = "master"
      build         = "petclinic-api-gateway-build"
      deploy        = "petclinic-api-gateway-deploy"
    }
  ]
}

variable "s3_bucket" {
    type = string
    default= "codepipeline-eu-west-3-775846151645"
}

variable "pipeline_role_arn" {
    type = string
}

variable "github_token" { type = string }