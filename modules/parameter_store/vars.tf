variable "cluster_name" { type = string }
variable "region" { type = string }

variable "docker_credentials" {
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

