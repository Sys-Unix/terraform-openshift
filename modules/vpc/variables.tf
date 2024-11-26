variable "vpc_cidr" {
  type        = string
  description = "CIDR da VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade"
}

variable "cluster_name" {
  type        = string
  description = "Nome do cluster"
}

variable "environment" {
  type        = string
  description = "Ambiente (dev/prod)"
}