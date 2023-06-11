resource "aws_route_table" "my_route_table" {
  tags = {
    Name = "My_route_table"
  }
  vpc_id = aws_vpc.myvpc.id

}
resource "aws_route_table_association" "app_route_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.my_route_table.id
}
resource "aws_route_table_association" "app_route_association-2" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_route" "mydef_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id

}
