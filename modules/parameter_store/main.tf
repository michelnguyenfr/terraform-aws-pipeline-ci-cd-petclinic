resource "aws_ssm_parameter" "cluster_name" {
    name  = "PETCLINIC_EKS_CLUSTER_NAME"
    type  = "String"
    value = var.cluster_name
    overwrite = true
}

resource "aws_ssm_parameter" "docker_credentials" {
    name  = "DOCKER_CREDENTIALS"
    type  = "SecureString"
    value = var.docker_credentials
    overwrite = true
}

resource "aws_ssm_parameter" "access_key" {
    name  = "ACCESS_KEY_ID"
    type  = "SecureString"
    value = var.access_key
    overwrite = true
}

resource "aws_ssm_parameter" "secret_key" {
    name  = "SECRET_ACCESS_KEY"
    type  = "SecureString"
    value = var.secret_key
    overwrite = true
}

resource "aws_ssm_parameter" "region" {
    name  = "PETCLINIC_REGION"
    type  = "String"
    value = var.region
    overwrite = true
}