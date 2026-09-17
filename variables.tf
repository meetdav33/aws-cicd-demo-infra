variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "deployment_bucket_name" {
  description = "S3 bucket used for deployment artifacts"
  type        = string
}

variable "github_subject" {
  description = "GitHub Actions OIDC subject allowed to assume the AWS role"
  type        = string
}

variable "alb_subnet_1_id" {
  description = "First subnet ID for the Application Load Balancer"
  type        = string
}

variable "alb_subnet_2_id" {
  description = "Second subnet ID for the Application Load Balancer"
  type        = string
}