output "cluster_name" { value = aws_ssm_parameter.cluster_name.value }
output "docker_credentials" { value = aws_ssm_parameter.docker_credentials.value }
output "access_key" { value = aws_ssm_parameter.access_key.value }
output "secret_key" { value = aws_ssm_parameter.secret_key.value }
output "region" { value = aws_ssm_parameter.region.value }