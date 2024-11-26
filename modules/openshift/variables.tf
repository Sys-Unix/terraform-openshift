variable "cluster_name" {
  type        = string
  description = "Nome do cluster"
}

variable "environment" {
  type        = string
  description = "Ambiente (dev/prod)"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "IDs das subnets privadas"
}

variable "public_subnets" {
  type        = list(string)
  description = "IDs das subnets públicas"
}

variable "master_sg_id" {
  type        = string
  description = "ID do security group master"
}

variable "worker_sg_id" {
  type        = string
  description = "ID do security group worker"
}

variable "master_role_arn" {
  type        = string
  description = "ARN da role master"
}

variable "worker_role_arn" {
  type        = string
  description = "ARN da role worker"
}

variable "openshift_version" {
  type        = string
  description = "Versão do OpenShift"
}

variable "cluster_machine_type" {
  type        = string
  description = "Tipo de instância para os nodes"
}

variable "worker_count" {
  type        = number
  description = "Número de workers"
}