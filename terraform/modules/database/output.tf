output "security_group_id" {
    value = aws_security_group.bastion_sg.id
}  

output "database_name" {
  value = var.db_name
}

output "database_username" {
  value = var.db_user
}

output "database_port" {
  value = aws_rds_cluster.postgresql.port
}

output "database_kms_key_arn" {
  value = aws_kms_key.this.arn
}