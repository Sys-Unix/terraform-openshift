resource "aws_security_group" "master" {
  name_prefix = "${var.cluster_name}-master-"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.cluster_name}-master-sg"
    Environment = var.environment
  }
}

resource "aws_security_group" "worker" {
  name_prefix = "${var.cluster_name}-worker-"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.cluster_name}-worker-sg"
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "master_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.master.id
}

resource "aws_security_group_rule" "master_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.master.id
}

resource "aws_security_group_rule" "worker_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.worker.id
}

resource "aws_security_group_rule" "worker_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.worker.id
}