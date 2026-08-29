resource "aws_iam_role" "ec2_ssm" {
  name        = "aws-cicd-demo-ec2-ssm-role"
  description = "Allows EC2 instances to call AWS services on your behalf."

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  max_session_duration = 3600
}

resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.ec2_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy" "ec2_s3_download" {
  name = "aws-cicd-demo-ec2-s3-download"
  role = aws_iam_role.ec2_ssm.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.deployment.arn}/deployments/*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_ssm" {
  name = "aws-cicd-demo-ec2-ssm-role"
  role = aws_iam_role.ec2_ssm.name
}