variable "cluster_name" {
    type = string
    default = "eks_cluster"
}

variable "docker_username" {
    type = string
    sensitive = true
}

variable "docker_password" {
    type = string
    sensitive = true
}

variable "access_key" {
    type = string
    sensitive = true
}

variable "secret_key" {
    type = string
    sensitive = true
}

variable "region" {
    type = string
    default = "eu-west-3"
}