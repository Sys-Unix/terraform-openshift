resource "aws_vpc" "openshift" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.cluster_name}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.openshift.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.cluster_name}-private-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.openshift.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.cluster_name}-public-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "openshift" {
  vpc_id = aws_vpc.openshift.id

  tags = {
    Name        = "${var.cluster_name}-igw"
    Environment = var.environment
  }
}

resource "aws_eip" "nat" {
  count = length(var.availability_zones)
  vpc   = true

  tags = {
    Name        = "${var.cluster_name}-eip-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "openshift" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name        = "${var.cluster_name}-nat-${count.index + 1}"
    Environment = var.environment
  }
}