resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2_ssm.name

  tags = {
    Name = "aws-cicd-demo-ec2"
  }
}