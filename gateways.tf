resource "aws_internet_gateway" "internet_gtw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "eip" {
  depends_on = [aws_internet_gateway.internet_gtw]
  domain     = "vpc"
  tags = {
    Name = var.eip_name
  }
}

resource "aws_nat_gateway" "priv_sub_nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pub_subnet_1b.id

  tags = {
    Name = var.priv_sub_nat_name
  }

  depends_on = [aws_internet_gateway.internet_gtw]
}

