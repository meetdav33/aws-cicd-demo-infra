resource "aws_security_group" "web" {

  name = "aws-cicd-demo-web-sg"
  description = "Security group for AWS CI/CD demo EC2 Instance"

  vpc_id = var.vpc_id

  lifecycle {
  create_before_destroy = true
}

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
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


resource "aws_security_group" "alb" {

  name        = "aws-cicd-demo-alb-sg"
  description = "Security group for AWS CI/CD demo Application Load Balancer"

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
}
