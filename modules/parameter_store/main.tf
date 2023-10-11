resource "aws_ssm_parameter" "cluster_name" {
    name  = "PETCLINIC_EKS_CLUSTER_NAME"
    type  = "String"
    value = var.cluster_name
}

resource "aws_ssm_parameter" "docker_credentials" {
    name  = "DOCKER_CREDENTIALS"
    type  = "SecureString"
    value = var.docker_credentials
}

resource "aws_ssm_parameter" "access_key" {
    name  = "ACCESS_KEY_ID"
    type  = "SecureString"
    value = var.access_key
}

resource "aws_ssm_parameter" "secret_key" {
    name  = "SECRET_ACCESS_KEY"
    type  = "SecureString"
    value = var.secret_key
}

resource "aws_ssm_parameter" "region" {
    name  = "PETCLINIC_REGION"
    type  = "SecureString"
    value = var.region
}