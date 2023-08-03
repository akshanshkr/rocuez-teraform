output "rds-cluster-endpoint" {
  value = aws_rds_cluster.rds-cluster.endpoint
}

output "rds-cluster-id" {
  value = aws_rds_cluster.rds-cluster.id
}

output "rds-cluster-arn" {
  value = aws_rds_cluster.rds-cluster.arn
}