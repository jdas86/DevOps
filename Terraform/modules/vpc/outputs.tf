output "vpc_id" {
    value = aws_vpc.jd-vpc.id
  
}


output "subnet_id" {
  value = aws_subnet.jd-subnet.id
}