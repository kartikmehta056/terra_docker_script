resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "My-terra"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.myvpc.id
}
resource "aws_subnet" "public_subnet_az1" {
  tags = {
    Name = "Web_subnet_az1"
  }
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  depends_on              = [aws_vpc.myvpc]
}

resource "aws_subnet" "public_subnet_az2" {
  tags = {
    Name = "Web_subnet_az2"
  }
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  depends_on              = [aws_vpc.myvpc]
}

