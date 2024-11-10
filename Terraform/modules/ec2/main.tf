resource "aws_instance" "jd-ec2-instance" {
  ami           = data.aws_ami.amazon-2.id
  instance_type = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnets

  tags = {
    Name = "jd-ec2-instance"
  }
}