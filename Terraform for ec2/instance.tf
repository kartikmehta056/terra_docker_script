
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}





resource "aws_instance" "first_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro" 
  key_name               = aws_key_pair.Mykey.key_name
  vpc_security_group_ids = ["${aws_security_group.Pub_sg.id}"]
  subnet_id = aws_subnet.public_subnet_az1.id
  tags = {
    Name = "ubuntu"
  }
  user_data = file("${path.module}/data.sh")
 
}