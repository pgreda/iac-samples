resource "aws_vpc" "bar_vpc" {
  cidr_block = "172.17.0.0/16"
  tags = {
    Name = "bar-vpc-example"
  }
}

resource "aws_security_group" "allow_rdp" {
  name = "allow_rdp"
  description = "Allow RDP inbound traffic"
  vpc_id = aws_vpc.bar_vpc.id
  ingress {
    description = "TCP from VPC"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    ipv6_cidr_blocks = [
      "::/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
