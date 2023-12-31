resource "aws_security_group" "Pub_sg" {
  name        = "Pub_sg"
  description = "Allow inboud traffic"
  vpc_id      = aws_vpc.myvpc.id
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress  {
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress  {
    protocol   = "tcp"
    from_port  = 8080
    to_port    = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress  {
    protocol   = -1
    from_port  = 0
    to_port    = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

