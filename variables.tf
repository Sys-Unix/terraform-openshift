variable "aws_region" {
  description = "Região AWS para criar os recursos"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Nome do cluster OpenShift"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev/prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Zonas de disponibilidade"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "openshift_version" {
  description = "Versão do OpenShift"
  type        = string
  default     = "4.12"
}

variable "cluster_machine_type" {
  description = "Tipo de instância para os nodes"
  type        = string
  default     = "m5.xlarge"
}

variable "worker_count" {
  description = "Número de workers"
  type        = number
  default     = 3
}