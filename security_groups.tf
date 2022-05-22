resource "aws_security_group" "Terraform_Agent" {
  name        = "Terraform_Agent"
  description = "Terraform_Agent servers"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "Terraform_Agent-ssh" {
  security_group_id = aws_security_group.Terraform_Agent.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.inbound_ssh_cidr_block]
}

resource "aws_security_group_rule" "Terraform_Agent-egress" {
  security_group_id = aws_security_group.Terraform_Agent.id
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}