resource "aws_key_pair" "Mykey" {
  key_name   = "Mykey"
  public_key = file("${path.module}/id_rsa.pub")

}