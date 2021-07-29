output "cluster" {
  value = aws_emr_cluster.cluster
}

output "config" {
  value = aws_emr_security_configuration.examplea
}