data "aws_ami" "amazon-2" {
  most_recent = true
  owners      = ["amazon"]  # Amazon's official AMI owner ID
  
  # Flexible filter to capture all Amazon Linux 2 AMIs in your region
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Match all Amazon Linux 2 AMIs
  }

  # Optional: If your AWS provider is region-specific, ensure it's set to the correct one
  provider = aws
}


data "aws_availability_zone" "available" {
    name = "us-east-1a"
  
}




