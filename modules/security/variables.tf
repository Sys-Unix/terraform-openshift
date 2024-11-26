variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "cluster_name" {
  type        = string
  description = "Nome do cluster"
}

variable "environment" {
  type        = string
  description = "Ambiente (dev/prod)"
}