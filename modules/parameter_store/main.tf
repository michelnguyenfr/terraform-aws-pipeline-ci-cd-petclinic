import {
  to = aws_ssm_parameter.cluster_name
  id = "PETCLINIC_EKS_CLUSTER_NAME"
}

resource "aws_ssm_parameter" "cluster_name" {
    name  = "PETCLINIC_EKS_CLUSTER_NAME"
    type  = "String"
    value = var.cluster_name
}


import {
  to = aws_ssm_parameter.docker_credentials
  id = "DOCKER_CREDENTIALS"
}

resource "aws_ssm_parameter" "docker_credentials" {
    name  = "DOCKER_CREDENTIALS"
    type  = "SecureString"
    value = var.docker_credentials
}

import {
  to = aws_ssm_parameter.access_key
  id = "DOCKER_CREDENTIALS"
}

resource "aws_ssm_parameter" "access_key" {
    name  = "ACCESS_KEY_ID"
    type  = "SecureString"
    value = var.access_key
}

import {
  to = aws_ssm_parameter.secret_key
  id = "SECRET_ACCESS_KEY"
}

resource "aws_ssm_parameter" "secret_key" {
    name  = "SECRET_ACCESS_KEY"
    type  = "SecureString"
    value = var.secret_key
}

import {
  to = aws_ssm_parameter.region
  id = "PETCLINIC_REGION"
}

resource "aws_ssm_parameter" "region" {
    name  = "PETCLINIC_REGION"
    type  = "String"
    value = var.region
}