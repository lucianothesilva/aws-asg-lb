//route table que conecta as pub subnets a internet
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gtw.id
  }
}

// associa a route table com a subnet publica 1
resource "aws_route_table_association" "rta_1a" {
  subnet_id      = aws_subnet.pub_subnet_1a.id
  route_table_id = aws_route_table.pub_rt.id
}
// associa a route table com a subnet publica 2
resource "aws_route_table_association" "rta_1b" {
  subnet_id      = aws_subnet.pub_subnet_1b.id
  route_table_id = aws_route_table.pub_rt.id
}

// route table que conecta ao nat para funcionamento da rede privada (onde estão as intâncias)
resource "aws_route_table" "priv_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.priv_sub_nat.id
  }
}

//associa a route table com a subnet privada
resource "aws_route_table_association" "rt_ass_3" {
  subnet_id      = aws_subnet.priv_subnet_1a.id
  route_table_id = aws_route_table.priv_rt.id
}