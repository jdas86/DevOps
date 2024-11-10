resource "aws_security_group" "jd-sg" {
  name        = "jd-sg"
  description = "Security group to allow HTTP and SSH inbound traffic"
  vpc_id      = var.vpc_id  # Replace with your VPC ID or pass it as a variable

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from any IP address (you can restrict this)
  }
  
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP address (you can restrict this)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "jd-sg"
  }



}
