module "vpc" {
  source = "./modules/vpc"

  cluster_name        = var.cluster_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  environment        = var.environment
}

module "security" {
  source = "./modules/security"

  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
  environment  = var.environment
}

module "openshift" {
  source = "./modules/openshift"

  cluster_name        = var.cluster_name
  environment         = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnets    = module.vpc.private_subnets
  public_subnets     = module.vpc.public_subnets
  master_sg_id       = module.security.master_security_group_id
  worker_sg_id       = module.security.worker_security_group_id
  master_role_arn    = module.iam.master_role_arn
  worker_role_arn    = module.iam.worker_role_arn
  openshift_version  = var.openshift_version
  cluster_machine_type = var.cluster_machine_type
  worker_count       = var.worker_count
}