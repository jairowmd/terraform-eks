
# criando subnets publicas availability_zone = "us-east-1a"
resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id = aws_vpc.eks_vpc.id
  # informado no arquivo var o cidr de referencia para o calculo
  cidr_block = cidrsubnet(var.cidr_block, 8, 1)
  # variavel em region.tf
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true



  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name                    = "${var.project_name}-pub-subnet-1a",
      "kubernets.io/role/elb" = 1

    }

  )

}




# criando subnet availability_zone = "us-east-1b"
resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id = aws_vpc.eks_vpc.id
  # informado no arquivo var o cidr de referencia para o calculo
  cidr_block = cidrsubnet(var.cidr_block, 8, 2)
  # variavel em region.tf
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name                    = "${var.project_name}-pub-subnet-1b",
      "kubernets.io/role/elb" = 1

    }

  )
}

# criando route_table_association para linkar a subnet com a route table


resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}