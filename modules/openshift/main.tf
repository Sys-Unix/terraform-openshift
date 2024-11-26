resource "aws_instance" "master" {
  count                  = 3
  ami                    = data.aws_ami.rhcos.id
  instance_type          = var.cluster_machine_type
  subnet_id              = var.private_subnets[count.index]
  vpc_security_group_ids = [var.master_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.master.name

  root_block_device {
    volume_size = 100
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.cluster_name}-master-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_instance" "worker" {
  count                  = var.worker_count
  ami                    = data.aws_ami.rhcos.id
  instance_type          = var.cluster_machine_type
  subnet_id              = var.private_subnets[count.index % length(var.private_subnets)]
  vpc_security_group_ids = [var.worker_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.worker.name

  root_block_device {
    volume_size = 100
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.cluster_name}-worker-${count.index + 1}"
    Environment = var.environment
  }
}

data "aws_ami" "rhcos" {
  most_recent = true
  owners      = ["309956199498"] # Red Hat's account ID

  filter {
    name   = "name"
    values = ["RHCOS-${var.openshift_version}*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}