resource "aws_ssm_parameter" "cluster_name" {
    name  = "PETCLINIC_EKS_CLUSTER_NAME"
    type  = "String"
    value = var.cluster_name
}

resource "aws_ssm_parameter" "docker_username" {
    name  = "PETCLINIC_DOCKER_USERNAME"
    type  = "SecureString"
    value = var.docker_username
}

resource "aws_ssm_parameter" "docker_password" {
    name  = "PETCLINIC_DOCKER_PASSWORD"
    type  = "SecureString"
    value = var.docker_password
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