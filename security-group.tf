resource "aws_security_group" "web" {
  name        = "launch-wizard-1"
  description = "launch-wizard-1 created 2026-08-21T19:43:05.988Z"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "launch-wizard-1"
  }
}