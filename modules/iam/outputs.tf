output "master_role_arn" {
  value = aws_iam_role.master.arn
}

output "worker_role_arn" {
  value = aws_iam_role.worker.arn
}