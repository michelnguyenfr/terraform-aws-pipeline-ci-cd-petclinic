output "cluster_name" { aws_ssm_parameter.cluster_name.value }
output "docker_credentials" { aws_ssm_parameter.docker_credentials.value }
output "access_key" { aws_ssm_parameter.access_key.value }
output "secret_key" { aws_ssm_parameter.secret_key.value }
output "region" { aws_ssm_parameter.region.value }