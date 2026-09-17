resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash

  dnf install -y httpd

  cat <<'HTML' > /var/www/html/index.html
  <!DOCTYPE html>
  <html>
  <head>
    <title>AWS CI/CD Demo</title>
  </head>
  <body>
    <h1>Hello from AWS EC2!</h1>
    <p>Apache was configured automatically using Terraform user_data.</p>
  </body>
  </html>
  HTML

  systemctl enable httpd
  systemctl start httpd
  EOF


  iam_instance_profile = aws_iam_instance_profile.ec2_ssm.name

  tags = {
    Name = "aws-cicd-demo-ec2"
  }
}