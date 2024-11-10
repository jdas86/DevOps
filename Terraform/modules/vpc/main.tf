#vpc
resource "aws_vpc" "jd-vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    "Name"="jd-vpc"
  }
}



#subnets
resource "aws_subnet" "jd-subnet" {
  vpc_id     = aws_vpc.jd-vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = data.aws_availability_zone.available.name
  map_public_ip_on_launch = true


  tags = {
    Name = var.subnet_name
  }
}


#Internet gateway

resource "aws_internet_gateway" "jd-igw" {
  vpc_id = aws_vpc.jd-vpc.id

  tags = {
    Name = "jd-igw"
  }
}


#Route table

resource "aws_route_table" "jd-route-table" {
  vpc_id = aws_vpc.jd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jd-igw.id
  }

  tags = {
    Name = "jd-route-table"
  }
}


#Route table association


resource "aws_route_table_association" "jd-rta" {
  subnet_id      = aws_subnet.jd-subnet.id
  route_table_id = aws_route_table.jd-route-table.id
}
